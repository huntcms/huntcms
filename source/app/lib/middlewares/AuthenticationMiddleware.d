module app.lib.middlewares.AuthenticationMiddleware;

import app.lib.Exceptions;
import app.lib.JwtToken;

import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;
// import app.component.system.model.Menu;
import app.component.system.model.User;

// import hunt.framework.application.Controller;
import hunt.framework.application.MiddlewareInterface;
import hunt.framework.http.Request;
import hunt.framework.http.Response;
import hunt.framework.http.RedirectResponse;
import hunt.framework.Simplify;

import hunt.entity.EntityManager;
import hunt.entity.DefaultEntityManagerFactory;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;

import hunt.logging.ConsoleLogger;
import hunt.shiro;

import std.array;
import std.string;

class AuthenticationMiddleware : MiddlewareInterface {
    EntityManager _cManager;

    this(EntityManager manager)
    {
        this._cManager = manager;
        // _cManager = defaultEntityManagerFactory().createEntityManager();
    }
    
    override string name() {
        return typeof(this).stringof;
    }

    override Response onProcess(Request request, Response response) {
        
        infof("path: %s, method: %s", request.path(), request.method );
        if(request.path().startsWith("/admincp/login") ) { // && request.method == HttpMethod.GET
            return null;
        }

        string tokenString = request.header(HttpHeader.AUTHORIZATION);

        // info(tokenString);
        enum TokenHeader = "Bearer ";
        
        if(!tokenString.empty) {
            if(!tokenString.startsWith(TokenHeader)) {
                return new RedirectResponse(request, url("system.user.login", null, "admin"));
            }

            tokenString = tokenString[TokenHeader.length .. $];
        }

        if(tokenString.empty)
            tokenString = request.cookie("__auth_token__");

        if(!tokenString.empty) {
            // 提交给realm进行登入，如果错误他会抛出异常并被捕获

            Subject subject = SecurityUtils.newSubject("", request.host()); 
            try {
                JwtToken token = new JwtToken(tokenString);
                subject.login(token);
            } catch (WrongPasswordException e) {
                warning(e);
            } catch (AuthenticationException e) {
                warning(e);
            } catch(Exception ex) {
                warning(ex);
            }

            // Subject subject = SecurityUtils.newSubject(sessionId, request.host()); 
            // infof("sessionId: %s, isAuthenticated: %s", sessionId, subject.isAuthenticated());

            if(subject.isAuthenticated()) {
                request.setAttribute(Subject.DEFAULT_NAME, cast(Object)subject);
                return null;	
            }
        }

        return new RedirectResponse(request, url("system.user.login", null, "admin"));
    }

}