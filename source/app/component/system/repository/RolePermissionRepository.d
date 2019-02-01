module app.component.system.repository.RolePermissionRepository;

import hunt.entity;
import hunt.entity.repository;

import app.component.system.model.RolePermission;
import app.component.system.model.Permission;
import app.component.system.repository.PermissionRepository;

class RolePermissionRepository : EntityRepository!(RolePermission, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    Permission[] getRolePermissions(int roleId) {
        RolePermission[] rolePermissions = _entityManager.createQuery!(RolePermission)(" SELECT rp FROM RolePermission rp WHERE rp.role_id = :roleId ")
            .setParameter("roleId", roleId)
            .getResultList();
        Permission[] permissions;
        auto permissionRepository = new PermissionRepository();
        foreach (rolePermission; rolePermissions) {
            permissions ~= permissionRepository.findById(rolePermission.permission_id);
        }
        return permissions;
    }

    int[] getRolePermissionIds(int roleId){
        RolePermission[] rolePermissions = _entityManager.createQuery!(RolePermission)(" SELECT rp FROM RolePermission rp WHERE rp.role_id = :roleId ")
            .setParameter("roleId", roleId)
            .getResultList();
        int[] ids;
        foreach (rolePermission; rolePermissions) {
            ids ~= rolePermission.permission_id;
        }
        return ids;
    }

    bool saves(int roleId, int[] permissionIds)
    {
        RolePermission[] rolePermission;
        foreach(permissionId; permissionIds){
            RolePermission r = new RolePermission();
            r.role_id = roleId;
            r.permission_id = permissionId;
            rolePermission ~= r;
        }
        this.saveAll(rolePermission);
        return true;
    }

    bool removes(int roleId) {
        RolePermission[] rolePermissions = _entityManager.createQuery!(RolePermission)(" SELECT rp FROM RolePermission rp WHERE rp.role_id = :roleId ")
            .setParameter("roleId", roleId)
            .getResultList();
        this.removeAll(rolePermissions);
        return true;
    }

}
