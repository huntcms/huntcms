module app.component.system.repository.MenuRepository;

import hunt.entity.repository;
import app.component.system.model.Menu;
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
        return _entityManager.createQuery!(Menu)(" SELECT m FROM Menu m WHERE m.pid = :parentId ")
            .setParameter("parentId", parentId)
            .getResultList();
    }

    JSONValue[] getAllMenus(string getAllMenus)
    {
        JSONValue[] data = null;    
        Menu[] allMenus = this.findAll();        
        Menu[] firstLevelMenus = this.getMenusByPid(0);
        foreach(fmenu; firstLevelMenus)
        {
            string temFid = to!string(fmenu.id); 
            JSONValue[] allMenusData = null;   
            foreach(aMenu; allMenus) 
            {               
                if(aMenu.pid == fmenu.id && aMenu.status == 1 && getAllMenus.indexOf(aMenu.mca) != -1)
                {
                    string temLink = "";
                    if(aMenu.isAction == 1)
                        temLink = url(aMenu.mca);   
                    else
                        temLink = aMenu.linkUrl;              
                    allMenusData ~= toJson(["name": aMenu.name, "user_link": temLink]);           
                } 
            }
            string userUrl = "";
            if(fmenu.isAction == 1)
                userUrl = url(fmenu.mca);
            else
                userUrl = fmenu.linkUrl;

            JSONValue temInfo = ["name": JSONValue(fmenu.name), "icon_class": JSONValue(fmenu.iconClass), "menus": JSONValue(allMenusData), "user_link": JSONValue(userUrl)];
            data ~= temInfo;
        }
        return data;
    }
    
}
