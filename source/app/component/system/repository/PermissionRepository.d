module app.component.system.repository.PermissionRepository;

import hunt.entity.repository;
import hunt.entity.EntityManager;

import app.component.system.model.Permission;

class PermissionRepository : EntityRepository!(Permission, string)
{
    this(EntityManager manager = null)
    {
        super(manager);
    }
}
