module app.component.shop.repository.ProductRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import hunt.util.serialize;
import hunt.logging;
import hunt.framework;
import app.component.shop.model.Product;

class ProductRepository : EntityRepository!(Product, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Product criteriaQuery;
        Root!Product root;
    }

    Objects newObjects()
    {
        Objects objects;
        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!Product;
        objects.root = objects.criteriaQuery.from();
        return objects;
    }

    JSONValue adminList(string[string] conditions = null, int limit = 20)
    {
        auto objects1 = this.newObjects();
        auto objects2 = this.newObjects();
        auto querySelect1 = objects1.criteriaQuery.select(objects1.root).where(objects1.builder.equal(objects1.root.Product.deleted, 0));
        auto querySelect2 = objects2.criteriaQuery.select(objects2.builder.count(objects2.root)).where(objects2.builder.equal(objects2.root.Product.deleted, 0));

        //筛选条件
        if(conditions !is null && "title" in conditions){
            querySelect1.where(objects1.builder.like(objects1.root.Product.title, "'%"~conditions["title"]~"%'"));
            querySelect2.where(objects2.builder.like(objects2.root.Product.title, "'%"~conditions["title"]~"%'"));
        }
        //筛选条件

        auto typedQuery1 = _entityManager.createQuery(querySelect1);
        auto typedQuery2 = _entityManager.createQuery(querySelect2);

        int offset = 0;
        if(conditions !is null && "page" in conditions){
            int page = conditions["page"].to!int;
            page = page <1 ? 1 : page;
            offset = (page-1) * limit;
        }
        JSONValue result;
        Long count = cast(Long)(typedQuery2.getSingleResult());
        int totalCount = count ? count.longValue().to!int : 0;
        result["total_count"] = totalCount;
        result["total_page"] = cast(int) ceil(cast(float) totalCount/limit);
        JSONValue[] data;
        Product[] products = typedQuery1.setFirstResult(offset).setMaxResults(limit).getResultList();
        foreach(product; products)
        {
            JSONValue tmp = toJSON(product);
            data ~= tmp;
        }
        result["data"] = data;
        logInfo(result);
        return result;
    }

}
