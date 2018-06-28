module app.common.controller.AdminBaseController;

import hunt;

class AdminBaseController : Controller
{
    protected string[] errorMessages;
    this()
    {
     
    }

    override bool before()
	{
        logInfo("---running before----");
        if (cmp(toUpper(request.method), HttpMethod.Options) == 0)
			return false;
		return true;
	}

	override bool after()
	{
		logInfo("---running after----");
		return true;
	}
    
}
