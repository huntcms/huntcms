module app.components.repository.ArticleRepository;


import entity.repository;
import app.components.model.Article;
import hunt;

class ArticleRepository : EntityRepository!(Article, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }
}
