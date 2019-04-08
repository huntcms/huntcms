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

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    JSONValue adminList(string[string] conditions = null, int limit = 20) {
        //筛选条件
        string strConditions = "";
        if(conditions !is null && "title" in conditions){
            strConditions = "AND pc.title LIKE '%" ~ conditions["title"] ~ "%' ";
        }
        int page = 1;
        if(conditions !is null && "page" in conditions){
            page = conditions["page"].to!int;
            page = page < 1 ? 1 : page;
        }
        JSONValue result;
        auto allData = _manager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0 " ~ strConditions, new Pageable(page - 1, limit))
            .getPageResult();
        logInfo(allData);
        result["total_count"] = allData.getTotalElements();
        result["total_page"] = allData.getTotalPages();
        JSONValue[] data;
        foreach(productCategory; allData.getContent()) {
            JSONValue tmp = toJSON(productCategory);
            data ~= tmp;
        }
        result["data"] = data;
        return result;
    }

    ProductCategory[] all() {
        return _manager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0 ")
            .getResultList();
    }

    ProductCategory[] childrens(int categoryId) {
        return _manager.createQuery!(ProductCategory)(" SELECT pc FROM ProductCategory pc WHERE pc.deleted = 0 AND pc.pid = :categoryId ")
            .setParameter("categoryId", categoryId)
            .getResultList();
    }

}
