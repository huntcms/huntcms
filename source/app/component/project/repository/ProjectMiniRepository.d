module app.component.project.repository.ProjectMiniRepository;

import hunt.entity;
import hunt.entity.repository;
import hunt.entity.domain.Sort;
import hunt.entity.criteria.Order;
import hunt.util.Serialize;
import hunt.logging;
import app.component.project.model.ProjectMini;
import app.component.document.model.DocBase;
import std.math;
import std.json;

class ProjectMiniRepository : EntityRepository!(ProjectMini, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

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
        // return _manager.createQuery!(ProjectMini)(" SELECT pm FROM ProjectMini pm " ~ strConditions ~ " ORDER BY pm.status DESC LIMIT :limit " ~ strOffset)
        //     .setParameter("limit", limit)
        //     .getResultList();
        auto res = _manager.createQuery!(ProjectMini)(" SELECT pm FROM ProjectMini pm " ~ strConditions ~ " ORDER BY pm.status DESC LIMIT :limit " ~ strOffset)
            .setParameter("limit", limit)
            .getResultList();
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
        auto res = _manager.createQuery!(ProjectMini)(" SELECT p FROM ProjectMini p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        return res;
    }

    /**
     *
     */
    JSONValue pageList(string[string] conditions, int page, int limit){
        string strConditions = "WHERE 1";
        foreach(key, condition; conditions){
            if(condition != ""){
                if(key == "title")
                    strConditions ~= " AND pm." ~ key ~ " LIKE '%" ~ condition ~ "%'";
                else
                    strConditions ~= " AND pm." ~ key ~ " = '" ~ condition ~ "'";
            }
        }

        JSONValue result;
        
        auto allData = _manager.createQuery!(ProjectMini)(" SELECT pm FROM ProjectMini pm " ~ strConditions ~ " ORDER BY pm.status DESC ", new Pageable(page - 1, limit))
            .getPageResult();
        result["cur"] = page;
        result["size"] = limit;
        result["next"] = page + 1;
        result["prev"] = page - 1;
        result["total"] = allData.getTotalElements();
        result["totalPages"] = allData.getTotalPages();
        JSONValue[] data;
        foreach(projectMini; allData.getContent()) {
            JSONValue tmp = toJSON(projectMini);
            tmp["doc_version"] = "";
            tmp["doc_id"] = 0;
            auto curDoc = _manager.createQuery!(DocBase)(" SELECT doc FROM DocBase doc WHERE doc.currect = 1 and doc.project_id = :projectId ORDER BY doc.sort DESC LIMIT 1 ")
                .setParameter("projectId", projectMini.id)
                .getSingleResult();
            if(curDoc){
                tmp["doc_version"] = curDoc.doc_version;
                tmp["doc_id"] = curDoc.id;
            }
            data ~= tmp;
        }

        result["data"] = data;

        return result;

    }

}
