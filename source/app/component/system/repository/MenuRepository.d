module app.component.system.repository.MenuRepository;

import entity.repository;
import app.component.system.model.Menu;
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

    JSONValue[] getAllMenus(string getAllMenus)
    {
        JSONValue[] data = null;    

        Menu[] allMenus = this.findAll();        

        Menu[] firstLevelMenus = this.getMenusByPid(0);
        foreach(fmenu ; firstLevelMenus)
        {
           string temFid = to!string(fmenu.id); 
          
           JSONValue[] allMenusData = null;   
           foreach(aMenu ; allMenus)
           {               
                if(aMenu.pid == fmenu.id && aMenu.status == 1 && getAllMenus.indexOf(aMenu.mca) != -1){
                    string temLink = "";
                    if(aMenu.isAction == 1){
                        temLink = createUrl(aMenu.mca);   
                    }else{
                        temLink = aMenu.linkUrl ;   
                    }                                    
                    allMenusData ~= toJson(["name" :aMenu.name , "user_link" : temLink ]) ;           
                } 
           }

           string userUrl = "";
           if(fmenu.isAction == 1){
               userUrl = createUrl(fmenu.mca);
           }else{
               userUrl = fmenu.linkUrl ;
           }
                     
           JSONValue temInfo = ["name" : JSONValue(fmenu.name) , "icon_class" : JSONValue(fmenu.iconClass) , "menus" :JSONValue(allMenusData), "user_link" : JSONValue(userUrl) ];
           data ~= temInfo;
        }
       
        return data;
    }
    
}
