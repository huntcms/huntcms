module app.component.article.repository.TagArticleRepository;

import hunt.entity;
import hunt.entity.repository;
import hunt.entity.EntityManager;
import hunt.framework;       
import app.component.article.model.TagArticle;
import app.component.tag.model.Tag;

import std.json;
import std.conv;


class TagArticleRepository : EntityRepository!(TagArticle, int) {

    this() {
        super(defaultEntityManager());
    }

    TagArticle[] getTagArticle(int articleId) {
        return _manager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ")
            .setParameter("articleId", articleId)
            .getResultList();
    }

    TagArticle[] getTagArticleByIds(int[] articleIds) {
        if (articleIds.length < 1) return null;
        string strIds = articleIds.to!string;
        strIds = strIds[1 .. $ - 1];
        string sql = " SELECT ta, t FROM TagArticle ta LEFT JOIN Tag t ON ta.tag_id = t.id WHERE ta.article_id in (" ~ strIds 
                    ~ ") ORDER BY ta.article_id ASC ";
        return _manager.createQuery!(TagArticle)(sql)
            .getResultList();
    }

    bool removes(int articleId) {
        string sql = " SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ";
        TagArticle[] tagArticles = _manager.createQuery!(TagArticle)(sql)
            .setParameter("articleId", articleId)
            .getResultList();

        this.removeAll(tagArticles);
        return true;
    }

}