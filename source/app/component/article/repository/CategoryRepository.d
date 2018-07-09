module app.component.article.repository.CategoryRepository;


import entity.repository;
import app.component.article.model.Category;
import hunt;

class CategoryRepository : EntityRepository!(Category, int)
{
    this(EntityManager manager = null)
    {
        super(manager);
    }
}