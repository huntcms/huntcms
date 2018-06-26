module app.system.repository.UserRoleRepository;

import entity.repository;

import app.system.model.User;
import app.system.model.Role;
import app.system.model.UserRole;

import entity;

class UserRoleRepository : EntityRepository!(UserRole, int)
{
    struct Objects
    {
        EntityManager em;
        CriteriaBuilder builder;
        CriteriaQuery!UserRole criteriaQuery;
        Root!UserRole root;
    }

    int[] getUserRoleIds(int userId)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.UserRole.user_id, userId);
        auto typedQuery = objects.em.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        UserRole[] userRoles = typedQuery.getResultList();

        int[] ids;
        foreach( userRole; userRoles)
        {
            ids ~= userRole.role_id;
        }

        return ids;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.em = this.getManager();
        objects.builder = objects.em.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!UserRole;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }
}
