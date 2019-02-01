module app.component.system.controller.admin.PermissionGroupController;

import hunt.framework;

import app.component.system.model.PermissionGroup;
import app.component.system.repository.PermissionGroupRepository;

import hunt.logging;
import hunt.util.Serialize;
import hunt.util.DateTime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Utils;
import app.component.system.helper.Paginate;

import hunt.entity.domain;
import hunt.http.codec.http.model.HttpMethod;

class PermissionGroupController : AdminBaseController
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
        auto repository = new PermissionGroupRepository();
        int limit = 20 ;  // 每页显示多少条
        JSONValue alldata = pageToJson!PermissionGroup(repository.findAll(new Pageable((page-1 < 0 ? 0 : page-1 ) , limit)));
        //logDebug("permissions : ",alldata);
        view.assign("groups", alldata);

        int totalPages = cast(int)alldata["totalPages"].integer ;
        Paginate temPage = new Paginate("/admincp/system/permission/groups?page={page}" , (cast(int) page <= 0 ? 1 : cast(int) page) , totalPages);
        view.assign("pageView", temPage.showPages());

        return view.render("system/permissiongroup/list");
    }

    @Action Response add(){

        if (request.methodAsString() == HttpMethod.POST.asString()){
            int now = cast(int) time();
            auto pr = new PermissionGroupRepository();
            PermissionGroup pm = new PermissionGroup;
            pm.sign = request.post("sign");
            pm.title = request.post("title");
            pm.sort = request.post("sort").to!int;
            pm.status = request.post("statusRadio").to!short;
            if(request.post("id")){
                auto exsit_data = pr.findById(request.post("id").to!int);
                if(exsit_data !is null){
                    pm.created = exsit_data.created;
                }
            }else{
                pm.created = now;
            }
            pm.updated = now;

            auto saveRes = pr.save(pm);
            if (saveRes !is null)
                //return new RedirectResponse(request, url("system.permissiongroup.list", null, "admin"));
                return new RedirectResponse(request, "/admincp/system/permission/groups");

        }

        return new Response(request)
		    .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
		    .setContent(view.render("system/permissiongroup/add"));
    }


    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new PermissionGroupRepository();
        view.assign("group", repository.find(request.get("id").to!int));

        return view.render("system/permissiongroup/edit");
    }

    @Action Response del(int id)
    {
        (new PermissionGroupRepository()).removeById(request.get("id").to!int);
            //return new RedirectResponse(request, url("system.permissiongroup.list", null, "admin"));
            return new RedirectResponse(request, "/admincp/system/permission/groups");
    }
}
