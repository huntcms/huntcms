module app.component.system.repository.PermissionRepository;

import hunt.entity.repository;
import hunt.entity.EntityManager;

import app.component.system.model.Permission;

class PermissionRepository : EntityRepository!(Permission, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }
    
}
