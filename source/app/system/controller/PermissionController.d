module app.system.controller.PermissionController;

import hunt;

import app.system.model.Permission;
import app.system.repository.PermissionRepository;

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
        view.assign("permissions", repository.findById( request.get("id") ));

        return view.render("system/permission/add");
    }
}
