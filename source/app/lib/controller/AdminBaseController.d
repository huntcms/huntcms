module app.lib.controller.AdminBaseController;

import hunt.framework;
import app.lib.cache.TmpCache;
import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;
import app.component.system.model.Menu;
import app.component.system.model.User;

import std.json;
import std.algorithm;
import hunt.http.codec.http.model.HttpMethod;
import hunt.framework.security.acl.Permission;
import hunt.entity.DefaultEntityManagerFactory;

class AdminBaseController : Controller
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
    }

    override bool before() {

		this.flashMessages();
        logWarning(request.elapsed());		
		auto repository = new MenuRepository(_cManager);
		auto cache = Application.getInstance().cache();
		auto userInfo = Application.getInstance().accessManager.user;

		if (userInfo !is null) {
			string permissionStr;
			User nowUser = (new UserRepository(_cManager)).find(userInfo.id);
			view.assign("nowUser", nowUser);

			auto roles = userInfo.roles;
			// 防止 roles 丢失 当 roles 不存在且登录用户 为 supered = 1 是清除一次
			if(!roles && nowUser.supered == 1){
				Application.getInstance().accessManager.refresh();
			}

			if(roles){
				foreach(role; roles){
					auto permissions = role.permissions;
					if(permissions){
						foreach(permission; permissions){
							if(permissionStr.indexOf(permission.key) < 0){
								permissionStr ~= "," ~ permission.key;
							}
						}
					}
				}
			}
			JSONValue[] menuData = repository.getAllMenus(permissionStr); 	
			view.assign("menusJsonData", menuData);
			view.assign("isLogin", "YES");
		} else {
			view.assign("isLogin", "NO");
		}
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
		logInfo(sessionErrorMessages);
		logInfo(sessionSuccessMessages);
		if(sessionSuccessMessages) {
			session.remove("successMessages");
			view.assign("successMessages", parseJSON(sessionSuccessMessages).array);
		}
		if(sessionErrorMessages) {
			session.remove("errorMessages");
			view.assign("errorMessages", parseJSON(sessionErrorMessages).array);
		}
		return true;
	}
	
}
