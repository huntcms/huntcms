module app.components.repository.CategoryRepository;


import entity.repository;
import app.components.model.Category;
import hunt;

class CategoryRepository : EntityRepository!(Category, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }
}