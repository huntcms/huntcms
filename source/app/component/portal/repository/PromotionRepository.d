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

}