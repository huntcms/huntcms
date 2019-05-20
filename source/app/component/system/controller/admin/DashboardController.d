module app.component.system.controller.admin.DashboardController;

import hunt.framework;
import app.lib.controller.AdminBaseController;
import hunt.logging;
import app.lib.functions;

class DashboardController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
    }
    
    @Action string dashboard()
    {
        string lang = findLocal();
        return view.setLocale(lang).render("system/dashboard/dashboard");
    }
}
