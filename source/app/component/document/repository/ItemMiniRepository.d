module app.component.document.repository.ItemMiniRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.ItemMini;
import hunt.util.Serialize;
import hunt.logging;

class ItemMiniRepository : EntityRepository!(ItemMini, int){

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    ItemMini[] findAllByStrIds(string ids){
        auto res = _manager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) ")
            .getResultList();
        return res;
    }

    ItemMini[int] findAllByNodeIds(string ids, int languageId){
        ItemMini[int] items;
        auto itemMinis = _manager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) and im.language_id = :languageId ")
            .setParameter("languageId", languageId)
            .getResultList();  
        foreach(item; itemMinis){
            items[item.node_id] = item;
        }
        return items;
    }

    ItemMini[] findItemsByNodeIds(string ids, int languageId){
        ItemMini[] res;
        if(ids){
            res = _manager.createQuery!(ItemMini)("SELECT im FROM ItemMini im WHERE im.node_id in ( " ~ ids ~ " ) and im.language_id = :languageId ")
                .setParameter("languageId", languageId)
                .getResultList();
        }
        return res; 
    }

    int countAllByNodeId(int nodeId){
        return cast(int) count(new Condition(" %s = %s ", Field.node_id, nodeId));
    }

    void delItemsByNodeIds(int nodeId){
        auto del = _manager.createQuery!(ItemMini)(" delete ItemMini im where im.node_id = :nodeId ")
            .setParameter("nodeId", nodeId)
	        .exec();
    }
    
}