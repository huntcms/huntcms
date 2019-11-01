module app.component.system.controller.admin.LogMiddleware;

import app.component.system.model.LogInfo;
import app.component.system.repository.LogInfoRepository;
import app.component.system.repository.UserRepository;
import app.lib.functions;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.framework;
import hunt.framework.Simplify;
import hunt.util.DateTime;
import std.json;
import std.stdio;

class LogMiddleware : MiddlewareInterface {

    string name() {
        return "LogMiddleware";
    }

    Response onProcess(Request req, Response res) {
        try {

            auto userInfo = Application.getInstance().accessManager.user;
            if(userInfo is null) {
                logError("no user info");
                return null;
            }

            auto userRepository = new UserRepository();

            logDebug("id : ", userInfo.id);
            LogInfo li = new LogInfo();
            li.user = userRepository.find(userInfo.id);
            li.params = toJSON(req.all()).toString;
            li.type = req.method().asString();
            li.time = cast(int) time();
            li.action = req.route.getRoute();
            li.ipaddr = client_ip();
            auto lir = new LogInfoRepository();
            if (lir.save(li) is null) {
                logError("log middleware error  ");
            }
        } catch (Exception e) {
            logError("log middleware error : ", e.msg);
        }

        return null;
    }

}
