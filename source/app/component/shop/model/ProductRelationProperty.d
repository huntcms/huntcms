module app.component.shop.model.ProductRelationProperty;

import hunt.entity;

@Table("shop_product_relation_property")
class ProductRelationProperty : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;


    int product_id;

    int property_id;

    int property_option_id;

    string property_input;

    // timestamp
    int created;

    // timestamp
    int updated;
}
