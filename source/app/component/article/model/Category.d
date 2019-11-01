module app.component.article.model.Category;

import hunt.entity;

@Table("article_category")
class Category : Model
{
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
