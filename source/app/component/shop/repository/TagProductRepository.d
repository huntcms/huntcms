module app.component.shop.repository.TagProductRepository;


import hunt.entity.repository;
import app.component.shop.model.TagProduct;
import hunt.framework;
import std.json;

class TagProductRepository : EntityRepository!(TagProduct, int)
{
    private EntityManager _entityManager;
    
    this(EntityManager manager = null)
    {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    TagProduct[] getTagProduct(int productId) {
        auto query = _entityManager.createQuery!(TagProduct)(" SELECT tp FROM TagProduct tp WHERE tp.product_id = :productId ");
        query.setParameter("productId", productId);
        TagProduct[] tagproducts = query.getResultList();
        if(tagproducts.length > 0)
            return tagproducts;
        return null;
    }

    bool removes(int productId) {
        auto query = _entityManager.createQuery!(TagProduct)(" SELECT tp FROM TagProduct tp WHERE tp.product_id = :productId ");
        query.setParameter("productId", productId);
        TagProduct[] tagproducts = query.getResultList();
        this.removeAll(tagproducts);
        return true;
    }
}