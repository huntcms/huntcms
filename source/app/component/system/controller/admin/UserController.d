module app.component.system.controller.admin.UserController;

import hunt.framework;
import hunt.framework.http.RedirectResponse;
import app.lib.controller.AdminBaseController;
import app.lib.Exceptions;
import app.lib.functions;

import app.component.system.model.User;
import app.component.system.model.Role;
import app.component.system.model.Language;
import app.component.system.form.LoginForm;

import app.component.system.repository.UserRepository;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.UserRoleRepository;
import app.component.system.repository.LanguageRepository;
import app.component.system.helper.Password;
import app.component.system.helper.Utils;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.logging;
import hunt.util.DateTime;

import hunt.database.DatabaseException;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;
import hunt.util.MimeType;

import hunt.shiro;

import std.algorithm;
import std.string;
import std.json;

class UserController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
    }

    @Action string list()
    {
        auto repository = new UserRepository(_cManager);
        view.assign("users", repository.findAll());
        string lang = findLocal();
        return view.setLocale(lang).render("system/user/list");
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
                
                try {
                    _cManager.getTransaction().begin();
                    auto userRepository = new UserRepository(_cManager);
                    userRepository.save(user);
                    auto userRoleRepository = new UserRoleRepository(_cManager);
                    userRoleRepository.saves(user.id, roleIds);
                    _cManager.getTransaction().commit();
                    // return new RedirectResponse(request, "/admincp/system/users");
                    return new RedirectResponse(request, url("system.user.list", null, "admin"));
                } catch(Exception e) {
                    errorMessages ~= "Email already existed.";
                    _cManager.getTransaction().rollback();
                    logError(e);
                }
            }

            view.assign("user", user);
            view.assign("errorMessages", errorMessages);
        }

        view.assign("roles", (new RoleRepository(_cManager)).findAll());
        view.assign("languages", (new LanguageRepository(_cManager)).findEnable());
        logError((new LanguageRepository(_cManager)).findEnable());
        
        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/user/add"));
    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        // auto manager = defaultEntityManagerFactory().createEntityManager();
        auto userRoleRepository = new UserRoleRepository(_cManager);
        auto userRepository = new UserRepository(_cManager);

        auto findUser = userRepository.find(id);
        logError(toJson(findUser));
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int[] roleIds = Utils.getCheckbox!int(request.all(), "roleid");

            try {
                _cManager.getTransaction().begin();

                auto user = userRepository.find(id);
                user.name = name;
                user.status = status;
                userRepository.save(user);

                userRoleRepository.removes(id);
                userRoleRepository.saves(id, roleIds);
                _cManager.getTransaction().commit();
                // return new RedirectResponse(request, "/admincp/system/users");
                return new RedirectResponse(request, url("system.user.list", null, "admin"));
            } catch(Exception e) {
                errorMessages ~= "Email already existed.";
                _cManager.getTransaction().rollback();
                logError(e);
            }
            // return new RedirectResponse(request, "/admincp/system/user/edit?id="~to!string(id));
            string[string] redirectParams;
            redirectParams["id"] = to!string(id);
            return new RedirectResponse(request, url("system.user.edit", redirectParams, "admin"));
        }
        view.assign("user", findUser);
        auto roles = (new RoleRepository(_cManager)).findAll();
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
        view.assign("roles", (new RoleRepository(_cManager)).findAll());
        view.assign("languages", (new LanguageRepository(_cManager)).findEnable());
        logError(toJson((new LanguageRepository(_cManager)).findEnable()));

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/user/edit"));
    }

    @Action string del()
    {
        auto repository = new UserRepository(_cManager);
        view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        string lang = findLocal();
        return view.setLocale(lang).render("system/user/edit");
    }

    @Action string profile()
    {
        auto userRepository = new UserRepository(_cManager);
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
        string lang = findLocal();
        return view.setLocale(lang).render("system/user/profile");
    }

    @Action Response login(LoginForm loginForm) {

        if(request.methodAsString() == HttpMethod.POST.asString()) {
            auto result = loginForm.valid();
            logInfo(result);

            if(result.isValid()) {
                string username = loginForm.username;
                string password = loginForm.password;     
                UsernamePasswordToken token = new UsernamePasswordToken(username, password);
                // token.setRememberMe(true);
                Subject subject = SecurityUtils.newSubject("", request.host()); 
                try {
                    subject.login(token);
                } catch (WrongEmailException e) {
                    this.errorMessages ~= "Your email has not been found or has been banned";
                } catch (WrongPasswordException e) {
                    this.errorMessages ~= "Wrong password!";
                } catch (AuthenticationException e) {
                    warning(e.msg);
                    this.errorMessages ~= "Login failed.";
                } catch(Exception ex) {
                    warning(ex.msg);
                    this.errorMessages ~= "Unknown error";
                }

                if(subject.isAuthenticated()) {
                    PrincipalCollection principals = subject.getPrincipals();
                    User user = cast(User) principals.getPrimaryPrincipal();
                    setLocale(user.language);
                    info("user logined: ", toJson(user));
                    // Application.getInstance().accessManager.addUser(user.id);
                    trace("isPermitted: ", subject.isPermitted("system.file.upload"));
                    return new RedirectResponse(request, url("system.dashboard.dashboard", null, "admin"));
                }
            }
        }
        
        logInfo("------------------------------");
        string lang = findLocal();
        logInfo(lang);
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("system/user/login"));
    }

    @Action Response logout()
    {
        Application.getInstance().accessManager.removeAuth();
        // return new RedirectResponse(request, "/admincp/login");
        return new RedirectResponse(request, url("system.user.login", null, "admin"));
    }
}
