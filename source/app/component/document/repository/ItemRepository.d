module app.component.document.repository.ItemRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.Item;
import hunt.util.Serialize;
import hunt.logging;

class ItemRepository : EntityRepository!(Item, int){

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Item[] findAllByNodeId(int id){
        auto res = _manager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
            .setParameter("node_id", id)
            .getResultList();
        return res;
    }

    Item findItemByNodeId(int id){
        auto res = _manager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
            .setParameter("node_id", id)
            .getSingleResult();
        return res;
    }

    Item findLangItemByNodeId(int id, int language_id){
        auto res = _manager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id and im.language_id = :language_id ")
            .setParameter("node_id", id)
            .setParameter("language_id", language_id)
            .getSingleResult();
        return res;
    }

    bool copyItem(int[int] nodes, int now){
        foreach(k,v; nodes){
            auto oldList = _manager.createQuery!(Item)("SELECT im FROM Item im WHERE im.node_id = :node_id ")
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
        return true;
    }

}
