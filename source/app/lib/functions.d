module app.lib.functions;

import hunt.framework;
import hunt.util.DateTime;
import std.array;
import std.conv;
import std.format;
import std.string;
import app.component.system.repository.UserRepository;
import app.component.system.model.User;
import hunt.framework.application.ApplicationConfig;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.logging;
import hunt.framework.Simplify;

string client_ip() {
    import hunt.framework.http.Request;
    import std.array;
    if(request().headerExists("X-Forwarded-For"))
    {
        string ips = request().header("X-Forwarded-For");
        auto arr = ips.split(",");
        if(arr.length >= 0)
            return arr[0];
    }
    return request().clientAddress().toAddrString();
}

string findLocal() {
    EntityManager _myManager;
    string localLanguage = configManager().config("hunt").hunt.application.defaultLanguage.value;
    auto userInfo = Application.getInstance().accessManager.user;
    if(userInfo !is null){
        // _myManager = defaultEntityManagerFactory().createEntityManager();
        auto user = new UserRepository().find(userInfo.id);
        if(user !is null){
            localLanguage = user.language;
        }
        closeDefaultEntityManager();
    }
    return localLanguage;
}

string buildQueryString(string[string] params, string pageKey = "page")
{
    string resStr;
    foreach(key, val; params)
    {
        if(pageKey != key)
        {
            if(resStr.length > 0)
            {
                resStr ~= "&";
            }
            resStr ~= key ~ "=" ~ val;
        }
    }
    return resStr;
}

/**
 * 获取表单INT数据
 */
static int initNum(string paramName, int initValue = 1, string reqType = "POST"){
    int resNum;
    if(paramName && reqType){
        string param;
        if(reqType == "POST"){
            param = request.post(paramName, initValue.to!string).replace(" ", "");
        }else{
            param = request.get(paramName, initValue.to!string).replace(" ", "");
        }
        resNum = isNumeric(param) ? to!int(param) : initValue;
    }
    return resNum;
}