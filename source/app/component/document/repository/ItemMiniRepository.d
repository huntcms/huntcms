module app.component.document.repository.ItemMiniRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.ItemMini;
import hunt.util.Serialize;
import hunt.logging;

class ItemMiniRepository : EntityRepository!(ItemMini, int){

    // private EntityManager _entityManager;

    // this(EntityManager manager = null){
    //     super(manager);
    //     _entityManager = manager is null ? createEntityManager() : manager;
    // }

    ItemMini[] findAllByStrIds(string ids){
        // return _entityManager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in (:node_id) ")
            // .setParameter("node_id", ids)
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) ")
            .getResultList();
        _entityManager.close();    
        return res;
    }

    ItemMini[int] findAllByNodeIds(string ids, int languageId){
        ItemMini[int] items;
        EntityManager _entityManager = createEntityManager();
        auto itemMinis = _entityManager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) and im.language_id = :languageId ")
            .setParameter("languageId", languageId)
            .getResultList(); 
        _entityManager.close();    
        foreach(item; itemMinis){
            items[item.node_id] = item;
        }
        return items;
    }

    ItemMini[] findItemsByNodeIds(string ids, int languageId){
        EntityManager _entityManager = createEntityManager();
        ItemMini[] res;
        if(ids){
            res = _entityManager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) and im.language_id = :languageId ")
                .setParameter("languageId", languageId)
                .getResultList();
        }
        _entityManager.close();    
        return res; 
    }

    int countAllByNodeId(int nodeId){
        return cast(int) count(new Condition(" %s = %s ", Field.node_id, nodeId));
    }

    void delItemsByNodeIds(int nodeId){
        EntityManager _entityManager = createEntityManager();
        auto del = _entityManager.createQuery!(ItemMini)(" delete ItemMini im where im.node_id = :nodeId ")
            .setParameter("nodeId", nodeId)
	        .exec();
        // logInfo(del);
        _entityManager.close();    
    }
    
}