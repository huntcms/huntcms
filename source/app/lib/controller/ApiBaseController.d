module app.lib.controller.ApiBaseController;

import hunt.entity.DefaultEntityManagerFactory;
import hunt.framework;
import hunt.framework.Simplify;
import hunt.http.codec.http.model.HttpMethod;
public import std.json;

class ApiBaseController : Controller {

    this() {
    }

    override bool before() {
        info("mca: ", request.getMCA());
        trace("data: ", request.all());
        return true;
    }

    override bool after() {
        ///请求结束自动销毁本次数据库连接
        closeDefaultEntityManager();
        return true;
    }

    static JSONValue resultMessage(T = string)(T data = T.init) {
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

    static JSONValue errorMessage(T = string)(int code, string msg, T data = T.init) {
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
