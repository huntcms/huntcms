module app.component.article.repository.CategoryRepository;


import hunt.entity.repository;
import app.component.article.model.Category;
import hunt.framework;

class CategoryRepository : EntityRepository!(Category, int)
{
    this(EntityManager manager = null)
    {
        super(manager);
    }
}