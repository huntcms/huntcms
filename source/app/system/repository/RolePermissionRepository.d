module app.system.repository.RolePermissionRepository;

import entity.repository;
import app.system.model.RolePermission;
import app.system.model.Permission;
import app.system.repository.PermissionRepository;
import hunt;

class RolePermissionRepository : EntityRepository!(RolePermission, int)
{
    private EntityManager _entityMnagaer;

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!RolePermission criteriaQuery;
        Root!RolePermission root;
    }
  
    this()
    {
         _entityMnagaer = Application.getInstance().getEntityManagerFactory().createEntityManager();
        super(_entityMnagaer);
    }

    Permission[] getRolePermissions(int roleId)
    {
        auto objects = this.newObjects();
        auto p1 = objects.builder.equal(objects.root.RolePermission.role_id, roleId);
        auto typedQuery = _entityMnagaer.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        RolePermission[] rolePermissions = typedQuery.getResultList();

        Permission[] permissions;
        auto permissionRepository = new PermissionRepository();

        foreach (rolePermission; rolePermissions)
        {
            permissions ~= permissionRepository.findById(rolePermission.permission_id);
        }

        return permissions;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityMnagaer.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!RolePermission;
        objects.root = objects.criteriaQuery.from();
        return objects;
    }
}
