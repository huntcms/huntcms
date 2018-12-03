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

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
