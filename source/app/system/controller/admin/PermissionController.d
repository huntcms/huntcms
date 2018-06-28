module app.system.controller.admin.PermissionController;

import hunt;

import app.system.model.Permission;
import app.system.repository.PermissionRepository;

import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
import app.system.controller.admin.LogMiddleware;
import app.common.controller.AdminBaseController;
import app.system.helper.Utils;

import entity.domain;


class PermissionController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();   
        //this.addMiddleware(new LogMiddleware);   
    }

    //@Middleware("LogMiddleware")
    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new PermissionRepository();
        auto alldata = pageToJson!Permission(repository.findAll(new Pageable(page , 20)));
        logDebug("permissions : ",alldata);
        view.assign("permissions", alldata);

        return view.render("system/permission/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = time();
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
