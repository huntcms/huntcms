module app.component.portal.controller.TestController;

import hunt.framework;
import std.net.curl;
import frontConf = hunt.framework.application.ApplicationConfig;
import hunt.util.Configuration;
import hunt.logging;
import std.json;
import std.algorithm.sorting;
import hunt.http.codec.http.model.HttpMethod;

import std.datetime;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;
import app.component.system.repository.LanguageRepository;
import app.component.system.model.Language;
import app.component.document.repository.NodeRepository;
import app.component.document.model.Node;
import app.component.document.repository.DocumentRepository;
import app.component.document.model.Document;
import app.component.document.helper.TopMenu;
import hunt.entity.DefaultEntityManagerFactory;

class TestController : Controller {

    mixin MakeController;

    public EntityManager _cManager;

    this() 
	{
        _cManager = defaultEntityManagerFactory().createEntityManager();
    }

    override bool before(){
        return true;
    }

    override bool after(){
        return true;
    }

    @Action Response index(){
        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("topMenu", this.getTopMenu());
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("banners", this.getBanner("index"));
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("timeGroup",timeGroup);
        auto exeTime = timeGroup[1] - timeGroup[0];
        view.assign("exeTime", request.elapsed());
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("index"));
    }

    Banner[] getBanner(string keyword, bool isReset = false){

        auto _cache = Application.getInstance().cache();
        auto cacheData = _cache.get!(Banner[])("banners");
        Banner[] result;
        Banner[] allDatas;
        if(cacheData is null || isReset){
            logInfo("非缓存-banner");
            allDatas = (new BannerRepository(_cManager)).findAllData();
            _cache.set("banners", allDatas, 86400);//缓存1天
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

    TopMenu[] getTopMenu(bool isReset = false){
        
        auto _cache = Application.getInstance().cache();
        TopMenu[] result;
        string cacheKey = "top_menu_documentation";

        if(!isReset)
            result = _cache.get!(TopMenu[])(cacheKey);

        if(!result || isReset){

            logInfo("非缓存数据-" ~ cacheKey);
            auto currect = (new DocumentRepository(_cManager)).currectList();
            auto languages = (new LanguageRepository(_cManager)).findAll();

            foreach(doc; currect){
                TopMenu tmp = new TopMenu();
                tmp.title = doc.project.title;
                tmp.project_id = doc.project.id;
                foreach(language; languages){

                    if(language.id == doc.main_language){
                        tmp.url = "docs/" ~ doc.project.sign ~ "-current/";
                        auto sign = (new NodeRepository(_cManager)).findFirstNodeSignByDocId(doc.id);
                        if(sign)
                            tmp.url ~= sign.sign_key;
                        continue;
                    }
                }
                result ~= tmp;
            }
            _cache.set(cacheKey, result, 2592000); //缓存30天
        }else{
            logInfo("缓存数据-" ~ cacheKey);
        }
        return result;
    }

}