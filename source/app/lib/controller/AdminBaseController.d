module app.lib.controller.AdminBaseController;

import hunt.framework;
import app.lib.cache.TmpCache;
import app.lib.middlewares.AuthenticationMiddleware;

import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;
import app.component.system.model.Menu;
import app.component.system.model.User;

import std.json;
import std.algorithm;
import hunt.http.codec.http.model.HttpMethod;
import hunt.framework.security.acl.Permission;
import hunt.entity.DefaultEntityManagerFactory;
import app.lib.functions;

import hunt.shiro;

// class AdminBaseController : CmsController {
// 	this() 
// 	{
// 		super();
//         addMiddleware(new AuthenticationMiddleware());
//     }
// }

class  AdminBaseController : Controller
{
    protected string[] errorMessages;
	
	protected User thisUser;
	private string[] _alertSuccessMessages;
	private string[] _alertErrorMessages;

	public TmpCache _tmpCache;
    public EntityManager _cManager;

    this() 
	{
        _tmpCache = new TmpCache();
        _cManager = defaultEntityManagerFactory().createEntityManager();

        addMiddleware(new AuthenticationMiddleware());
    }

    override bool before() {
		this.flashMessages();
        logWarning(request.elapsed());		

        Subject subject = cast(Subject)request.getAttribute(Subject.DEFAULT_NAME);

		if(subject !is null && subject.isAuthenticated()) {
			auto repository = new MenuRepository(_cManager);
			view.assign("isLogin", "YES");
			User currentUser = cast(User)subject.getPrincipal();
			assert(currentUser !is null);
			view.assign("nowUser", currentUser);

			MenuItemViewModel[] menuData = repository.getAllowdMenus(subject); 	
			view.assign("menusJsonData", menuData);			

		} else {
			view.assign("isLogin", "NO");
		}


        logWarning(request.elapsed());		
		// if (cmp(toUpper(request.method), HttpMethod.OPTIONS.asString()) == 0)
		if (request.methodAsString() == HttpMethod.OPTIONS.asString())
			return false;
		return true;
	}

	override bool after() {
		logWarning("---running after----");
		///请求结束自动销毁本次数据库连接
		if(_cManager){
			_cManager.close();
		}
        logWarning(request.elapsed());
		return true;
	}
	
	bool assignSussess(string msg) {
		if(!canFind(_alertSuccessMessages, msg)) {
			_alertSuccessMessages ~= msg;
			request.session(true).set("successMessages", toJson(_alertSuccessMessages).to!string);
		}
		return true;
	}

	bool assignError(string msg) {
		if(!canFind(_alertErrorMessages, msg)) {
			_alertErrorMessages ~= msg;
			request.session(true).set("errorMessages", toJson(_alertErrorMessages).to!string);
		}
		return true;
	}

	bool flashMessages() {
		HttpSession session = request.session(true);
		string sessionSuccessMessages = session.get("successMessages");
		string sessionErrorMessages = session.get("errorMessages");
		if(sessionSuccessMessages) {
			logInfo(sessionSuccessMessages);
			session.remove("successMessages");
			view.assign("successMessages", parseJSON(sessionSuccessMessages).array);
		}
		if(sessionErrorMessages) {
			logInfo(sessionErrorMessages);
			session.remove("errorMessages");
			view.assign("errorMessages", parseJSON(sessionErrorMessages).array);
		}
		return true;
	}
	
}
