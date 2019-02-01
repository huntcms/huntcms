module app.component.article.repository.ArticleRepository;

import hunt.entity;
import app.component.article.model.Article;
import hunt.framework;

class ArticleRepository : EntityRepository!(Article, int)
{
    this(EntityManager manager = null)
    {
        super(manager);
    }
}
