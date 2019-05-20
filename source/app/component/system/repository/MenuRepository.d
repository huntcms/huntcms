module app.component.system.repository.MenuRepository;

import hunt.entity.repository;
import app.component.system.model.Menu;
import hunt.framework;
import std.json;

class MenuRepository : EntityRepository!(Menu, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Menu[] getMenusByPid(int parentId) 
    {
        return _manager.createQuery!(Menu)(" SELECT m FROM Menu m WHERE m.pid = :parentId " 
            ~ "ORDER BY m.sort = 0 ASC, m.sort ASC ")
            .setParameter("parentId", parentId)
            .getResultList();
    }

    Menu[] getAllSort() {
        return _manager.createQuery!(Menu)(" SELECT m FROM Menu m ORDER BY m.sort = 0 ASC, m.sort ASC ")
            .getResultList();
    }

    JSONValue[] getAllMenus(string getAllMenus)
    {
        JSONValue[] data = null;    
        // Menu[] allMenus = this.findAll();        
        Menu[] allMenus = this.getAllSort(); 
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
                    allMenusData ~= toJson(["name": aMenu.name, "keyword": aMenu.keyword, "user_link": temLink]);           
                } 
            }
            string userUrl = "";
            if(fmenu.isAction == 1)
                userUrl = url(fmenu.mca);
            else
                userUrl = fmenu.linkUrl;

            if(allMenusData !is null){
                JSONValue temInfo = ["name": JSONValue(fmenu.name), "keyword": JSONValue(fmenu.keyword), "icon_class": JSONValue(fmenu.iconClass), "menus": JSONValue(allMenusData), "user_link": JSONValue(userUrl)];
                data ~= temInfo;
            }
        }
        return data;
    }
    
}
