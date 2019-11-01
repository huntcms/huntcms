module app.component.system.controller.admin.LogController;

import app.component.system.controller.admin.LogMiddleware;
import app.component.system.helper.Utils;
import app.component.system.model.LogInfo;
import app.component.system.repository.LogInfoRepository;
import app.lib.controller.AdminBaseController;
import app.lib.functions;

import hunt.entity.domain;
import hunt.framework;
import hunt.util.Serialize;
import hunt.util.DateTime;

class LogController : AdminBaseController {

    mixin MakeController;

    this() {
        super();   
    }

    //@Middleware("LogMiddleware")
    @Action 
    Response list() {
        int page = initNum("page", 1, "GET") < 1 ? 1 : initNum("page", 1, "GET");
        auto repository = new LogInfoRepository();
        auto alldata = pageToJson!LogInfo(repository.findAll(new Pageable(page - 1, 20)));
        logDebug("page logs : ", alldata);
        view.assign("logs", alldata);
        makePageBreadCrumbs("logList");
        return ResponseView("system/log/list");
    }


    @Action 
    Response del(int id) {
        (new LogInfoRepository()).removeById(id);
        return new RedirectResponse(request, url("admin:system.log.list"));
        // return new RedirectResponse(request, url("system.log.list", null, "admin"));
    }

}
