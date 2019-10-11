module app.lib.controller.BaseController;

import hunt.framework;
import hunt.logging;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import hunt.cache;
import frontConf = hunt.framework.application.ApplicationConfig;

public import std.conv;
import std.net.curl;
import std.json;
import std.algorithm.sorting;

import app.component.system.repository.LanguageRepository;
import app.component.system.model.Language;
import hunt.entity.DefaultEntityManagerFactory;

class BaseController : Controller {

    private ConfigBuilder _configFront;
    public Cache _cache;
    public EntityManager _cManager;

    this(){
        _configFront = configManager().config("hunt");
        _cache = Application.getInstance().cache();
        _cManager = defaultEntityManagerFactory().createEntityManager();
    }

    override bool before() {
        view.assign("siteBase", _configFront.front.site.base.value);
        // view.assign("topMenu", this.getTopMenu());
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


    static JSONValue resultMessage(T = string)(T data = T.init)
    {
        JSONValue j;
        j["code"] = 0;
        j["message"] = null;
        if(data){
            j["data"] = toJSON!(T)(data);
        }else{
            j["data"] = null;
        }
        return j;
    }

    static JSONValue errorMessage(T = string)(int code, string msg, T data = T.init)
    {
        JSONValue j;
        string codeStr = code.to!string;
        j["code"] = code;
        j["message"] = msg;
        if(data){
            j["data"] = toJSON!(T)(data);
        }else{
            j["data"] = null;
        }
        return j;
    }

}