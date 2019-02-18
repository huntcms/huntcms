module app.component.system.helper.MyAuthProxy;

import hunt.framework;
import hunt.framework.http.Request;
import hunt.framework.security.acl;

import app.component.system.model.User;
import app.component.system.model.Permission;
import app.component.system.model.Menu;
import app.component.system.model.Role;
import app.component.system.model.UserRole;

import app.component.system.repository.UserRepository;
import app.component.system.repository.PermissionRepository;
import app.component.system.repository.RoleRepository;
import app.component.system.repository.RolePermissionRepository;
import app.component.system.repository.UserRoleRepository;
import hunt.logging;
import std.json;

alias AclUser = hunt.framework.security.acl.User.User;
alias AclPermission = hunt.framework.security.acl.Permission.Permission;
alias AclRole = hunt.framework.security.acl.Role.Role;

class MyAuthProxy : AuthenticateProxy {

    AclRole[] getAllRoles() {
        logError(" ===== getAllRoles ===== ");
        auto roleRep = new RoleRepository();
		auto allData = roleRep.findAll();
        logError(toJSON(allData));
        AclRole[] roles;
        auto rpRep = new RolePermissionRepository();
        foreach(oneData; allData){
            auto per = new AclRole(oneData.id, oneData.name);
            int[] permissionIds = rpRep.getRolePermissionIds(oneData.id);
            per.addPermissionIds(permissionIds);
            roles ~= per;
        }
        logError(toJSON(roles));
        return roles;
    }

    AclPermission[] getAllPermissions() {
        logError(" ===== getAllPermissions ===== ");
        auto repository = new PermissionRepository();
		auto allData = repository.findAll();
        logError(toJSON(allData));
        AclPermission[] permissions;
        foreach(oneData; allData){
            auto per = new AclPermission();
            per.id = oneData.id;
            per.key = oneData.mca;
            per.name = oneData.title;
            permissions ~= per;
        }
        logError(toJSON(permissions));
        return permissions;
    }

    AclUser[] getAllUsers(int[] userIds){
        logError(" ===== getAllUsers ===== ");
        auto userRepository = new UserRepository();
        auto urRep = new UserRoleRepository();
        AclUser[] users;
        foreach(userId; userIds){
            auto findUser = userRepository.find(userId);
            if(findUser){
                auto per = new AclUser();
                per.id = userId;
                auto urIds = urRep.getUserRoleIds(userId);
                per.addRoleIds(urIds);
                users ~= per;
            }
        }
        logError(toJSON(users));
        return users;
    }

}