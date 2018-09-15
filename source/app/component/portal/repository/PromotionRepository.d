module app.component.portal.repository.PromotionRepository;

import hunt.entity.repository;
import app.component.portal.model.Promotion;
import hunt.framework;
import std.json;

class PromotionRepository : EntityRepository!(Promotion, int)
{
    private EntityManager _entityMnagaer;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Promotion criteriaQuery;
        Root!Promotion root;
    }

    this(EntityManager manager = null)
    {
         _entityMnagaer = manager is null ? createEntityManager() : manager;
        super(_entityMnagaer);
    }
}