module app.component.system.controller.admin.RoleController;

import hunt;

import app.lib.controller.AdminBaseController;

import app.component.system.model.RolePermission;
import app.component.system.model.Role;
import app.component.system.model.Permission;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.PermissionRepository;
import app.component.system.repository.RolePermissionRepository;
import app.component.system.helper.Utils;

import kiss.datetime;

import entity.DefaultEntityManagerFactory;

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
        if(request.method == "POST"){
            string name = request.post!string("name", "");
            short status = request.post!short("status");
            int time = cast(int)time();
            string[] permissionIds = Utils.getCheckbox!string(request.all(), "permissionid");

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

                return new RedirectResponse("/admincp/system/roles");
            } catch(Exception e) {

                errorMessages ~= "role already existed.";

                manager.getTransaction().rollback();
            }
        }
        view.assign("permissions", (new PermissionRepository).findAll());
        return request.createResponse().setContent(view.render("system/role/add"));

    }

    @Action Response edit()
    {
        int id = request.get!int("id", 0);

        auto manager = defaultEntityManagerFactory().createEntityManager();
        auto rolePermissionRepository = new RolePermissionRepository(manager);
        auto roleRepository = new RoleRepository(manager);

        auto findRole = roleRepository.find(id);
        if(request.method() == "POST")
        {
            auto params = request.all();
            string name = request.post!string("name", "");
            short status = request.post!short("status", 0);
            string[] permissionIds = Utils.getCheckbox!string(request.all(), "permissionid");

            try {
                manager.getTransaction().begin();

                auto role = findRole;
                role.name = name;
                role.status = status;
                roleRepository.save(role);

                rolePermissionRepository.removes(id);
                rolePermissionRepository.saves(id, permissionIds);
                manager.getTransaction().commit();
                return new RedirectResponse("/admincp/system/roles");
            } catch(Exception e) {

                errorMessages ~= "error.";

                manager.getTransaction().rollback();

                kiss.logger.error(e);
            }

            return new RedirectResponse("/admincp/system/role/edit?id="~to!string(id));
        }


        view.assign("role", findRole);


        auto permissions = (new PermissionRepository).findAll();
        string[] rolePermissionIds = rolePermissionRepository.getRolePermissionIds(id);
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

        return request.createResponse().setContent(view.render("system/role/edit"));
    }
}
