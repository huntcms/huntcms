module app.component.system.controller.api.VersionController;

import hunt.framework;

import hunt.util.serialize;

class VersionController : Controller
{
    mixin MakeController;

    @Action Response check()
    {
        import app.component.system.message.VersionMessage;

        auto message = new VersionMessage;
        
        message.id = 10001;
        message.description = "test version";
        message.released = 1234567890;

        auto res = new JsonResponse(request);
        res.json(toJson(message));

        return res;
    }
}
