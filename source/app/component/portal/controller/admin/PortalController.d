module app.component.portal.controller.admin.PortalController;

import hunt.framework;

class PortalController : Controller
{
    mixin MakeController;

    @Action string index()
    {
        string url = url("admin:system.dashboard.dashboard");

        return "<a href='" ~ url ~ "'>Go to AdminCP!</a>";
    }
}
