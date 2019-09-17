module app.component.system.controller.admin.PermissionGroupController;

import hunt.framework;

import app.component.system.model.PermissionGroup;
import app.component.system.repository.PermissionGroupRepository;

import hunt.logging;
import hunt.util.Serialize;
import hunt.util.DateTime;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
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
        this.addMiddleware(new LogMiddleware(_cManager));   
    }


    @Action Response list(int perPage, int page = 1)
    {
        perPage = perPage < 1 ? 1 : perPage;
        auto alldata = (new PermissionGroupRepository(_cManager)).findByPermissionGroup(page-1, perPage);
        view.assign("groups", alldata.getContent());

        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));

        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("system/permissiongroup/list"));

    }

    @Action Response add(){

        if (request.methodAsString() == HttpMethod.POST.asString()){
            int now = cast(int) time();
            auto pr = new PermissionGroupRepository(_cManager);
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
        string lang = findLocal();
        return new Response(request)
		    .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
		    .setContent(view.setLocale(lang).render("system/permissiongroup/add"));
    }


    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new PermissionGroupRepository(_cManager);
        view.assign("group", repository.find(request.get("id").to!int));
        string lang = findLocal();
        return view.setLocale(lang).render("system/permissiongroup/edit");
    }

    @Action Response del(int id)
    {
        (new PermissionGroupRepository(_cManager)).removeById(request.get("id").to!int);
            //return new RedirectResponse(request, url("system.permissiongroup.list", null, "admin"));
            return new RedirectResponse(request, "/admincp/system/permission/groups");
    }
}
