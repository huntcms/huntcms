module app.component.shop.model.TagProduct;

import hunt.entity;
import  app.component.tag.model.Tag;

@Table("tag_product")
class TagProduct 
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int product_id;

    int tag_id;
    // @OneToOne()
    // @JoinColumn("tag_id")
    // Tag tag;
    // timestamp
    int created;

}
