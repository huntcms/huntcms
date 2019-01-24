module app.component.shop.repository.ProductCategoryRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import hunt.util.Serialize;
import hunt.logging;
import app.component.shop.model.ProductCategory;

class ProductCategoryRepository : EntityRepository!(ProductCategory, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    JSONValue adminList(string[string] conditions = null, int limit = 20) {
        //筛选条件
        string strConditions = "";
        if(conditions !is null && "title" in conditions){
            strConditions = " AND pc.title = '%" ~ conditions["title"] ~ "%'";
        }

        int offset = 0;
        if(conditions !is null && "page" in conditions){
            int page = conditions["page"].to!int;
            page = page <1 ? 1 : page;
            offset = (page-1) * limit;
        }
        JSONValue result;

        long count = count(new Condition( " pc.deleted = 0 %s ", strConditions));
        int totalCount = count ? cast(int) count : 0;
        result["total_count"] = totalCount;
        result["total_page"] = cast(int) ceil(cast(float) totalCount/limit);
        JSONValue[] data;

        auto query = _entityManager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0" ~ strConditions ~ " LIMIT " ~ limit.to!string ~ " OFFSET " ~ offset.to!string );
        foreach(productCategory; query.getResultList()) {
            JSONValue tmp = toJSON(productCategory);
            data ~= tmp;
        }
        result["data"] = data;
        return result;
    }

    ProductCategory[] all() {
        return _entityManager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0 ")
            .getResultList();
    }

    ProductCategory[] childrens(int categoryId) {
        return _entityManager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0 AND pc.pid = :categoryId ")
            .setParameter("categoryId", categoryId)
            .getResultList();
    }

}
