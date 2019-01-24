module app.component.system.controller.admin.RoleController;

import hunt.framework;

import app.lib.controller.AdminBaseController;

import app.component.system.model.RolePermission;
import app.component.system.model.Role;
import app.component.system.model.Permission;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.PermissionRepository;
import app.component.system.repository.RolePermissionRepository;
import app.component.system.helper.Utils;

import hunt.util.DateTime;

import hunt.entity.DefaultEntityManagerFactory;
import hunt.http.codec.http.model.HttpMethod;

import std.algorithm;

class RoleController : AdminBaseController
{
    mixin MakeController;

    @Action string list()
    {
        view.assign("roles", (new RoleRepository).findAll());

        return view.render("system/role/list");
    }

    @Action Response add()
    {
        if(request.methodAsString() == HttpMethod.POST.asString()){
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int time = cast(int)time();
            int[] permissionIds = Utils.getCheckbox!int(request.all(), "permissionid");

            auto manager = defaultEntityManagerFactory().createEntityManager();
            try {
                manager.getTransaction().begin();

                auto roleRepository = new RoleRepository(manager);

                Role role = new Role();
                role.name = name;
                role.created = time;
                role.updated = time;
                role.status = status;

                roleRepository.save(role);
                auto rolePermissionRepository = new RolePermissionRepository(manager);
                rolePermissionRepository.saves(role.id, permissionIds);

                manager.getTransaction().commit();
                Application.getInstance().accessManager.refresh();  
                return new RedirectResponse(request, "/admincp/system/roles");
            } catch(Exception e) {

                errorMessages ~= "role already existed.";

                manager.getTransaction().rollback();
            }
        }
        view.assign("permissions", (new PermissionRepository).findAll());

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/role/add"));
		return response;
    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        auto manager = defaultEntityManagerFactory().createEntityManager();
        auto rolePermissionRepository = new RolePermissionRepository(manager);
        auto roleRepository = new RoleRepository(manager);

        auto findRole = roleRepository.find(id);
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post("status").to!short;
            int[] permissionIds = Utils.getCheckbox!int(request.all(), "permissionid");

            try {
                manager.getTransaction().begin();

                auto role = findRole;
                role.name = name;
                role.status = status;
                roleRepository.save(role);

                rolePermissionRepository.removes(id);
                rolePermissionRepository.saves(id, permissionIds);
                manager.getTransaction().commit();
                Application.getInstance().accessManager.refresh();  
                return new RedirectResponse(request, "/admincp/system/roles");
            } catch(Exception e) {

                errorMessages ~= "error.";

                manager.getTransaction().rollback();

                logError(e);
            }

            return new RedirectResponse(request, "/admincp/system/role/edit?id="~to!string(id));
        }


        view.assign("role", findRole);

        //logInfo(id);
        auto permissions = (new PermissionRepository).findAll();
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

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("system/role/edit"));
		return response;
    }
}
