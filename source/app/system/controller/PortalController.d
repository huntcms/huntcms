module app.system.controller.PortalController;

import hunt;

class PortalController : Controller
{
    mixin MakeController;

    @Action string index()
    {
        return "<a href='/admincp/'>Go to AdminCP!</a>";
    }
}
