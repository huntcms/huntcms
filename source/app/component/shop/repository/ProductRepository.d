module app.component.shop.repository.ProductRepository;

import hunt.entity;
import hunt.entity.domain;
import std.json;
import std.math;
import hunt.util.Serialize;
import hunt.logging;
import hunt.framework;
import app.component.shop.model.Product;
import std.conv;

class ProductRepository : EntityRepository!(Product, int)
{
    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    JSONValue adminList(string[string] conditions = null, int limit = 20)
    {
        string strConditions = "";
        if(conditions !is null && "title" in conditions){
            strConditions = " AND p.title LIKE '%" ~ conditions["title"] ~ "%' ";
        }
        int page = 1;
        if(conditions !is null && "page" in conditions){
            page = conditions["page"].to!int;
            page = page < 1 ? 1 : page;
        }
        JSONValue result;
        auto allData = _manager.createQuery!(Product)(" SELECT p FROM Product p WHERE p.deleted = 0 " ~ strConditions, new Pageable(page - 1, limit))
            .getPageResult();
        logInfo(allData);
        result["total_count"] = allData.getTotalElements();
        result["total_page"] = allData.getTotalPages();
        JSONValue[] data;
        foreach(product; allData.getContent()) {
            JSONValue tmp = toJSON(product);
            data ~= tmp;
        }
        result["data"] = data;
        return result;


    }

}
