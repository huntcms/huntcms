module app.component.shop.repository.ProductTypeRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import hunt.util.serialize;
import hunt.logging;
import hunt.framework;
import app.component.shop.model.ProductType;

class ProductTypeRepository : EntityRepository!(ProductType, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

}
