module app.component.document.repository.ItemRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.Item;
import hunt.util.Serialize;
import hunt.logging;

class ItemRepository : EntityRepository!(Item, int){

    private EntityManager _entityManager;

    this(EntityManager manager = null){
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }


    Item[] findAllByNodeId(int id){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
            .setParameter("node_id", id)
            .getResultList();
        _entityManager.close();    
        return res;
    }

    Item findItemByNodeId(int id){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
            .setParameter("node_id", id)
            .getSingleResult();
        _entityManager.close();    
        return res;
    }

    Item findLangItemByNodeId(int id, int language_id){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id and im.language_id = :language_id ")
            .setParameter("node_id", id)
            .setParameter("language_id", language_id)
            .getSingleResult();
        _entityManager.close();    
        return res;
    }


    bool copyItem(int[int] nodes, int now){
        EntityManager _entityManager = createEntityManager();
        foreach(k,v; nodes){
            auto oldList = _entityManager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
                .setParameter("node_id", v)
                .getResultList();
            foreach(old; oldList){
                auto tmp = new Item();
                tmp.node_id = k;
                tmp.created = now;
                tmp.updated = now;
                tmp.language_id = old.language_id;
                tmp.title = old.title;
                tmp.content = old.content;
                tmp.status = old.status;
                this.save(tmp);
            }
        }
        _entityManager.close();
        return true;
    }

}
