module app.lib.controller.AdminBaseController;

import hunt.framework;

import app.component.system.model.Menu;
import app.component.system.model.User;

import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;

import std.json;
import std.algorithm.sorting;
import hunt.http.codec.http.model.HttpMethod;

class AdminBaseController : Controller
{
    protected string[] errorMessages;
	
	protected User thisUser;

    this() {
    }

    override bool before() {
		auto repository = new MenuRepository;
		auto cache = Application.getInstance().cache();
		auto userInfo = Application.getInstance().accessManager.user;
		logInfo(toJSON(userInfo));
		if (userInfo !is null) {

			string permissionStr;
			User nowUser = (new UserRepository).find(userInfo.id);		
			logInfo(toJSON(nowUser));	
			view.assign("nowUser", nowUser);

			auto roles = userInfo.roles;
			if(roles){
				foreach(role; roles){
					// logInfo(toJSON(role));
					auto permissions = role.permissions;
					if(permissions){
						foreach(permission; permissions){
							// logInfo(toJSON(permission));
							if(permissionStr.indexOf(permission.key) < 0){
								permissionStr ~= "," ~ permission.key;
							}
						}
					}
					logInfo(permissionStr);
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
		log("---running after----");
		view.assign("errorMessages", this.errorMessages);
		return true;
	}
}
