module app.system.controller.admin.UserController;

import hunt;
import hunt.http.RedirectResponse;
import app.common.controller.AdminBaseController;

import app.system.model.User;
import app.system.repository.UserRepository;
import app.auth.Login;
import app.system.repository.RoleRepository;
import app.system.repository.UserRoleRepository;
import app.system.helper.Password;

import entity.DefaultEntityManagerFactory;

import kiss.logger;
import kiss.datetime;

import std.string;
import std.json;

import database.exception;


class UserController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
    }

    @Action string list()
    {
        auto repository = new UserRepository;

        view.assign("users", repository.findAll());
        return view.render("system/user/list");
    }

    @Action Response add()
    {
        if(request.method() == "POST")
        {
            auto params = request.all();
            string name = request.post!string("name");
            string email = request.post!string("email");
            short status = request.post!short("status");

            int[] roles;

            foreach(paramk, paramv; params)
            {
                if(indexOf(paramk, "roleid") != -1)
                {
                    logInfo(paramv);
                    roles ~= paramv.to!int();
                }
            }
            logInfo(roles);
            string[] errorMessages;

            User user = new User();


            int time = cast(int)time();
            user.name = name;
            user.email = email;
            user.salt = generateSalt();
            user.password = generateUserPassword("123456", user.salt);
            user.supered = 0;
            user.created = time;
            user.updated = time;
            user.status = status;

            if(email is null || email == "")
            {
                errorMessages ~= "Email is not validated.";
            }

            if(name is null || name == "")
            {
                errorMessages ~= "Name is not validated.";
            }

            if (errorMessages.length == 0)
            {
                auto manager = defaultEntityManagerFactory().createEntityManager();
                try {
                    manager.getTransaction().begin();

                    auto userRepository = new UserRepository(manager);

                    userRepository.save(user);
                    auto userRoleRepository = new UserRoleRepository(manager);
                    userRoleRepository.saves(user.id, roles);

                    manager.getTransaction().commit();

                    return new RedirectResponse("/admincp/system/users");
                } catch(Exception e) {

                    errorMessages ~= "Email already existed.";

                    manager.getTransaction().rollback();

                    kiss.logger.error(e);
                }
            }

            view.assign("user", user);
            view.assign("errorMessages", errorMessages);
        }

        view.assign("roles", (new RoleRepository).findAll());
        return request.createResponse().setContent(view.render("system/user/add"));
    }

    @Action string edit()
    {
        int id = request.get!int("id", 0);

        auto userRepository = new UserRepository;
        auto user = userRepository.find(id);
        if(request.method() == "POST")
        {


        }
        auto userRoleRepository = new UserRoleRepository;
        view.assign("user", user);
        view.assign("userRoles", userRoleRepository.getUserRoleIds(id));
        view.assign("roles", (new RoleRepository).findAll());
        return view.render("system/user/edit");
    }

    @Action string del()
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

    @Action Response logout()
    {
        if(request.session.has("USER")){
            request.session.remove("USER");
        }   
        return new RedirectResponse("/admincp/login");
    }
}
