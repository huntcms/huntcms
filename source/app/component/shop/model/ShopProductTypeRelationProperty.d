module app.component.shop.model.ShopProductTypeRelationProperty;

import hunt.entity;

@Table("shop_type_relation_property")
class ShopProductTypeRelationProperty : Model
{
   mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;
    int type_id;
    int property_id;
    int sort;
    int created;
    int updated;
}