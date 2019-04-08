module app.component.document.repository.DocBaseRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.DocBase;
import hunt.util.Serialize;
import hunt.logging;

class DocBaseRepository : EntityRepository!(DocBase, int){

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Page!(DocBase) findPageAll(string[string] conditions, int page, int limit) {
        string strConditions = " 1 ";
        foreach(key, condition; conditions){
            if(condition != ""){
                if(key == "title")
                    strConditions ~= " AND `" ~ key ~ "` LIKE '%" ~ condition ~ "%' ";
                else
                    strConditions ~= " AND `" ~ key ~ "` = '" ~ condition ~ "' ";
            }
        }
        auto condition = new Condition(strConditions);
        auto sortCondition = new Sort();
        // sortCondition.add(new Order(Field.status, OrderBy.DESC));
        // sortCondition.add(new Order(Field.sort, OrderBy.DESC));
        page = page - 1;
        auto pageable = new Pageable((page < 0 ? 0 : page), limit, sortCondition);
        return findAll(condition, pageable);
    }

    int countAllByProjectId(int projectId){
        return cast(int) count(new Condition(" %s = %s ", Field.project_id, projectId));
    }

    int makeCurrect(int projectId){
        auto currect = _manager.createQuery!(DocBase)("SELECT d FROM DocBase d WHERE d.project_id = :projectId ORDER BY d.status DESC, d.sort DESC ")
            .setParameter("projectId", projectId)
            .getSingleResult();
        int curId = currect.id;
        _manager.createQuery!(DocBase)(" update DocBase d set d.currect = 0 where d.project_id = :projectId ")
            .setParameter("projectId", projectId)
            .exec();
        _manager.createQuery!(DocBase)(" update DocBase d set d.currect = 1 where d.id = :id ")
            .setParameter("id", curId)
            .exec();
        return curId;
    }

    int findCurrectNow(int projectId){
        auto currect = _manager.createQuery!(DocBase)("SELECT d FROM DocBase d WHERE d.project_id = :projectId AND d.currect = 1 ")
            .setParameter("projectId", projectId)
            .getSingleResult();  
        if(currect)
            return currect.id;
        return 0;
    }

    DocBase[] currectList(){
        auto res = _manager.createQuery!(DocBase)("SELECT im,b FROM DocBase im LEFT JOIN im.project b WHERE b.status= 1 and im.status= 1 and im.currect = 1 ORDER BY b.sort=0 ASC, b.sort ")
            .getResultList();
        return res;    
    }
}
