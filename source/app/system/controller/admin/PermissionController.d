module app.system.controller.admin.PermissionController;

import hunt;

import app.system.model.Permission;
import app.system.repository.PermissionRepository;
import kiss.logger;
import kiss.util.serialize;

import core.stdc.time : time;

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

    @Action string add()
    {
        return view.render("system/permission/add");
    }

    @Action JSONValue doAdd()
    {
        auto data = request.json();
        logDebug("permission add : ", data);
        auto now = cast(int) time(null);
        try
        {
            Permission pm = new Permission;
            pm.key = data["key"].str;
            pm.title = data["title"].str;
            pm.isAction = cast(short) data["isAction"].integer;
            pm.status = cast(short) data["status"].integer;
            pm.created = now;
            pm.updated = now;
            (new PermissionRepository).save(pm);
        }
        catch (Exception e)
        {
            logError("--- excep : ", e.msg);
        }

        JSONValue res;
        res["error_code"] = 0;
        return res;
    }

    @Action string edit()
    {
        auto repository = new PermissionRepository;
        view.assign("permissions", repository.findById(request.get("id")));

        return view.render("system/permission/add");
    }
}
