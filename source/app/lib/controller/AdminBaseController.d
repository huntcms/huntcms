module app.lib.controller.AdminBaseController;

import hunt.framework;

import app.component.system.model.Menu;
import app.component.system.model.User;

import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;

import app.auth.UserAuth;

class AdminBaseController : Controller
{
    protected string[] errorMessages;
    this()
    {
    }

    override bool before()
	{
		auto repository = new MenuRepository;
		auto cache = Application.getInstance().cache();
		logInfo(123412341234);
		auto userInfo = UserAuth.get(request);
		logInfo(userInfo);
		 if (userInfo !is null)
		 {	
			request.session.get("USER");
			string permission = cache.get("user_permission_cache_" ~ to!string(userInfo.id()) );
			//logInfo(permission);
			JSONValue[] menuData = repository.getAllMenus(permission); 	
			view.assign("menusJsonData", menuData);

			User nowUser = (new UserRepository).find(userInfo.id());			
			view.assign("nowUser", nowUser);
		 }
		if (cmp(toUpper(request.method), HttpMethod.Options) == 0)
			return false;
		return true;
	}

	override bool after()
	{
		log("---running after----");
		view.assign("errorMessages", this.errorMessages);
		return true;
	}
}
