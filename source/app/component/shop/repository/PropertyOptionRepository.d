module  app.component.shop.repository.PropertyOptionRepository;

import hunt.entity;
public import app.component.shop.model.ShopPropertyOption;

class PropertyOptionRepository:EntityRepository!(ShopPropertyOption ,int)
{
    ShopPropertyOption[] findAllByProperty(int property_id)
    {
        return findAll(new Condition("%s = %s order by sort asc" , Field.property_id , property_id));
    }

    ShopPropertyOption[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.id,strIds , Field.id , strIds));
    }
}

