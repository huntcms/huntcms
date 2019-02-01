module app.component.document.repository.NodeRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.document.model.Node;
import hunt.util.Serialize;
import hunt.logging;

class NodeRepository : EntityRepository!(Node, int){

    // private EntityManager _entityManager;

    // this(EntityManager manager = null){
    //     super(manager);
    //     _entityManager = manager is null ? createEntityManager() : manager;
    // }

    Page!(Node) findPageAll(string[string] conditions, int page, int limit) {
        string strConditions = " 1 ";
        foreach(key, condition; conditions){
            if(condition != "")
                strConditions ~= " AND `" ~ key ~ "` = '" ~ condition ~ "' ";
        }
        auto condition = new Condition(strConditions);
        auto sortCondition = new Sort();
        // sortCondition.add(new Order(Field.status, OrderBy.DESC));
        page = page - 1;
        auto pageable = new Pageable((page < 0 ? 0 : page), limit, sortCondition);
        return findAll(condition, pageable);
    }

    string[] findIdsByPid(int docId, int id){
        EntityManager _entityManager = createEntityManager();
        auto nodes = _entityManager.createQuery!(Node)("SELECT n FROM Node n WHERE n.parent_id = :parentId AND n.document_id = :documentId ")
            .setParameter("documentId", docId)
            .setParameter("parentId", id)
            .getResultList();
        _entityManager.close();    
        string[] ids;
        foreach (node; nodes) {
            ids ~= (node.id).to!string;
        }
        return ids;
    }

    Node[] findAllByStrIds(string ids){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Node)("SELECT n FROM Node n WHERE n.parent_id in ( " ~ ids ~ " ) OR n.id in ( " ~ ids ~ " ) ")
            .getResultList();
        _entityManager.close();    
        return res;
    }

    Node[] findAllByDocId(int docId){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Node)(" SELECT n FROM Node n WHERE n.document_id = :documentId ")
            .setParameter("documentId", docId)
            .getResultList();
        _entityManager.close();    
        return res;
    }

    Node[] findAllSortByDocId(int docId){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Node)(" SELECT n FROM Node n WHERE n.document_id = :documentId AND n.status = 1 ORDER BY n.sort=0 ASC, n.sort ")
            .setParameter("documentId", docId)
            .getResultList();
        _entityManager.close();    
        return res;
    }

    Node findCurrectNode(string sign, int docId){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Node)(" SELECT p FROM Node p WHERE p.sign_key = :sign AND p.document_id = :docId AND p.status = 1 ")
            .setParameter("sign", sign)
            .setParameter("docId", docId)
            .getSingleResult();
        _entityManager.close();    
        return res;
    }

    Node findFirstNodeSignByDocId(int docId){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Node)(" SELECT p FROM Node p WHERE p.document_id = :docId AND p.status = 1 ORDER BY sort=0 ASC,sort ")
            .setParameter("docId", docId)
            .getSingleResult();
            
        _entityManager.close();    
        return res;
    }

    Node[][int] findAllNodesByDocId(int docId){

        Node[][int] initNodes;
        EntityManager _entityManager = createEntityManager();
        auto nodes = _entityManager.createQuery!(Node)(" SELECT n FROM Node n WHERE n.status = 1 AND n.document_id = :docId ")
            .setParameter("docId", docId)
            .getResultList();

        _entityManager.close();    
        foreach(node; nodes){
            initNodes[node.parent_id] ~= node;
        }
        return initNodes;
    }

    string findAllIdsByDocId(int docId){
        string resIds;
        EntityManager _entityManager = createEntityManager();
        auto nodes = _entityManager.createQuery!(Node)(" SELECT n FROM Node n WHERE n.status = 1 AND n.document_id = :docId ")
            .setParameter("docId", docId)
            .getResultList();
            
        _entityManager.close();    
        foreach(k, node; nodes){
            if(k > 0)
                resIds ~= ", ";
            resIds ~= (node.id).to!string;
        }
        return resIds;
    }

    int[int] copyNode(int newDocId, int oldDocId, int now){
        
        EntityManager _entityManager = createEntityManager();
        auto oldNodes = _entityManager.createQuery!(Node)(" SELECT n FROM Node n WHERE n.document_id = :documentId ORDER BY n.parent_id ASC ")
            .setParameter("documentId", oldDocId)
            .getResultList();

        int[int] res;
        int[int] tmp;
        foreach(oldNode; oldNodes){
            Node tmpNode = new Node();
            tmpNode.created = now;
            tmpNode.updated = now;
            tmpNode.document_id = newDocId;
            tmpNode.language_id = oldNode.language_id;
            if(oldNode.parent_id == 0)
                tmpNode.parent_id = 0;
            else{
                tmpNode.parent_id = oldNode.parent_id in tmp ? tmp[oldNode.parent_id] : 0;
            }
            tmpNode.sign_key = oldNode.sign_key;
            tmpNode.is_node = oldNode.is_node;
            tmpNode.sort = oldNode.sort;
            tmpNode.status = oldNode.status;

            int newId = (this.save(tmpNode)).id;
            res[newId] = oldNode.id;
            tmp[oldNode.id] = newId;
        }
        _entityManager.close();    
        return res;
    }

    int countAllByDocId(int docId){
        return cast(int) count(new Condition(" %s = %s ", Field.document_id, docId));
    }

    int countChildNum(int nodeId){
        return cast(int) count(new Condition(" %s = %s ", Field.parent_id, nodeId));
    }

    int countUseableChildNum(int nodeId){
        return cast(int) count(new Condition(" %s = %s and %s = 1 ", Field.parent_id, nodeId, Field.status));
    }

}
