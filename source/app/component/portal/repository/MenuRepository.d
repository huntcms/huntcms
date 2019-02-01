module app.component.portal.repository.MenuRepository;

import hunt.entity.repository;
import app.component.portal.model.Menu;
import hunt.framework;
import std.json;

class MenuRepository : EntityRepository!(Menu, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    Menu[] getMenusByPid(int parentId)
    {
        return _entityManager.createQuery!(Menu)(" SELECT m FROM Menu m WHERE b.pid = :parentId ")
            .setParameter("parentId", parentId)
            .getResultList();
    }

}
