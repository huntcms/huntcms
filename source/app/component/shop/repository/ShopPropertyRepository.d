module  app.component.shop.repository.ShopPropertyRepository;

import hunt.entity;
import app.component.shop.model.ShopProperty;
import std.conv;
import std.string;
import hunt.logging;

class ShopPropertyRepository: EntityRepository!(ShopProperty, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    ShopProperty[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        logInfo(strIds);
        // return findAll(new Condition(" %s in ( %s ) order by field(%s, %s)", Field.id,strIds, Field.id, strIds));
        return _manager.createQuery!(ShopProperty)(" SELECT sp FROM ShopProperty sp WHERE sp.id in (" ~ strIds ~ ") ORDER BY sp.id ASC ")
            .getResultList();
    }
}