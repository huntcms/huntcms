module app.component.system.repository.PermissionRepository;

import entity.repository;
import entity.EntityManager;

import app.component.system.model.Permission;

class PermissionRepository : EntityRepository!(Permission, string)
{
    this(EntityManager manager = null)
    {
        super(manager);
    }
}
