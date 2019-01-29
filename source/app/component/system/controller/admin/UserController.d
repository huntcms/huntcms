module app.component.system.controller.admin.UserController;

import hunt.framework;
import hunt.framework.http.RedirectResponse;
import app.lib.controller.AdminBaseController;

import app.component.system.model.User;
import app.component.system.model.Role;
import app.component.system.form.LoginForm;

import app.component.system.repository.UserRepository;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.UserRoleRepository;
import app.component.system.helper.Password;
import app.component.system.helper.Utils;

// import app.auth.UserAuth;

import hunt.entity.DefaultEntityManagerFactory;
import hunt.logging;
import hunt.util.DateTime;

import std.string;
import std.json;

import hunt.database.DatabaseException;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;
import hunt.util.MimeType;

import std.algorithm;

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
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name");
            string email = request.post!string("email");
            short status = request.post("status").to!short;

            int[] roleIds = Utils.getCheckbox!int(request.all(), "roleid");
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
                    userRoleRepository.saves(user.id, roleIds);

                    manager.getTransaction().commit();

                    return new RedirectResponse(request, "/admincp/system/users");
                } catch(Exception e) {

                    errorMessages ~= "Email already existed.";

                    manager.getTransaction().rollback();

                    logError(e);
                }
            }

            view.assign("user", user);
            view.assign("errorMessages", errorMessages);
        }

        view.assign("roles", (new RoleRepository).findAll());
        
        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/user/add"));
		return response;
    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        auto manager = defaultEntityManagerFactory().createEntityManager();
        auto userRoleRepository = new UserRoleRepository(manager);
        auto userRepository = new UserRepository(manager);

        auto findUser = userRepository.find(id);
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int[] roleIds = Utils.getCheckbox!int(request.all(), "roleid");

            try {
                manager.getTransaction().begin();

                auto user = userRepository.find(id);
                user.name = name;
                user.status = status;
                userRepository.save(user);

                userRoleRepository.removes(id);
                userRoleRepository.saves(id, roleIds);
                manager.getTransaction().commit();
                return new RedirectResponse(request, "/admincp/system/users");
            } catch(Exception e) {

                errorMessages ~= "Email already existed.";

                manager.getTransaction().rollback();

                logError(e);
            }

            return new RedirectResponse(request, "/admincp/system/user/edit?id="~to!string(id));
        }


        view.assign("user", findUser);


        auto roles = (new RoleRepository).findAll();
        int[] userRoleIds = userRoleRepository.getUserRoleIds(id);
        class userRoleClass{
            Role role;
            string checked;
        }
        userRoleClass[] userRoles;
        foreach(key, role; roles){
            auto tmp =new userRoleClass;
            tmp.role = role;
            if(canFind(userRoleIds, role.id)){
                tmp.checked ~= "checked";
            }else{
                tmp.checked ~= "";
            }
            userRoles ~= tmp;
        }
        view.assign("userRoles", userRoles);

        view.assign("roles", (new RoleRepository).findAll());

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/user/edit"));
		return response;
    }

    @Action string del()
    {
        auto repository = new UserRepository;
        view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        return view.render("system/user/edit");
    }

    @Action string profile()
    {
        auto userRepository = new UserRepository;
        auto userInfo = Application.getInstance().accessManager.user;
        User user = userRepository.find(userInfo.id);
        // User user = userRepository.find(UserAuth.userId(request));

        if(request.methodAsString() == HttpMethod.POST.asString()){
            string name = request.post!string("name", "");
            string password = request.post!string("password", "");
            string rpassword = request.post!string("rpassword", "");
            if(name.length < 1 || name.length > 12){
                this.errorMessages ~= "Name 1 - 12 Characters";
            }
            if(password.length > 0 || rpassword.length > 0){
                if(password.length <6 || password.length > 32){
                    this.errorMessages ~= "Password 6 - 32 Characters";
                }
                if(password != rpassword){
                    this.errorMessages ~= "Inconsistency of Password";
                }
                user.password = generateUserPassword(password, user.salt);
            }
            user.name = name;
            userRepository.save(user);
        }

        view.assign("user", user);
        return view.render("system/user/profile");
    }

    @Action Response login(LoginForm loginForm) {

        if(request.methodAsString() == HttpMethod.POST.asString()) {
            auto result = loginForm.valid();
            logInfo(result);

            if(result.isValid() == true){
                string salt = generateSalt();
                
                logInfo(loginForm.username);
                auto find = (new UserRepository).findByEmail(loginForm.username);
                logInfo(find);

                if(find){

                    logInfo("find id :" ~ to!string(find.id));
                    auto user = Application.getInstance().accessManager.addUser(find.id);

                    if(user !is null){
                        return new RedirectResponse(request, "/admincp/");
                    }

                }else{
                    this.errorMessages ~= "Your email has not been found or has been banned";
                }
            }

        }
        
        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/user/login"));
		return response;
    }

    @Action Response logout()
    {
        Application.getInstance().accessManager.removeAuth();
        return new RedirectResponse(request, "/admincp/login");
    }
}
