module  app.component.shop.repository.ShopProductTypeRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductType;

class ShopProductTypeRepository:EntityRepository!(ShopProductType ,int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }
    
    ShopProductType[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        // return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.id,strIds , Field.id , strIds));
        return _manager.createQuery!(ShopProductType)(" SELECT spt FROM ShopProductType spt WHERE spt.id in (" ~ strIds ~ ") ORDER BY spt.id ASC ")
            .getResultList();
    }
}