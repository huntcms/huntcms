module  app.component.shop.repository.ShopProductTypeRepository;

import hunt.entity;
public import app.component.shop.model.ShopProductType;

class ShopProductTypeRepository:EntityRepository!(ShopProductType ,int)
{
    ShopProductType[] findAllByIds(int[] ids)
    {
        string strIds = to!string(ids);
        strIds = strIds[1 .. $ - 1];
        return findAll(new Condition(" %s in ( %s ) order by field(%s , %s)" , Field.id,strIds , Field.id , strIds));
    }
}