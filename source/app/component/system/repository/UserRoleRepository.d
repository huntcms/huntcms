module app.component.system.repository.UserRoleRepository;

import hunt.framework;

import hunt.entity.repository;

import app.component.system.model.User;
import app.component.system.model.Role;
import app.component.system.model.UserRole;

import hunt.entity;
import hunt.entity.EntityManager;

import std.algorithm;
class UserRoleRepository : EntityRepository!(UserRole, int)
{

    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    int[] getUserRoleIds(int userId) {

        auto query = _entityManager.createQuery!(UserRole)(" SELECT ur FROM UserRole ur WHERE ur.user_id = :userId ");
        query.setParameter("userId", userId);
        auto userRoles = query.getResultList();
        
        int[] ids;
        foreach (userRole; userRoles) {
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
        auto query = _entityManager.createQuery!(UserRole)(" SELECT ur FROM UserRole ur WHERE ur.user_id = :userId ");
        query.setParameter("userId", userId);
        UserRole[] userRoles = query.getResultList();
        this.removeAll(userRoles);
        return true;
    }

}
