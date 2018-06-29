module app.portal.controller.PortalController;

import hunt;

class PortalController : Controller
{
    mixin MakeController;

    @Action string index()
    {
        import hunt.routing.router;
        string url = url("system.dashboard.dashboard", null, "admin");
        return "<a href='" ~ url ~ "'>Go to AdminCP!</a>";
    }
}
