module app.component.system.controller.admin.LogController;

import hunt;

import app.component.system.model.LogInfo;
import app.component.system.repository.LogInfoRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Utils;

import entity.domain;

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
        uint page = request.get!uint("page" , 0);
        auto repository = new LogInfoRepository();
        auto alldata = pageToJson!LogInfo(repository.findAll(new Pageable(page , 20)));
        logDebug("page logs : ", alldata);
        view.assign("logs", alldata);

        return view.render("system/log/list");
    }


    @Action Response del(int id)
    {
        (new LogInfoRepository()).removeById(id);
        return new RedirectResponse("/admincp/system/logs");
    }
}
