module app.component.article.model.TagArticle;

import hunt.entity;
import  app.component.tag.model.Tag;
import  app.component.article.model.Article;

@Table("tag_article")
class TagArticle 
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int article_id;

    int tag_id;
    // @OneToOne()
    // @JoinColumn("tag_id")
    // Tag tag;
    // timestamp
    int created;

}
