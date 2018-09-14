module app.component.shop.repository.ProductCategoryRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import kiss.util.serialize;
import kiss.logger;
import app.component.shop.model.ProductCategory;

class ProductCategoryRepository : EntityRepository!(ProductCategory, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!ProductCategory criteriaQuery;
        Root!ProductCategory root;
    }

    Objects newObjects()
    {
        Objects objects;
        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!ProductCategory;
        objects.root = objects.criteriaQuery.from();
        return objects;
    }

    JSONValue adminList(string[string] conditions = null, int limit = 20)
    {
        auto objects1 = this.newObjects();
        auto objects2 = this.newObjects();
        auto querySelect1 = objects1.criteriaQuery.select(objects1.root).where(objects1.builder.equal(objects1.root.ProductCategory.deleted, 0));
        auto querySelect2 = objects2.criteriaQuery.select(objects2.builder.count(objects2.root)).where(objects2.builder.equal(objects2.root.ProductCategory.deleted, 0));

        //筛选条件
        if(conditions !is null && "title" in conditions){
            querySelect1.where(objects1.builder.like(objects1.root.ProductCategory.title, "'%"~conditions["title"]~"%'"));
            querySelect2.where(objects2.builder.like(objects2.root.ProductCategory.title, "'%"~conditions["title"]~"%'"));
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
        ProductCategory[] productCategorys = typedQuery1.setFirstResult(offset).setMaxResults(limit).getResultList();
        foreach(productCategory; productCategorys)
        {
            JSONValue tmp = toJSON(productCategory);
            data ~= tmp;
        }
        result["data"] = data;
        return result;
    }

    ProductCategory[] all()
    {
        auto objects1 = this.newObjects();
        auto querySelect1 = objects1.criteriaQuery.select(objects1.root).where(objects1.builder.equal(objects1.root.ProductCategory.deleted, 0));
        auto typedQuery1 = _entityManager.createQuery(querySelect1);
        return typedQuery1.getResultList();
    }

    ProductCategory[] childrens(int categoryId)
    {
        auto objects1 = this.newObjects();
        auto p1 = objects1.builder.equal(objects1.root.ProductCategory.deleted, 0);
        auto p2 = objects1.builder.equal(objects1.root.ProductCategory.pid, categoryId);
        auto querySelect1 = objects1.criteriaQuery.select(objects1.root).where(p1, p2);
        auto typedQuery1 = _entityManager.createQuery(querySelect1);
        return typedQuery1.getResultList();
    }
}
