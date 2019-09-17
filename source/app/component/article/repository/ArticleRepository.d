module app.component.article.repository.ArticleRepository;

import hunt.entity;
import app.component.article.model.Article;
import app.component.article.model.TagArticle;
import app.component.article.model.Category;
import hunt.logging;
import hunt.framework;

class ArticleRepository : EntityRepository!(Article, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }


    Page!Article findByArticle(int categoriesId, int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        string conditions = categoriesId > 0 ? "WHERE a.categories_id = " ~ categoriesId.to!string : "";
        auto temp = _manager.createQuery!(Article)("SELECT a,c FROM Article a LEFT JOIN Category c ON c.id = a.categories_id " ~ conditions, new Pageable(page, perPage))
        .getPageResult();

        return temp;
    }

}
