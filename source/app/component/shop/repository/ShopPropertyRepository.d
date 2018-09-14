module  app.component.shop.repository.ShopPropertyRepository;

import hunt.entity;
public import app.component.shop.model.ShopProperty;
import std.conv;
import std.string;

class ShopPropertyRepository:EntityRepository!(ShopProperty ,int)
{
    ShopProperty[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.id,strIds , Field.id , strIds));
    }
}