module app.common.controller.AdminBaseController;

import hunt;

class AdminBaseController : Controller
{
    this()
    {
     
    }

    override bool before()
	{
        view.assign("menus", "66668888");
		if (cmp(toUpper(request.method), HttpMethod.Options) == 0)
			return false;
		return true;
	}

	override bool after()
	{
		log("---running after----");
		return true;
	}
    
}
