module app.component.system.controller.admin.FrontmenuController;

import hunt.framework;
import app.component.system.model.Frontmenu;
import app.component.system.repository.FrontmenuRepository;
import app.lib.controller.AdminBaseController;
import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
import app.component.system.helper.Utils;

import hunt.entity.domain;

class FrontmenuController : AdminBaseController
{
    mixin MakeController;
  
    this()
    {
        super();      
    }

    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new FrontmenuRepository();
        auto alldata = pageToJson!Frontmenu(repository.findAll(new Pageable(page , 20)));
        logDebug("menus : ", alldata);
        view.assign("menus", alldata);

        return view.render("system/frontmenu/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto mr = new FrontmenuRepository;
            Frontmenu mn = new Frontmenu;
            mn.pid = request.post("pid" , 0);
            mn.name = request.post("name");
            mn.mca = request.post("mca");
            mn.linkUrl = request.post("linkUrl");
            mn.iconClass = request.post("iconClass" , "");
            mn.sort = request.post("sort" , 0);
            mn.isAction = request.post("actionRadio").to!short;
            mn.status = request.post("statusRadio").to!short;
            auto id = request.post("id");
            if(id.length != 0)
            {
                mn.id = id.to!int;
                auto exsit_data = mr.findById(id.to!int);
                if(exsit_data !is null)
                    mn.created = exsit_data.created;
            }
            else
                mn.created = now;
            mn.updated = now;

            auto saveRes = mr.save(mn);
            if (saveRes !is null)
                return new RedirectResponse("/admincp/system/frontmenus");
        }
        auto repository = new FrontmenuRepository;
        view.assign("firstLevelMenus", repository.getMenusByPid(0));
        view.assign("routes", routes());

        return request.createResponse().setContent(view.render("system/frontmenu/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new FrontmenuRepository;
        view.assign("menu", repository.find(id));
        view.assign("firstLevelMenus", repository.getMenusByPid(0));
        view.assign("routes", routes());

        return view.render("system/frontmenu/edit");
    }

    
    @Action Response del(int id)
    {
        (new FrontmenuRepository).removeById(id);
        return new RedirectResponse("/admincp/system/frontmenus");
    }

    @Action string[] routes()
    {
        string[] routearr;
        auto routes = slurp!(string, string, string)(getcwd()~"/config/admin.routes.list", "%s %s %s");
        routearr.length = routes.length;
        foreach(key, route; routes)
        {
            if(route[0]=="GET")
            routearr[key] = route[1];
        }

        return routearr;
    }

}