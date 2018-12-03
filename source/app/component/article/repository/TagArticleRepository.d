module app.component.article.repository.TagArticleRepository;


import hunt.entity.repository;
import app.component.article.model.TagArticle;
import hunt.framework;
import std.json;

class TagArticleRepository : EntityRepository!(TagArticle, int)
{
    private EntityManager _entityManager;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!TagArticle criteriaQuery;
        Root!TagArticle root;
    }
    
    this(EntityManager manager = null)
    {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }


    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!TagArticle;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    // TagArticle[] getTagArticle(int articleId)
    // {
    //     auto objects = this.newObjects();

    //     auto p1 = objects.builder.equal(objects.root.TagArticle.article_id, articleId);        
    //     auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
    //     TagArticle[] tagarticles = typedQuery.getResultList();
    //     if(tagarticles.length > 0)
    //         return tagarticles;
    //     return null;
    // }

    // bool removes(int articleId)
    // {
    //     auto objects = this.newObjects();
    //     auto p1 = objects.builder.equal(objects.root.TagArticle.article_id, articleId);
    //     auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
    //     TagArticle[] tagArticles = typedQuery.getResultList();
    //     this.removeAll(tagArticles);
    //     return true;
    // }

    TagArticle[] getTagArticle(int articleId) {
        auto query = _entityManager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ");
        query.setParameter("articleId", articleId);
        TagArticle[] tagarticles = query.getResultList();

        if(tagarticles.length > 0)
            return tagarticles;
        return null;
    }

    bool removes(int articleId) {
        auto query = _entityManager.createQuery!(TagArticle)(" SELECT ta FROM TagArticle ta WHERE ta.article_id = :articleId ");
        query.setParameter("articleId", articleId);
        TagArticle[] tagArticles = query.getResultList();

        this.removeAll(tagArticles);
        return true;
    }
}