module app.system.controller.admin.LogMiddleware;

import std.stdio;
import std.json;
import app.system.repository.LogInfoRepository;
import app.system.repository.UserRepository;
import app.system.model.LogInfo;
import hunt;
import kiss.datetime;
import app.auth.Login;
import entity.DefaultEntityManagerFactory;


class LogMiddleware : MiddlewareInterface
{

    string name()
    {
        return "LogMiddleware";
    }

    Response onProcess(Request req, Response res)
    {
        try
        {
            auto user = UserInfo.get(req);
            if(user is null)
            {
                logError("no user info");
                return null;
            }
            auto manager = defaultEntityManagerFactory().createEntityManager();

            auto userRepository = new UserRepository(manager);

            logDebug("id : ", user.id, "  email : ", user.name);
            LogInfo li = new LogInfo;
            li.user = userRepository.findByEmail(user.name);
            li.params = toJSON(req.all()).toString;
            li.type = req.method();
            li.time = cast(int) time();
            li.action = req.route.getRoute();
            auto lir = new LogInfoRepository();
            if (lir.save(li) is null)
            {
                logError("log middleware error  ");
            }
        }
        catch (Exception e)
        {
            logError("log middleware error : ", e.msg);
        }

        return null;
    }

}
