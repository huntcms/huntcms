module app.lib.cache.TmpCache;

// import tmpConf = hunt.framework.application.ApplicationConfig;
import hunt.framework.application.Application;
import hunt.cache.ucache;
import hunt.util.Configuration;
import hunt.util.Serialize;
// import std.json;
import hunt.logging;
import app.component.system.repository.LanguageRepository;
import app.component.system.model.Language;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;
import app.component.document.repository.NodeRepository;
import app.component.document.model.Node;
import app.component.document.repository.ItemMiniRepository;
import app.component.document.model.ItemMini;
import app.component.document.repository.DocumentRepository;
import app.component.document.model.Document;
import app.component.document.repository.ItemRepository;
import app.component.document.model.Item;
import app.component.document.helper.FrontMenu;
import app.component.document.helper.TopMenu;

import app.component.project.repository.ProjectRepository;
import app.component.project.model.Project;
import app.component.project.repository.ProjectMiniRepository;
import app.component.project.model.ProjectMini;

import std.math;

class TmpCache {

    private UCache _cache;
    string[] tempRedisKey = ["banner"];
    string[] tempMemcachedKey = [];

    this(){
        _cache = Application.getInstance().cache();
    }

    Banner[] getBanner(string keyword, bool isReset = false){
        auto cacheData = _cache.get!(Banner[])("banners");
        Banner[] result;
        Banner[] allDatas;
        if(!cacheData || isReset){
            logInfo("非缓存-banner");
            allDatas = (new BannerRepository).findAllData();
            _cache.put("banners", allDatas, 86400);//缓存1天
        }else{
            logInfo("缓存-banner");
            allDatas = cacheData;
        }
        foreach(banner; allDatas){
            if(keyword == banner.keyword){
                result ~= banner;
            }
        }
        // logInfo(result);
        return result;
    }

