module app.component.system.repository.FrontmenuRepository;

import hunt.entity.repository;
import app.component.system.model.Frontmenu;
import hunt.framework;
import std.json;

class FrontmenuRepository : EntityRepository!(Frontmenu, int)
{
    private EntityManager _entityMnagaer;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Frontmenu criteriaQuery;
        Root!Frontmenu root;
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
        objects.criteriaQuery = objects.builder.createQuery!Frontmenu;
        objects.root = objects.criteriaQuery.from();
        objects.criteriaQuery.orderBy(objects.builder.asc(objects.root.Frontmenu.sort));

        return objects;
    }

    Frontmenu[] getMenusByPid(int parentId)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.Frontmenu.pid, parentId);        
        auto typedQuery = _entityMnagaer.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        Frontmenu[] menus = typedQuery.getResultList();
        if(menus.length > 0)
            return menus;
        return null;
    }

    
}
