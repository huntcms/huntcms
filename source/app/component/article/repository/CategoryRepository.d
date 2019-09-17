module app.component.article.repository.CategoryRepository;

import hunt.entity.repository;
import app.component.article.model.Category;
import hunt.framework;

class CategoryRepository : EntityRepository!(Category, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Page!Category findByCategory(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp = _manager.createQuery!(Category)("SELECT c FROM Category c", new Pageable(page, perPage))
        .getPageResult();
        return temp;
    }
}