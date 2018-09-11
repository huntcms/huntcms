module app.component.shop.model.ShopProductTypePropertyFilter;

import hunt.entity;

@Table("shop_type_property_filter")
class ShopProductTypePropertyFilter
{
   mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;
    int type_id;
    string title;
    string property_options;
    int sort;
    int updated;
    int created;
}
