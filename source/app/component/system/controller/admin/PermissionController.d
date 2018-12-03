module app.component.system.controller.admin.PermissionController;

import hunt.framework;

import app.component.system.model.Permission;
import app.component.system.repository.PermissionRepository;

import hunt.logging;
import hunt.util.serialize;
import hunt.datetime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
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
        this.addMiddleware(new LogMiddleware);   
    }

    @Action string list()
    {
        uint page = request.get!uint("page" , 1);
        auto repository = new PermissionRepository();
        int limit = 20 ;  // 每页显示多少条
        JSONValue alldata = pageToJson!Permission(repository.findAll(new Pageable((page-1 < 0 ? 0 : page-1 ) , limit)));
        //logDebug("permissions : ",alldata);
        view.assign("permissions", alldata);

        int totalPages = cast(int)alldata["totalPages"].integer ;
        Paginate temPage = new Paginate("/admincp/system/permissions?page={page}" , (cast(int) page <= 0 ? 1 : cast(int) page) , totalPages);
        view.assign("pageView", temPage.showPages());

        return view.render("system/permission/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.POST.asString())
        {
            int now = time();
            auto pr = new PermissionRepository();
            Permission pm = new Permission;
            pm.mca = request.post("mca");
            pm.title = request.post("title");
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

        }

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/permission/add"));
		return response;
    }


    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new PermissionRepository();
        view.assign("permission", repository.find(request.get("id").to!int));

        return view.render("system/permission/edit");
    }

    @Action Response del(int id)
    {
        (new PermissionRepository()).removeById(request.get("id").to!int);
        return new RedirectResponse(request, "/admincp/system/permissions");
    }
}
