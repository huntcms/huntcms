module app.article.model.Category;

import entity;


@Table("components_category")
class Category
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
