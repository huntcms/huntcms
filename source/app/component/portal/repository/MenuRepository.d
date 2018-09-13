module app.component.portal.repository.MenuRepository;

import hunt.entity.repository;
import app.component.portal.model.Menu;
import hunt.framework;
import std.json;

class MenuRepository : EntityRepository!(Menu, int)
{
    private EntityManager _entityMnagaer;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Menu criteriaQuery;
        Root!Menu root;
    }

    this(EntityManager manager = null)
    {
         _entityMnagaer = manager is null ? createEntityManager() : manager;
        super(_entityMnagaer);
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityMnagaer.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!Menu;
        objects.root = objects.criteriaQuery.from();
        objects.criteriaQuery.orderBy(objects.builder.asc(objects.root.Menu.sort));

        return objects;
    }

    Menu[] getMenusByPid(int parentId)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.Menu.pid, parentId);        
        auto typedQuery = _entityMnagaer.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        Menu[] menus = typedQuery.getResultList();
        if(menus.length > 0)
            return menus;
        return null;
    }

    
}
