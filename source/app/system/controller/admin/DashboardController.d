module app.system.controller.admin.DashboardController;

import hunt;
import app.common.controller.AdminBaseController;

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
