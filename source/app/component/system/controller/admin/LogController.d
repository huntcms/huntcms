module app.component.system.controller.admin.LogController;

import hunt.framework;

import app.component.system.model.LogInfo;
import app.component.system.repository.LogInfoRepository;

import hunt.util.Serialize;
import hunt.util.DateTime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Utils;

import hunt.entity.domain;

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
        auto repository = new LogInfoRepository(_cManager);
        auto alldata = pageToJson!LogInfo(repository.findAll(new Pageable(page , 20)));
        logDebug("page logs : ", alldata);
        view.assign("logs", alldata);

        return view.render("system/log/list");
    }


    @Action Response del(int id)
    {
        (new LogInfoRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/system/logs");
        // return new RedirectResponse(request, url("system.log.list", null, "admin"));
    }
}
