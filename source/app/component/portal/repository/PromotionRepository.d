module app.component.portal.repository.PromotionRepository;

import hunt.entity.repository;
import app.component.portal.model.Promotion;
import hunt.framework;
import std.json;

class PromotionRepository : EntityRepository!(Promotion, int)
{
    private EntityManager _entityMnagaer;

    this(EntityManager manager = null)
    {
        _entityMnagaer = manager is null ? createEntityManager() : manager;
        super(_entityMnagaer);
    }
}