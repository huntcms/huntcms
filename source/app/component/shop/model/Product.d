module app.component.shop.model.Product;

import hunt.entity;

@Table("shop_product")
class Product
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int category_id;

    string code;

    string title;

    string introduction;

    int brand_id;

    int min_price;

    int max_price;

    string content;

    int sort;

    //PC网页商品主图
    string pc_picurl;

    //app商品主图
    string app_picurl;

    //移动网站商品主图
    string wap_picurl;

    //视频地址
    string videourl;

    //商品多图json
    string picurls;

    // timestamp
    int deleted;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
