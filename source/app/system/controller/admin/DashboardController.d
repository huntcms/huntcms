module app.system.controller.admin.DashboardController;

import hunt;

class DashboardController : Controller
{
    mixin MakeController;

    @Action string dashboard()
    {
        return view.render("system/dashboard/dashboard");
    }
}
