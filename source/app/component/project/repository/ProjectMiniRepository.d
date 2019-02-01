module app.component.project.repository.ProjectMiniRepository;

import hunt.entity;
import hunt.entity.repository;
import hunt.entity.domain.Sort;
import hunt.entity.criteria.Order;
import hunt.util.Serialize;
import hunt.logging;
import app.component.project.model.ProjectMini;
import std.math;

class ProjectMiniRepository : EntityRepository!(ProjectMini, int)
{

    // private EntityManager _entityManager;

    // this(EntityManager manager = null){
    //     super(manager);
    //     _entityManager = manager is null ? createEntityManager() : manager;
    // }

    Page!(ProjectMini) findPageAll(string[string] conditions, int page, int limit) {
        string strConditions = " 1 ";
        auto condition = new Condition(strConditions);
        auto sortCondition = new Sort();
        // sortCondition.add(new Order(Field.status, OrderBy.DESC));
        // sortCondition.add(new Order(Field.sort, OrderBy.DESC));
        page = page - 1;
        auto pageable = new Pageable((page < 0 ? 0 : page), limit, sortCondition);
        return findAll(condition, pageable);
    }


    ProjectMini[] findPageData(string[string] conditions, int page, int limit){
        string strConditions = "WHERE 1";
        foreach(key, condition; conditions){
            if(condition != ""){
                if(key == "title")
                    strConditions ~= " AND pm." ~ key ~ " LIKE '%" ~ condition ~ "%'";
                else
                    strConditions ~= " AND pm." ~ key ~ " = '" ~ condition ~ "'";
            }
        }
        int first = (page - 1) * limit;
        string strOffset;
        if(first > 0){
            strOffset = "OFFSET " ~ first.to!string;
        }
        // return _entityManager.createQuery!(ProjectMini)(" SELECT pm FROM ProjectMini pm " ~ strConditions ~ " ORDER BY pm.status DESC LIMIT :limit " ~ strOffset)
        //     .setParameter("limit", limit)
        //     .getResultList();
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(ProjectMini)(" SELECT pm FROM ProjectMini pm " ~ strConditions ~ " ORDER BY pm.status DESC LIMIT :limit " ~ strOffset)
            .setParameter("limit", limit)
            .getResultList();
        _entityManager.close();
        return res;
    }
    int[string] findPage(string[string] conditions, int page, int limit){
        int[string] pageInfo;
        string strConditions = " 1";
        foreach(key, condition; conditions){
            if(condition != ""){
                if(key == "title")
                    strConditions ~= " AND hc_project." ~ key ~ " LIKE '%" ~ condition ~ "%'";
                else
                    strConditions ~= " AND hc_project." ~ key ~ " = '" ~ condition ~ "'";
            }
        }
        auto count = count(new Condition(" %s ",strConditions));
        int totalCount = cast(int) count;
        pageInfo["itemCount"] = totalCount;
        pageInfo["pageCount"] = cast(int) ceil(cast(float) totalCount/limit);
        pageInfo["currect"] = page;
        pageInfo["pageSize"] = limit;
        return pageInfo;
    }

    int findCount(){
        auto count = count(new Condition(" %s = 1 ", Field.status));
        return cast(int) count;
    }

    ProjectMini findDetailBySign(string sign){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(ProjectMini)(" SELECT p FROM ProjectMini p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        _entityManager.close();
        return res;
    }
}
