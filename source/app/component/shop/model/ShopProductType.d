module app.component.shop.model.ShopProductType;

import hunt.entity;

@Table("shop_product_type")
class ShopProductType : Model
{
   mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;
    string title;
    int status;
    int updated;
    int created;
}