module app.lib.controller.FrontBaseController;

import hunt.framework;
import hunt.logging;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import frontConf = hunt.framework.application.ApplicationConfig;
import app.lib.cache.TmpCache;
import std.net.curl;
import std.json;
import std.algorithm.sorting;

class FrontBaseController : Controller{

    private ConfigBuilder _configFront;
    public TmpCache _tmpCache;

    this(){
        _configFront = configManager().config("hunt");
        logWarning(_configFront);
        logWarning(toJSON(_configFront));
        _tmpCache = new TmpCache();
    }

    override bool before() {
        auto topMenu = _tmpCache.getTopMenu();
        view.assign("siteBase", _configFront.front.site.base.value);
        view.assign("topMenu", topMenu);
        logWarning(request.host);
        logWarning(request.getScheme());
        logWarning(request.elapsed());
        return true;
    }

    override bool after(){
        return true;
    }

    bool pubAssign() {
        return true;
    }
}