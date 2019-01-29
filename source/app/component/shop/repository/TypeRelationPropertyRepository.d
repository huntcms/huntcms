module  app.component.shop.repository.TypeRelationPropertyRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductTypeRelationProperty;

class TypeRelationPropertyRepository:EntityRepository!(ShopProductTypeRelationProperty ,int)
{
    ShopProductTypeRelationProperty[] findAllByType(int type_id)
    {
        auto sortCondition = new Sort();
        sortCondition.add(new Order(Field.sort, OrderBy.ASC));
        return super.findAll(new Condition(" %s = %s " , Field.type_id , type_id), sortCondition);
    }

    int[] findAllByPropertyIds(int type_id)
    {
        int[] ids;        
        auto sortCondition = new Sort();
        sortCondition.add(new Order(Field.sort, OrderBy.ASC));
        auto results = super.findAll(new Condition(" %s = %s " , Field.type_id , type_id), sortCondition);
        foreach(result; results)
        {
            ids ~= result.property_id;
        }
        return ids;
    }
}
