module app.component.system.controller.admin.DashboardController;

import hunt.framework;
import app.lib.controller.AdminBaseController;

class DashboardController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
    }
    
    @Action string dashboard()
    {
        return view.render("system/dashboard/dashboard");
    }
}
