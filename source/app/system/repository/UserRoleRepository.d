module app.system.repository.UserRoleRepository;

import hunt;

import entity.repository;

import app.system.model.User;
import app.system.model.Role;
import app.system.model.UserRole;

import entity;
import entity.EntityManager;

import kiss.logger;

import std.algorithm;
class UserRoleRepository : EntityRepository!(UserRole, int)
{

    private EntityManager _entityManager;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!UserRole criteriaQuery;
        Root!UserRole root;
    }

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager;
    }

    this(){
        EntityManager manager = Application.getInstance().getEntityManagerFactory().createEntityManager();
        super(manager);
        _entityManager = manager;
    }

    int[] getUserRoleIds(int userId)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.UserRole.user_id, userId);
        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        UserRole[] userRoles = typedQuery.getResultList();

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

    bool removes(int userId)
    {
        auto objects = this.newObjects();
        auto p1 = objects.builder.equal(objects.root.UserRole.user_id, userId);
        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        UserRole[] userRoles = typedQuery.getResultList();
        this.removeAll(userRoles);
        return true;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!UserRole;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }
}
