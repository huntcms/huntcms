module  app.component.shop.repository.TypePropertyFilterRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductTypePropertyFilter;

class TypePropertyFilterRepository:EntityRepository!(ShopProductTypePropertyFilter ,int)
{
    ShopProductTypePropertyFilter[] findAllByType(int type_id)
    {
        return super.findAll(new Condition("%s = %s order by sort asc" , Field.type_id , type_id));
    }
}
