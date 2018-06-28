module app.common.controller.AdminBaseController;

import hunt;

class AdminBaseController : Controller
{
    this()
    {
     
    }

    override bool before()
	{
        //view.assign("menus", "66668888");
		view.assign("errorMessages", ["this is before error"]);
		if (cmp(toUpper(request.method), HttpMethod.Options) == 0)
			return false;
		return true;
	}

	override bool after()
	{
		log("---running after----");
		view.assign("errorMessages", ["this is after error"]);
		return true;
	}
    
}
