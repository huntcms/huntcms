module app.component.shop.repository.ProductTypeRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import kiss.util.serialize;
import kiss.logger;
import app.component.shop.model.ProductType;

class ProductTypeRepository : EntityRepository!(ProductType, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!ProductType criteriaQuery;
        Root!ProductType root;
    }

    Objects newObjects()
    {
        Objects objects;
        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!ProductType;
        objects.root = objects.criteriaQuery.from();
        return objects;
    }

}
