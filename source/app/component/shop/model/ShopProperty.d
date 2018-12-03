module app.component.shop.model.ShopProperty;

import hunt.entity;


@Table("shop_property")
class ShopProperty : Model
{
   mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;
    string title;
    string introduce;
    int status;
    int pid;
    int option_type;
    int is_require;
    string keyword;
    int updated;
    int created;
}