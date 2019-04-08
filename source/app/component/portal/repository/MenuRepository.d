module app.component.portal.repository.MenuRepository;

import hunt.entity.repository;
import app.component.portal.model.Menu;
import hunt.framework;
import std.json;

class MenuRepository : EntityRepository!(Menu, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Menu[] getMenusByPid(int parentId)
    {
        return _manager.createQuery!(Menu)(" SELECT m FROM Menu m WHERE b.pid = :parentId ")
            .setParameter("parentId", parentId)
            .getResultList();
    }

}
