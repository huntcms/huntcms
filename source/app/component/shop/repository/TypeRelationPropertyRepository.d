module  app.component.shop.repository.TypeRelationPropertyRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductTypeRelationProperty;

class TypeRelationPropertyRepository:EntityRepository!(ShopProductTypeRelationProperty ,int)
{
    ShopProductTypeRelationProperty[] findAllByType(int type_id)
    {
        return super.findAll(new Condition("%s = %s order by sort asc" , Field.type_id , type_id));
    }
}
