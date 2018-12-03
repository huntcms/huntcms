module app.component.shop.model.ProductType;

import hunt.entity;

@Table("shop_product_type")
class ProductType : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string title;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
