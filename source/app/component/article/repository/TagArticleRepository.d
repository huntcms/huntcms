module app.component.article.repository.TagArticleRepository;

import hunt.entity.repository;
import app.component.article.model.TagArticle;
import hunt.framework;
import std.json;

class TagArticleRepository : EntityRepository!(TagArticle, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    TagArticle[] getTagArticle(int articleId) {
        return _entityManager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ")
            .setParameter("articleId", articleId)
            .getResultList();
    }

    bool removes(int articleId) {
        TagArticle[] tagArticles = _entityManager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ")
            .setParameter("articleId", articleId)
            .getResultList();

        this.removeAll(tagArticles);
        return true;
    }
}