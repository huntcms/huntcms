module app.component.portal.controller.PortalController;

import hunt;

class PortalController : Controller
{
    mixin MakeController;

    @Action string index()
    {
        string url = createUrl("system.dashboard.dashboard", null, "admin");

        return "<a href='" ~ url ~ "'>Go to AdminCP!</a>";
    }
}
