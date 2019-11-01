module app.component.tag.model.Tag;

import app.component.article.model.TagArticle;
import hunt.entity;

@Table("tag_tag")
class Tag : Model {

    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    int sort;
    // 1: enabled, 0: disabled
    short status;

    // timestamp
    int created;

    // timestamp
    int updated;

    // timestamp
    int deleted;

}
