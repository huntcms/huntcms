module app.system.controller.RoleController;

import hunt;

class RoleController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto repository = new RoleRepository;
        view.assign("permissions", repository.findAll());

        return view.render("system/role/list");
    }

    @Action string add()
    {
        return view.render("system/role/add");
    }

    @Action string edit()
    {
        auto repository = new RoleRepository;
        view.assign("permissions", repository.find( request.get!int("id", 0) ));

        return view.render("system/role/add");
    }
}
