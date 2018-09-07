module app.lib.controller.AdminBaseController;

import hunt.framework;

import app.component.system.model.Menu;
import app.component.system.model.User;

import app.component.system.repository.MenuRepository;
import app.component.system.repository.UserRepository;

import app.auth.Login;

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
		
		auto userInfo = UserInfo.get(request);

		 if (userInfo !is null)
		 {	
			request.session.get("USER");
			string permission = cache.get("user_permission_cache_" ~ to!string(userInfo.id()) );
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
