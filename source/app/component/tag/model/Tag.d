module app.component.tag.model.Tag;

import hunt.entity;
public import app.component.article.model.TagArticle;

@Table("tag_tags")
class Tag
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    int sort;
    
    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
