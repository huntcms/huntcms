module app.component.system.controller.admin.BannerController;

import hunt.framework;

import app.lib.controller.AdminBaseController;



class BannerController : AdminBaseController
{
    mixin MakeController;
    @Action string list()
    {
        return view.render("system/banner/list");
    }
}