module app.system.controller.admin.LogController;

import hunt;

import app.system.model.LogInfo;
import app.system.repository.LogInfoRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
import app.system.controller.admin.LogMiddleware;
import app.common.controller.AdminBaseController;
import app.system.helper.Utils;

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
