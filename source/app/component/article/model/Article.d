module app.component.article.model.Article;

import entity;
import  app.component.article.model.Category;

@Table("components_article")
class Article 
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    //int categories_id;
    @ManyToOne()
    @JoinColumn("categories_id")
    Category category;

    string title;

    string summary;
  
    string author;

    string content;   

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}