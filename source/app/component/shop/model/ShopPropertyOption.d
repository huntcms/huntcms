module app.component.shop.model.ShopPropertyOption;

import hunt.entity;



@Table("shop_property_option")
class ShopPropertyOption : Model
{
   mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;
    int property_id;
    string title;
    int sort;
    int status;
    int updated;
    int created;
}