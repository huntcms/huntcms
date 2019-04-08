module app.component.system.repository.PermissionGroupRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.repository;
import hunt.entity.EntityManager;
import hunt.logging;
import app.component.system.model.PermissionGroup;


class PermissionGroupRepository : EntityRepository!(PermissionGroup, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

}
