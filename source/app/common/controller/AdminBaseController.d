module app.common.controller.AdminBaseController;

import hunt;
import app.system.repository.MenuRepository;
import app.system.model.Menu;
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
		auto cache = Application.getInstance().getCache();
		
		auto userInfo = UserInfo.get(request);

		 if (userInfo !is null)
		 {	
			request.session.get("USER");
			string permission = cache.get("user_permission_cache_" ~ to!string(userInfo.id()) );
			JSONValue menuData = repository.getAllMenus(permission); 
			view.assign("menusJsonData", menuData);
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
