module app.system.controller.admin.LogController;

import hunt;

import app.system.model.LogInfo;
import app.system.repository.LogInfoRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
import app.system.controller.admin.LogMiddleware;
import app.common.controller.AdminBaseController;

class LogController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();   
         
    }

    //@Middleware("LogMiddleware")
    @Action string list()
    {
        auto repository = new LogInfoRepository();
        auto alldata = repository.findAll();
        logDebug("logs : ", toJSON(alldata).toString);
        view.assign("logs", alldata);

        return view.render("system/log/list");
    }


    @Action Response del(int id)
    {
        (new LogInfoRepository()).removeById(id);
        return new RedirectResponse("/admincp/system/logs");
    }
}
