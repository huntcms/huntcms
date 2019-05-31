module app.component.system.repository.MenuRepository;

import hunt.entity.repository;
import app.component.system.model.Menu;
import hunt.framework;
import std.json;

import hunt.shiro;

struct MenuItemViewModel
{
    string name;
    string keyword;
    string user_link;
    string icon_class;
    MenuItemViewModel[] menus;
}


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

    MenuItemViewModel[] getAllowdMenus(Subject subject)
    {
         MenuItemViewModel[] data;
        // TODO: Tasks pending completion -@zhangxueping at 2019/5/30 下午6:26:55
        // 
        // string cacheKey = "allowd_menus_" ~ userid;

        // MenuItemViewModel[] data = cache().get(cacheKey);
        // if (data)
        // {
        //     return data;
        // }

        // Menu[] allMenus = this.findAll();        
        Menu[] allMenus = this.getAllSort(); 
        Menu[] firstLevelMenus = this.getMenusByPid(0);
        foreach(fmenu; firstLevelMenus)
        {
            string temFid = to!string(fmenu.id); 
            MenuItemViewModel[] allMenusData = null;   

            foreach(aMenu; allMenus) 
            {               
                if(aMenu.pid == fmenu.id && aMenu.status == 1 && subject.isPermitted(aMenu.mca) != -1)
                {
                    string temLink = "";
                    if(aMenu.isAction == 1)
                        temLink = url(aMenu.mca);   
                    else
                        temLink = aMenu.linkUrl;        
                    
                    MenuItemViewModel temInfo; 
                    temInfo.name = aMenu.name;
                    temInfo.keyword = aMenu.keyword;
                    temInfo.user_link = temLink;

                    allMenusData ~= temInfo;           
                } 
            }
            string userUrl = "";
            if(fmenu.isAction == 1)
                userUrl = url(fmenu.mca);
            else
                userUrl = fmenu.linkUrl;

            if(allMenusData !is null) {
                MenuItemViewModel temInfo;
                temInfo .name = fmenu.name;
                temInfo.keyword = fmenu.keyword; 
                temInfo.icon_class = fmenu.iconClass;
                temInfo.menus = allMenusData;
                temInfo.user_link = userUrl;

                data ~= temInfo;
            }
        }
        return data;
    }
    
}
