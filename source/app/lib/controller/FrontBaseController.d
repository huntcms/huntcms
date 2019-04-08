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
import hunt.entity.DefaultEntityManagerFactory;

class FrontBaseController : Controller{

    private ConfigBuilder _configFront;
    public TmpCache _tmpCache;
    public EntityManager _cManager;

    this(){
        _configFront = configManager().config("hunt");
        _tmpCache = new TmpCache();
        _cManager = defaultEntityManagerFactory().createEntityManager();
    }

    override bool before() {
        auto topMenu = _tmpCache.getTopMenu();
        view.assign("siteBase", _configFront.front.site.base.value);
        view.assign("topMenu", topMenu);
        logWarning(request.host);
        // logWarning(request.getScheme());
        logWarning(request.elapsed());
        return true;
    }

    override bool after(){
        ///请求结束自动销毁本次数据库连接
        if(_cManager){
            _cManager.close();
        }
        return true;
    }

    bool pubAssign() {
        return true;
    }
}