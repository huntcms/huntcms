module app.component.system.controller.admin.DashboardController;

import hunt;
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
