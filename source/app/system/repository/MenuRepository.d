module app.system.repository.MenuRepository;

import entity.repository;
import app.system.model.Menu;
import hunt;

class MenuRepository : EntityRepository!(Menu, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }

    Menu[] getMenus(int parentId)
    {
        // TODO
        return null;
    }
}
