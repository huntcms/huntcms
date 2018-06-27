module app.system.controller.admin.PermissionController;

import hunt;

import app.system.model.Permission;
import app.system.repository.PermissionRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;

class PermissionController : Controller
{
    mixin MakeController;

    @Action string list()
    {
        auto repository = new PermissionRepository();
        auto alldata = repository.findAll();
        logDebug("permissions : ", toJSON(alldata).toString);
        view.assign("permissions", alldata);

        return view.render("system/permission/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto pr = new PermissionRepository();
            Permission pm = new Permission;
            pm.id = request.post("id");
            pm.title = request.post("title");
            pm.isAction = request.post("actionRadio").to!short;
            pm.status = request.post("statusRadio").to!short;
            auto exsit_data = pr.findById(request.post("id"));
            if(exsit_data !is null)
                pm.created = exsit_data.created;
            else
                pm.created = now;
            pm.updated = now;

            auto saveRes = pr.save(pm);
            if (saveRes !is null)
                return new RedirectResponse("/admincp/system/permissions");

        }
        return request.createResponse().setContent(view.render("system/permission/add"));
    }


    @Action string edit(string id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new PermissionRepository();
        view.assign("permission", repository.find(id));

        return view.render("system/permission/edit");
    }

    @Action Response del(string id)
    {
        (new PermissionRepository()).removeById(id);
        return new RedirectResponse("/admincp/system/permissions");
    }
}
