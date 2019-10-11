module app.component.portal.controller.IndexController;

import hunt.framework;
import app.lib.controller.FrontBaseController;
import std.digest.sha;
import std.file;
import std.datetime;
import hunt.util.Configuration;
import hunt.logging;
import hunt.http.codec.http.model.HttpMethod;
import hunt.cache;
import app.component.system.helper.Utils;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;

class IndexController : FrontBaseController{

    mixin MakeController;

    this(){
        super();
    }

    @Action Response index(){
        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("banners", _tmpCache.getBanner("index"));
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

}