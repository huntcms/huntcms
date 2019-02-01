module app.lib.controller.BaseController;

import hunt.framework;
import hunt.logging;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import hunt.cache.ucache;
import frontConf = hunt.framework.application.ApplicationConfig;
import std.net.curl;
import std.json;
import std.algorithm.sorting;

import app.component.system.repository.LanguageRepository;
import app.component.system.model.Language;
import app.component.document.repository.NodeRepository;
import app.component.document.model.Node;
import app.component.document.repository.DocumentRepository;
import app.component.document.model.Document;
import app.component.document.helper.TopMenu;

class BaseController : Controller{

    private ConfigBuilder _configFront;
    public UCache _cache;

    this(){
        _configFront = configManager().config("hunt");
        _cache = Application.getInstance().cache();
    }

    override bool before() {
        view.assign("siteBase", _configFront.front.site.base.value);
        view.assign("topMenu", this.getTopMenu());
        logWarning(request.elapsed());
        return true;
    }

    override bool after(){
        return true;
    }

    bool pubAssign() {
        return true;
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
}