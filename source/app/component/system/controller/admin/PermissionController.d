module app.component.system.controller.admin.PermissionController;

import hunt.framework;

import app.component.system.model.Permission;
import app.component.system.repository.PermissionRepository;
import app.component.system.model.PermissionGroup;
import app.component.system.repository.PermissionGroupRepository;

import hunt.logging;
import hunt.util.Serialize;
import hunt.util.DateTime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.component.system.helper.Utils;

import hunt.entity.domain;
import app.component.system.helper.Paginate;
import hunt.http.codec.http.model.HttpMethod;

class PermissionController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();   
        this.addMiddleware(new LogMiddleware(_cManager));   
    }


    @Action Response list(int perPage, int page = 1)
    {
        perPage = perPage < 1 ? 10 : perPage;
        auto alldata = (new PermissionRepository(_cManager)).findByPermission(page-1, perPage);
        auto data = (new PermissionGroupRepository(_cManager)).findByPermissionGroup(page-1, perPage);
        view.assign("permissions", alldata.getContent());
        view.assign("groups", data.getContent());

        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("system/permission/list"));
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto pr = new PermissionRepository(_cManager);
            Permission pm = new Permission;
            pm.mca = request.post("mca");
            pm.title = request.post("title");
            pm.group_id = request.post("groupId").to!int;
            pm.isAction = request.post("actionRadio").to!short;
            pm.status = request.post("statusRadio").to!short;
            if(request.post("id"))
            {
                auto exsit_data = pr.findById(request.post("id").to!int);
                if(exsit_data !is null)
                {
                    pm.id = request.post("id").to!int;
                    pm.created = exsit_data.created;
                }
            }
            
            else
                pm.created = now;
            pm.updated = now;

            auto saveRes = pr.save(pm);
            if (saveRes !is null)
                return new RedirectResponse(request, "/admincp/system/permissions");
                // return new RedirectResponse(request, url("system.permission.list", null, "admin"));

        }
        auto pgList = (new PermissionGroupRepository(_cManager)).findAll();
        view.assign("groups", pgList);

        string lang = findLocal();
        return new Response(request)
		    .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
		    .setContent(view.setLocale(lang).render("system/permission/add"));
    }


    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new PermissionRepository(_cManager);
        view.assign("permission", repository.find(request.get("id").to!int));
        auto pgList = (new PermissionGroupRepository(_cManager)).findAll();
        view.assign("groups", pgList);
        string lang = findLocal();
        return view.setLocale(lang).render("system/permission/edit");
    }

    @Action Response del(int id)
    {
        (new PermissionRepository(_cManager)).removeById(request.get("id").to!int);
        // return new RedirectResponse(request, "/admincp/system/permissions");
        return new RedirectResponse(request, url("system.permission.list", null, "admin"));
    }
}
