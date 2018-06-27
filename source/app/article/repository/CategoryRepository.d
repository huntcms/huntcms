module app.article.repository.CategoryRepository;


import entity.repository;
import app.article.model.Category;
import hunt;

class CategoryRepository : EntityRepository!(Category, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }
}