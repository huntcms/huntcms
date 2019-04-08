module  app.component.shop.repository.PropertyOptionRepository;

import hunt.entity;
public import app.component.shop.model.ShopPropertyOption;

class PropertyOptionRepository:EntityRepository!(ShopPropertyOption ,int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    ShopPropertyOption[] findAllByProperty(int property_id)
    {
        auto sortCondition = new Sort();
        sortCondition.add(new Order(Field.sort, OrderBy.ASC));
        return findAll(new Condition(" %s = %s " , Field.property_id , property_id), sortCondition);
    }

    ShopPropertyOption[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        // return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.id,strIds , Field.id , strIds));
        return _manager.createQuery!(ShopPropertyOption)(" SELECT spo FROM ShopPropertyOption spo WHERE spo.id in (" ~ strIds ~ ") ORDER BY spo.id ASC ")
            .getResultList();
    }

     ShopPropertyOption[] findAllByPropertyIds(int[] ids)
     {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        // return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.property_id,strIds , Field.property_id , strIds));
        return _manager.createQuery!(ShopPropertyOption)(" SELECT spt FROM ShopPropertyOption spt WHERE spt.property_id in (" ~ strIds ~ ") ORDER BY spt.property_id ASC ")
            .getResultList();
     }
    
}

