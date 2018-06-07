module app.system.controller.PermissionController;

import hunt;

class PermissionController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto repository = new PermissionRepository;
        view.assign("permissions", repository.findAll());

        return view.render("system/permission/list");
    }

    @Action string add()
    {
        return view.render("system/permission/add");
    }

    @Action string edit()
    {
        auto repository = new PermissionRepository;
        view.assign("permissions", repository.find( request.get!int("id", 0) ));

        return view.render("system/permission/add");
    }
}
