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
        auto repository = new PermissionRepository;
        auto alldata = repository.findAll();
        logDebug("permissions : ", toJSON(alldata).toString);
        view.assign("permissions", alldata);

        return view.render("system/permission/list");
    }

    @Action Response add()
    {
        if(request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();

            Permission pm = new Permission;
            pm.key = request.post("key");
            pm.title = request.post("title");
            pm.isAction = request.post("actionRadio").to!short;
            pm.status = request.post("statusRadio").to!short;
            pm.created = now;
            pm.updated = now;

            (new PermissionRepository).save(pm);
            return new RedirectResponse("/admincp/system/permissions");
        }
        return request.createResponse().setContent(view.render("system/permission/add"));
    }

    @Action string edit(string id)
    {
        auto repository = new PermissionRepository;
        view.assign("permission", repository.find(id.to!string));

        return view.render("system/permission/add");
    }
}
