module app.component.system.controller.admin.UserController;

import app.component.system.authentication.JwtToken;
import app.component.system.authentication.JwtUtil;
import app.component.system.form.LoginForm;
import app.component.system.helper.Password;
import app.component.system.helper.Utils;
import app.component.system.model.User;
import app.component.system.model.Role;
import app.component.system.model.Language;
import app.component.system.repository.LanguageRepository;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.UserRepository;
import app.component.system.repository.UserRoleRepository;
import app.lib.controller.AdminBaseController;
import app.lib.Exceptions;
import app.lib.functions;

import hunt.entity.DefaultEntityManagerFactory;
import hunt.framework;
import hunt.framework.http.RedirectResponse;
import hunt.logging;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;
import hunt.shiro;
import hunt.util.MimeType;
import hunt.util.DateTime;

import std.algorithm;
import std.json;
import std.string;

class UserController : AdminBaseController {

    mixin MakeController;

    this() {
        super();      
    }

    @Action 
    Response list(int perPage, int page = 1) {
        perPage = perPage < 1 ? 1 : perPage;
        auto alldata = (new UserRepository()).findByUser(page-1, perPage);
        view.assign("users", alldata.getContent());

        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));

        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("system/user/list"));
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
            int errorNum = 0;
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

            if(email is null || email == ""){
                errorNum += 1;
                assignError("Email is not validated.");
            }

            if(name is null || name == ""){
                errorNum += 1;
                assignError("Name is not validated.");
            }

            if (errorNum == 0)
            {
                
                try {
                    // _cManager.getTransaction().begin();
                    auto userRepository = new UserRepository();
                    userRepository.save(user);
                    auto userRoleRepository = new UserRoleRepository();
                    userRoleRepository.saves(user.id, roleIds);
                    // _cManager.getTransaction().commit();
                    // return new RedirectResponse(request, "/admincp/system/users");
                    return new RedirectResponse(request, url("system.user.list", null, "admin"));
                } catch(Exception e) {
                    assignError("Email already existed.");
                    // _cManager.getTransaction().rollback();
                    logError(e);
                }
            }

            view.assign("user", user);
        }

        view.assign("roles", (new RoleRepository()).findAll());
        view.assign("languages", (new LanguageRepository()).findEnable());
        logError((new LanguageRepository()).findEnable());
        
        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/user/add"));
    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        // auto manager = defaultEntityManagerFactory().createEntityManager();
        auto userRoleRepository = new UserRoleRepository();
        auto userRepository = new UserRepository();

        auto findUser = userRepository.find(id);
        logError(toJson(findUser));
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int[] roleIds = Utils.getCheckbox!int(request.all(), "roleid");

            try {
                // _cManager.getTransaction().begin();

                auto user = userRepository.find(id);
                user.name = name;
                user.status = status;
                userRepository.save(user);

                userRoleRepository.removes(id);
                userRoleRepository.saves(id, roleIds);
                // _cManager.getTransaction().commit();
                // return new RedirectResponse(request, "/admincp/system/users");
                return new RedirectResponse(request, url("system.user.list", null, "admin"));
            } catch(Exception e) {
                assignError("Email already existed.");
                // _cManager.getTransaction().rollback();
                logError(e);
            }
            // return new RedirectResponse(request, "/admincp/system/user/edit?id="~to!string(id));
            string[string] redirectParams;
            redirectParams["id"] = to!string(id);
            return new RedirectResponse(request, url("system.user.edit", redirectParams, "admin"));
        }
        view.assign("user", findUser);
        auto roles = (new RoleRepository()).findAll();
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
        view.assign("roles", (new RoleRepository()).findAll());
        view.assign("languages", (new LanguageRepository()).findEnable());
        logError(toJson((new LanguageRepository()).findEnable()));

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/user/edit"));
    }

    @Action string del()
    {
        auto repository = new UserRepository();
        view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        string lang = findLocal();
        return view.setLocale(lang).render("system/user/edit");
    }

    @Action string profile()
    {
        auto userRepository = new UserRepository();
        auto userInfo = Application.getInstance().accessManager.user;
        User user = userRepository.find(userInfo.id);
        // User user = userRepository.find(UserAuth.userId(request));

        if(request.methodAsString() == HttpMethod.POST.asString()){
            string name = request.post!string("name", "");
            string password = request.post!string("password", "");
            string rpassword = request.post!string("rpassword", "");
            if(name.length < 1 || name.length > 12){
                assignError("Name 1 - 12 Characters");
            }
            if(password.length > 0 || rpassword.length > 0){
                if(password.length <6 || password.length > 32){
                    assignError("Password 6 - 32 Characters");
                }
                if(password != rpassword){
                    assignError("Inconsistency of Password");
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
                scope auto userRepository = new UserRepository(); 
                User userModel = userRepository.findByEmail(username);
                if(userModel is null) {
                    assignError("Your email is not found or has been banned");
                } else {
                    // UsernamePasswordToken token = new UsernamePasswordToken(username, password);
                // token.setRememberMe(true);
                    string checkSalt = generateUserPassword(password, userModel.salt);
                    if(checkSalt == userModel.password) {
                        string tokenString = JwtUtil.sign(username, checkSalt);
                        info("tokenString: ", tokenString);
                        setLocale(userModel.language);
                        info("user logined: ", toJson(userModel));
                        Application.getInstance().accessManager.addUser(userModel.id);
                        Cookie langCookie = new Cookie("Content-Language", userModel.language);
                        Cookie sessionCookie = new Cookie("__auth_token__", tokenString);

                        return new RedirectResponse(request, url("system.dashboard.dashboard", null, "admin"))
                            .withCookie(langCookie)
                            .withCookie(sessionCookie);                        
                    } else {
                        assignError("Wrong password!");
                    }
                }
            }
        }
        
        logInfo("------------------------------");
        // string lang = findLocal();
        // logInfo(lang);
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("system/user/login"));
    }

    @Action Response logout()
    {
            Subject subject = cast(Subject)request.getAttribute(Subject.DEFAULT_NAME);
            if(subject !is null) {
                subject.logout();
            }
            Cookie sessionCookie = new Cookie("__auth_token__", "", 0);

        // Application.getInstance().accessManager.removeAuth();
        // return new RedirectResponse(request, "/admincp/login");
        return new RedirectResponse(request, url("system.user.login", null, "admin"))
                        .withCookie(sessionCookie);
    }
}
