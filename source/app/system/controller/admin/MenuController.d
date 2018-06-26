module app.system.controller.admin.MenuController;

import hunt;

import app.system.model.Menu;
import app.system.repository.MenuRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;

class MenuController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto repository = new MenuRepository;
        auto alldata = repository.findAll();
        logDebug("menus : ", toJSON(alldata).toString);
        view.assign("menus", alldata);

        return view.render("system/menu/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto mr = new MenuRepository;
            Menu mn = new Menu;
            mn.name = request.post("name");
            mn.mca = request.post("mca");
            mn.linkUrl = request.post("linkUrl");
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
                return new RedirectResponse("/admincp/system/menus");

        }
        return request.createResponse().setContent(view.render("system/menu/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new MenuRepository;
        view.assign("menu", repository.find(id));

        return view.render("system/menu/edit");
    }

    @Action Response del(int id)
    {
        (new MenuRepository).removeById(id);
        return new RedirectResponse("/admincp/system/menus");
    }
}
