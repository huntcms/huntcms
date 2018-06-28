module app.system.repository.MenuRepository;

import entity.repository;
import app.system.model.Menu;
import hunt;
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

    this()
    {
         _entityMnagaer = Application.getInstance().getEntityManagerFactory().createEntityManager();
        super(_entityMnagaer);
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityMnagaer.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!Menu;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    Menu[] getMenusByPid(int parentId)
    {
        // TODO
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.Menu.pid, parentId);
        auto typedQuery = _entityMnagaer.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        Menu[] menus = typedQuery.getResultList();
        if(menus.length > 0)
            return menus;
        return null;
    }

    JSONValue getAllMenus()
    {
        JSONValue data = null;
        Menu[] allMenus = this.findAll();
        Menu[] pmenus = this.getMenusByPid(0);      
        
        return data;
    }
}
