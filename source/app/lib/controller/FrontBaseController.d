module app.lib.controller.FrontBaseController;

// import frontConf = hunt.framework.application.ApplicationConfig;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.framework;
import hunt.framework.Simplify;
import hunt.http.codec.http.model.HttpMethod;
import hunt.logging;
import hunt.util.Configuration;

public import std.algorithm.sorting;
public import std.conv;
public import std.json;
public import std.net.curl;

class FrontBaseController : Controller {

    private ConfigBuilder _configFront;

    this(){
        _configFront = configManager().config("hunt");
    }

    override bool before() {
        return true;
    }

    override bool after(){
        ///请求结束自动销毁本次数据库连接
        closeDefaultEntityManager();
        return true;
    }

    bool pubAssign() {
        return true;
    }
}