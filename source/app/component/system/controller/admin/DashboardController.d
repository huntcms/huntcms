module app.component.system.controller.admin.DashboardController;

import app.lib.controller.AdminBaseController;
import app.lib.functions;
import hunt.framework;
import hunt.logging;

class DashboardController : AdminBaseController {

    mixin MakeController;

    this() {
        super();  
    }
    
    @Action 
    Response dashboard() {
        return ResponseView("system/dashboard/dashboard");
    }

}
