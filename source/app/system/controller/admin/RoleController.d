module app.system.controller.admin.RoleController;

import hunt;

import app.common.controller.AdminBaseController;

import app.system.model.Role;
import app.system.repository.RoleRepository;
import app.system.repository.PermissionRepository;
import app.system.repository.RolePermissionRepository;
import app.system.helper.Utils;

import kiss.datetime;

import entity.DefaultEntityManagerFactory;

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

    @Action string edit()
    {
        auto repository = new RoleRepository;
        
        //view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        return view.render("system/role/add");
    }
}
