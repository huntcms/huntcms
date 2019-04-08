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
import hunt.entity.DefaultEntityManagerFactory;

alias AclUser = hunt.framework.security.acl.User.User;
alias AclPermission = hunt.framework.security.acl.Permission.Permission;
alias AclRole = hunt.framework.security.acl.Role.Role;

class MyAuthProxy : AuthenticateProxy {

    AclRole[] getAllRoles() {
        EntityManager _myAuthManager;
        _myAuthManager = defaultEntityManagerFactory().createEntityManager();
        AclRole[] roles;
        try
        {
            auto roleRep = new RoleRepository(_myAuthManager);
            auto allData = roleRep.findAll();
            auto rpRep = new RolePermissionRepository(_myAuthManager);
            foreach(oneData; allData){
                auto per = new AclRole(oneData.id, oneData.name);
                int[] permissionIds = rpRep.getRolePermissionIds(oneData.id);
                per.addPermissionIds(permissionIds);
                roles ~= per;
            }
        }catch(Exception e)
        {
            logError(e);
        }
        _myAuthManager.close();
        return roles;
    }

    AclPermission[] getAllPermissions() {
        EntityManager _myAuthManager;
        _myAuthManager = defaultEntityManagerFactory().createEntityManager();
        AclPermission[] permissions;
        try
        {
            auto repository = new PermissionRepository(_myAuthManager);
            auto allData = repository.findAll();
            foreach(oneData; allData){
                auto per = new AclPermission();
                per.id = oneData.id;
                per.key = oneData.mca;
                per.name = oneData.title;
                permissions ~= per;
            }
        }catch(Exception e)
        {
            logError(e);
        }
        _myAuthManager.close();
        return permissions;
    }

    AclUser[] getAllUsers(int[] userIds){
        EntityManager _myAuthManager;
        _myAuthManager = defaultEntityManagerFactory().createEntityManager();
        AclUser[] users;
        try
        {
            auto userRepository = new UserRepository(_myAuthManager);
            auto urRep = new UserRoleRepository(_myAuthManager);
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
        }catch(Exception e)
        {
            logError(e);
        }
        _myAuthManager.close();
        return users;
    }

}