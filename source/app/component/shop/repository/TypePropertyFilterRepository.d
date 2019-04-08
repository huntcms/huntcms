module  app.component.shop.repository.TypePropertyFilterRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductTypePropertyFilter;

class TypePropertyFilterRepository:EntityRepository!(ShopProductTypePropertyFilter ,int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }
    
    ShopProductTypePropertyFilter[] findAllByType(int type_id)
    {        
        auto sortCondition = new Sort();
        sortCondition.add(new Order(Field.sort, OrderBy.ASC));
        return super.findAll(new Condition(" %s = %s " , Field.type_id , type_id), sortCondition);
    }
}
