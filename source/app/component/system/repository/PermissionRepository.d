module app.component.system.repository.PermissionRepository;

import hunt.entity.repository;
import hunt.entity.EntityManager;

import app.component.system.model.Permission;
import app.component.system.model.PermissionGroup;

class PermissionRepository : EntityRepository!(Permission, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Page!Permission findByPermission(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp = _manager.createQuery!(Permission)("SELECT p FROM Permission p", new Pageable(page, perPage))
        .getPageResult();
        return temp;
    }

    Page!PermissionGroup findByPermissionGroup(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp1 = _manager.createQuery!(PermissionGroup)("SELECT p FROM PermissionGroup p", new Pageable(page, perPage))
        .getPageResult();
        return temp1;
    }

}
