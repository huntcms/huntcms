module app.component.system.repository.UserRoleRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import app.component.system.model.User;
import app.component.system.model.Role;
import app.component.system.model.UserRole;
import std.algorithm;

class UserRoleRepository : EntityRepository!(UserRole, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    int[] getUserRoleIds(int userId) 
    {
        auto userRoles = _manager.createQuery!(UserRole)(" SELECT ur FROM UserRole ur WHERE ur.user_id = :userId ")
            .setParameter("userId", userId)
            .getResultList();
        int[] ids;
        foreach (userRole; userRoles) 
        {
            ids ~= userRole.role_id;
        }
        return ids;
    }


    bool saves(int userId, int[] roleIds)
    {
        UserRole[] userRole;
        foreach(roleId; roleIds){
            UserRole r = new UserRole();
            r.user_id = userId;
            r.role_id = roleId;
            userRole ~= r;
        }
        this.saveAll(userRole);
        return true;
    }

    bool removes(int userId) {
        auto query = _manager.createQuery!(UserRole)(" SELECT ur FROM UserRole ur WHERE ur.user_id = :userId ");
        query.setParameter("userId", userId);
        UserRole[] userRoles = query.getResultList();
        this.removeAll(userRoles);
        return true;
    }

}
