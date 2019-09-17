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


    Page!PermissionGroup findByPermissionGroup(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp = _manager.createQuery!(PermissionGroup)("SELECT p FROM PermissionGroup p", new Pageable(page, perPage))
        .getPageResult();
        return temp;
    }



}