    string getNodeIdsByDocumentId(int docId, bool isReset = false){
        string result;
        string cacheKey = "doc_" ~ docId.to!string ~ "_nodes_ids";
        if(!isReset)
            result = _cache.get!(string)(cacheKey);

        if(!result || isReset){
            logInfo("非缓存数据-" ~ cacheKey);
            result = (new NodeRepository).findAllIdsByDocId(docId);
            _cache.put(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据-" ~ cacheKey);
        }

        logInfo(result);
        return result;
    }

    Item findItemByNodeSign(string nodeSign, int docId, int findLang, bool isReset = false){
        
        Item result;
        string cacheKey = "doc_" ~ docId.to!string ~ "_language_" ~ findLang.to!string ~ "_sign_" ~ nodeSign ~ "_item";
        if(!isReset)
            result = _cache.get!(Item)(cacheKey);

        if(!result || isReset){
            logInfo("非缓存数据-" ~ cacheKey);
            logInfo("findCurrectNode - " ~ nodeSign ~ "~~~~" ~ docId.to!string);
            auto node = (new NodeRepository).findCurrectNode(nodeSign, docId);
            if(node){
                result = (new ItemRepository).findItemByNodeId(node.id);
                _cache.put(cacheKey, result, 2592000); //缓存30天
            }
        }else{
            logInfo("缓存数据-" ~ cacheKey);
        }

        logInfo(result);
        return result ? result : new Item();

    }

    bool cleanFrontMenus(int docId, int findLang){
        string cacheKey = "doc_" ~ docId.to!string ~ "_lang_" ~ findLang.to!string ~ "_menus";
        _cache.remove(cacheKey); 
        return true;
    }

    FrontMenu[] findFrontMenus(int docId, int findLang, int mainLang, bool isReset = false){

        FrontMenu[] result;
        string cacheKey = "doc_" ~ docId.to!string ~ "_lang_" ~ findLang.to!string ~ "_menus";

        // if(!isReset)
        //     result = _cache.get!(FrontMenu[])(cacheKey);
        
        if(!result || isReset){
            logInfo("非缓存数据-" ~ cacheKey);
            Node[] allNodes = (new NodeRepository).findAllSortByDocId(docId);

            string allIds = this.getNodeIdsByDocumentId(docId);
            auto tmpLang = (new ItemMiniRepository).findItemsByNodeIds(allIds, findLang);
            ItemMini[] items;
            if(findLang != mainLang){
                auto tmpMain = (new ItemMiniRepository).findItemsByNodeIds(allIds, mainLang);
                foreach(itemMini; tmpMain){
                    int isFound = 0;
                    foreach(tmp; tmpLang){
                        if(tmp.node_id == itemMini.node_id){
                            items ~= tmp;
                            isFound = 1;
                            continue;
                        }
                    }
                    if(isFound == 0){
                        items ~= itemMini;
                    }
                }    
            }else{
                items = tmpLang;
            }
            foreach(nodeL1; allNodes){
                if(nodeL1.parent_id == 0){
                    auto fMenuL1 = new FrontMenu();
                    fMenuL1.node = nodeL1;
                    foreach(item; items){
                        if(item.node_id == nodeL1.id){
                            fMenuL1.item = item;
                            continue;
                        }
                    }
                    foreach(nodeL2; allNodes){
                        if(nodeL2.parent_id == nodeL1.id){
                            auto fMenuL2 = new FrontMenu();
                            fMenuL2.node = nodeL2;
                            foreach(item; items){
                                if(item.node_id == nodeL2.id){
                                    fMenuL2.item = item;
                                    continue;
                                }
                            }
                            foreach(nodeL3; allNodes){
                                if(nodeL3.parent_id == nodeL2.id){
                                    auto fMenuL3 = new FrontMenu();
                                    fMenuL3.node = nodeL3;
                                    foreach(item; items){
                                        if(item.node_id == nodeL3.id){
                                            fMenuL3.item = item;
                                            continue;
                                        }
                                    }
                                    fMenuL2.children ~= fMenuL3;
                                }
                            }
                            fMenuL1.children ~= fMenuL2;
                        }
                    }
                    result ~= fMenuL1;
                }
            }
            _cache.put(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据-" ~ cacheKey);
        }
        logInfo(result);
        return result;
    }

    TopMenu[] getTopMenu(bool isReset = false){
        
        TopMenu[] result;
        string cacheKey = "top_menu_documentation";

        if(!isReset)
            result = _cache.get!(TopMenu[])(cacheKey);

        if(!result || isReset){

            logInfo("非缓存数据-" ~ cacheKey);
            auto currect = (new DocumentRepository).currectList();
            auto languages = (new LanguageRepository).findAll();

            foreach(doc; currect){
                TopMenu tmp = new TopMenu();
                tmp.title = doc.project.title;
                tmp.project_id = doc.project.id;
                foreach(language; languages){

                    if(language.id == doc.main_language){
                        tmp.url = "docs/" ~ doc.project.sign ~ "-current/";
                        auto sign = (new NodeRepository).findFirstNodeSignByDocId(doc.id);
                        if(sign)
                            tmp.url ~= sign.sign_key;
                        continue;
                    }
                }
                result ~= tmp;
            }
            _cache.put(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据-" ~ cacheKey);
        }
        return result;
    }
    

    Project getProject(string sign, bool isReset = false){
        Project result;
        string cacheKey = "project_sign_" ~ sign;
        if(!isReset)
            result = _cache.get!(Project)(cacheKey);

        if(!result || isReset){
            logInfo("非缓存数据 - " ~ cacheKey);
            result = (new ProjectRepository).findDetailBySign(sign);
            _cache.put(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据 - " ~ cacheKey);
        }

        logInfo(result);
        return result;
    }
        

    int[string] getProjectMiniPage(int page = 1, int limit = 1, bool isReset = false){
        int[string] pageInfo;
        int result;
        string cacheKey = "project_mini_count";
        if(!isReset)
            result = _cache.get!(int)(cacheKey);

        if(!result || isReset){
            logInfo("非缓存数据 - " ~ cacheKey);
            result = (new ProjectMiniRepository).findCount();
            _cache.put(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据 - " ~ cacheKey);
        }

        logInfo(result);
        pageInfo["itemCount"] = result;
        pageInfo["pageCount"] = cast(int) ceil(cast(float) result/limit);
        pageInfo["currect"] = page;
        pageInfo["pageSize"] = limit;
        return pageInfo;
    }
        

    Language getOneLanguage(string keyword, bool isReset = false){
        auto cacheData = _cache.get!(Language[])("all_language");
        Language result;
        Language[] allDatas;
        if(!cacheData || isReset){
            logInfo("非缓存 - all_language");
            allDatas = (new LanguageRepository).findAll();
            _cache.put("all_language", allDatas, 86400);//缓存1天
        }else{
            logInfo("缓存 - all_language");
            allDatas = cacheData;
        }
        foreach(language; allDatas){
            if(keyword == language.sign){
                result = language;
                continue;
            }
        }
        logInfo(result);
        return result;
    }

}

