module app.system.controller.UserController;

import hunt;

class UserController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto repository = new UserRepository;
        view.assign("permissions", repository.findAll());

        return view.render("system/user/list");
    }

    @Action string add()
    {
        return view.render("system/user/add");
    }

    @Action string edit()
    {
        auto repository = new UserRepository;
        view.assign("permissions", repository.find( request.get!int("id", 0) ));

        return view.render("system/user/edit");
    }
}
