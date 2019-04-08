module app.component.shop.repository.ProductTypeRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import hunt.util.Serialize;
import hunt.logging;
import hunt.framework;
import app.component.shop.model.ProductType;

class ProductTypeRepository : EntityRepository!(ProductType, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

}
