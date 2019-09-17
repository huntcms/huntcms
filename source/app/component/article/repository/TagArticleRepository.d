module app.component.article.repository.TagArticleRepository;

import hunt.entity.repository;
import app.component.article.model.TagArticle;
import hunt.framework;
import std.json;

class TagArticleRepository : EntityRepository!(TagArticle, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    TagArticle[] getTagArticle(int articleId) {
        return _manager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ")
            .setParameter("articleId", articleId)
            .getResultList();
    }

    bool removes(int articleId) {
        TagArticle[] tagArticles = _manager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ")
            .setParameter("articleId", articleId)
            .getResultList();

        this.removeAll(tagArticles);
        return true;
    }

    Page!TagArticle findByTagArticle(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp1 = _manager.createQuery!(TagArticle)("SELECT t FROM TagArticle t", new Pageable(page, perPage))
        .getPageResult();
        return temp1;
    }

}