module app.system.controller.admin.UserController;

import hunt;

import app.system.model.User;
import app.system.repository.UserRepository;
import app.auth.Login;

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
        view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        return view.render("system/user/edit");
    }

    @Action Response login()
    {
        if(request.method() == HttpMethod.Post)
        {
            string username = request.post("username" , "");
            string password = request.post("password" , "");

            logInfo(username , password);
            auto user = UserInfo.login(username , password);
            if(user !is null)
            {
                UserInfo.put(request , user);
                
                return new RedirectResponse("/admincp/system/users");
            }          
        }
        return request.createResponse().setContent(view.render("system/user/login"));
    }
}
