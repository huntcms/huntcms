module app.component.system.controller.admin.RoleController;

import hunt.framework;

import app.lib.controller.AdminBaseController;
import app.lib.functions;

import app.component.system.model.RolePermission;
import app.component.system.model.Role;
import app.component.system.model.Permission;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.PermissionRepository;
import app.component.system.repository.RolePermissionRepository;
import app.component.system.helper.Utils;

import app.component.system.model.PermissionGroup;
import app.component.system.repository.PermissionGroupRepository;
import hunt.util.DateTime;

import hunt.entity.DefaultEntityManagerFactory;
import hunt.http.codec.http.model.HttpMethod;

import std.algorithm;

class RoleController : AdminBaseController
{
    mixin MakeController;

    @Action Response list(int perPage, int page = 1)
    {
        perPage = perPage < 1 ? 3 : perPage;
        auto alldata = (new RoleRepository(_cManager)).findByRole(page-1, perPage);

        view.assign("roles", alldata.getContent());

        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("system/role/list"));

    }

    @Action Response add()
    {
        if(request.methodAsString() == HttpMethod.POST.asString()){
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int time = cast(int)time();
            int[] permissionIds = Utils.getCheckbox!int(request.all(), "permissionid");

            // auto manager = defaultEntityManagerFactory().createEntityManager();
            try {
                _cManager.getTransaction().begin();

                auto roleRepository = new RoleRepository(_cManager);
                Role role = new Role();
                role.name = name;
                role.created = time;
                role.updated = time;
                role.status = status;

                roleRepository.save(role);
                auto rolePermissionRepository = new RolePermissionRepository(_cManager);
                rolePermissionRepository.saves(role.id, permissionIds);

                _cManager.getTransaction().commit();
                Application.getInstance().accessManager.refresh();  
                // return new RedirectResponse(request, "/admincp/system/roles");
                return new RedirectResponse(request, url("system.role.list", null, "admin"));
            } catch(Exception e) {

                errorMessages ~= "role already existed.";

                _cManager.getTransaction().rollback();
            }
        }
        view.assign("permissions", (new PermissionRepository(_cManager)).findAll());
        view.assign("groups", (new PermissionGroupRepository(_cManager)).findAll());

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/role/add"));
    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        // auto manager = defaultEntityManagerFactory().createEntityManager();
        auto rolePermissionRepository = new RolePermissionRepository(_cManager);
        auto roleRepository = new RoleRepository(_cManager);

        auto findRole = roleRepository.find(id);
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int[] permissionIds = Utils.getCheckbox!int(request.all(), "permissionid");

            try {
                _cManager.getTransaction().begin();
                auto role = findRole;
                role.name = name;
                role.status = status;
                roleRepository.save(role);
                rolePermissionRepository.removes(id);
                rolePermissionRepository.saves(id, permissionIds);
                _cManager.getTransaction().commit();
                Application.getInstance().accessManager.refresh();  
                return new RedirectResponse(request, "/admincp/system/roles");
            } catch(Exception e) {
                errorMessages ~= "error.";
                _cManager.getTransaction().rollback();
                logError(e);
            }

            return new RedirectResponse(request, "/admincp/system/role/edit?id="~to!string(id));            
            // string[string] redirectParams;
            // redirectParams["id"] = to!string(id);
            // return new RedirectResponse(request, url("system.role.edit", redirectParams, "admin"));
        }
        view.assign("role", findRole);

        //logInfo(id);
        auto permissions = (new PermissionRepository(_cManager)).findAll();
        int[] rolePermissionIds = rolePermissionRepository.getRolePermissionIds(id);
        class rolePermissionClass{
            Permission permission;
            string checked;
        }
        rolePermissionClass[] rolePermissions;
        foreach(key, permission; permissions){
            auto tmp =new rolePermissionClass;
            tmp.permission = permission;
            if(canFind(rolePermissionIds, permission.id)){
                tmp.checked ~= "checked";
            }else{
                tmp.checked ~= "";
            }
            rolePermissions ~= tmp;
        }
        view.assign("rolePermissions", rolePermissions);
        view.assign("groups", (new PermissionGroupRepository(_cManager)).findAll());

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/role/edit"));
    }
}
