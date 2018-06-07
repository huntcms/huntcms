module app.system.repository.MenuRepository;

import entity.repository;
import app.system.model.Menu;

class MenuRepository : EntityRepository!(Menu, int)
{
    Menu[] getMenus(int parentId)
    {
        // TODO
        return null;
    }
}
