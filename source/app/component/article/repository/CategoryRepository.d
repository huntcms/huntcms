module app.component.article.repository.CategoryRepository;

import app.component.article.model.Category;
import hunt.entity.repository;
import hunt.entity.EntityManager;
import hunt.framework;

class CategoryRepository : EntityRepository!(Category, int) {

    this() {
        super(defaultEntityManager());
    }

    Page!Category findByCategory(int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        return _manager.createQuery!(Category)("SELECT c FROM Category c", new Pageable(page - 1, perPage))
            .getPageResult();
    }
}