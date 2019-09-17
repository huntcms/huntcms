module app.component.portal.repository.PromotionRepository;

import hunt.entity.repository;
import app.component.portal.model.Promotion;
import hunt.framework;
import std.json;

class PromotionRepository : EntityRepository!(Promotion, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }



    Page!Promotion findByPromotion(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp = _manager.createQuery!(Promotion)("SELECT p FROM Promotion p", new Pageable(page, perPage))
        .getPageResult();
        return temp;
    }

}