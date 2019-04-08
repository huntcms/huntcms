module app.component.shop.repository.TagProductRepository;


import hunt.entity.repository;
import app.component.shop.model.TagProduct;
import hunt.framework;
import std.json;

class TagProductRepository : EntityRepository!(TagProduct, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    TagProduct[] getTagProduct(int productId) {
        TagProduct[] tagproducts = _manager.createQuery!(TagProduct)(" SELECT tp FROM TagProduct tp WHERE tp.product_id = :productId ")
            .setParameter("productId", productId)
            .getResultList();
        if(tagproducts.length > 0)
            return tagproducts;
        return null;
    }

    bool removes(int productId) {
        TagProduct[] tagproducts = _manager.createQuery!(TagProduct)(" SELECT tp FROM TagProduct tp WHERE tp.product_id = :productId ")
            .setParameter("productId", productId)
            .getResultList();
        this.removeAll(tagproducts);
        return true;
    }
}