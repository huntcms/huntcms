module app.system.controller.admin.RoleController;

import hunt;
import app.common.controller.AdminBaseController;

import app.system.model.Role;
import app.system.repository.RoleRepository;
import app.system.repository.PermissionRepository;
import app.system.helper.Utils;

class RoleController : AdminBaseController
{
    mixin MakeController;

    @Action string list()
    {
        view.assign("roles", (new RoleRepository).findAll());

        return view.render("system/role/list");
    }

    @Action string add()
    {
        if(request.method == "POST"){
            string name = request.post!string("name", "");
            int[] permissionIds = Utils.getCheckbox(request.all(), "permissionid");
        }
        view.assign("permissions", (new PermissionRepository).findAll());
        return view.render("system/role/add");
    }

    @Action string edit()
    {
        auto repository = new RoleRepository;
        
        //view.assign("permissions", repository.findById( request.get!int("id", 0) ));

        return view.render("system/role/add");
    }
}
