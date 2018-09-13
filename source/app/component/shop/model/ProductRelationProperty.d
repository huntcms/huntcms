module app.component.shop.model.ProductRelationProperty;

import hunt.entity;

@Table("shop_product_relation_property")
class ProductRelationProperty
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;


    string title;

    string introduction;

    int pid; //父级ID

    short level; //分类层级

    int type_id;//分类关联的类别，当前分类的所有子分类关联同一个类别

    int sort;

    //PC网页商品主图
    string picurl;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
