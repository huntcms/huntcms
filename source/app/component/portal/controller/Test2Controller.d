module app.component.portal.controller.Test2Controller;

import hunt.framework;
import app.lib.controller.BaseController;
import std.digest.sha;
import std.file;
import std.datetime;
import hunt.util.Configuration;
import hunt.logging;
import hunt.http.codec.http.model.HttpMethod;
import hunt.cache.ucache;
import app.component.system.helper.Utils;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;

class Test2Controller : BaseController{

    mixin MakeController;

    this(){
        super();
    }

    @Action Response index(){
        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("banners", this.getBanner("index"));
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("timeGroup",timeGroup);
        view.assign("exeTime", request.elapsed());
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("index"));
    }

    @Action string test(){
        return "ext time :" ~ (request.elapsed()).to!string;
    }

    Banner[] getBanner(string keyword, bool isReset = false){

        auto _cache = Application.getInstance().cache();
        auto cacheData = _cache.get!(Banner[])("banners");
        Banner[] result;
        Banner[] allDatas;
        if(!cacheData || isReset){
            logInfo("非缓存-banner");
            allDatas = (new BannerRepository(_cManager)).findAllData();
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

}