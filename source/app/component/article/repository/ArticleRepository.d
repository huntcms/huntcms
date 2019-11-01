module app.component.article.repository.ArticleRepository;

import app.component.article.model.Article;
import app.component.article.model.Category;
import app.component.article.model.TagArticle;

import hunt.framework;
import hunt.logging;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import hunt.framework.Simplify;
import hunt.entity;

import std.conv;

class ArticleRepository : EntityRepository!(Article, int) {

    this() {
        super(defaultEntityManager());
    }

    Page!Article findByArticle(int categoryId, int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        string conditions = categoryId > 0 ? "AND a.categories_id = " ~ categoryId.to!string ~ " " : "";
        string sql = "SELECT a,c FROM Article a LEFT JOIN Category c ON c.id = a.categories_id WHERE a.deleted = 0 " ~ conditions 
            ~ "ORDER BY a.updated DESC, a.id DESC";
        return _manager.createQuery!(Article)(sql, new Pageable(page - 1, perPage))
            .getPageResult();
    }

}
