module app.component.shop.repository.TagProductRepository;


import hunt.entity.repository;
import app.component.shop.model.TagProduct;
import hunt.framework;
import std.json;

class TagProductRepository : EntityRepository!(TagProduct, int)
{
    private EntityManager _entityManager;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!TagProduct criteriaQuery;
        Root!TagProduct root;
    }
    
    this(EntityManager manager = null)
    {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }


    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!TagProduct;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    TagProduct[] getTagProduct(int productId)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.TagProduct.product_id, productId);        
        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        TagProduct[] tagproducts = typedQuery.getResultList();
        if(tagproducts.length > 0)
            return tagproducts;
        return null;
    }

    bool removes(int productId)
    {
        auto objects = this.newObjects();
        auto p1 = objects.builder.equal(objects.root.TagProduct.product_id, productId);
        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        TagProduct[] tagproducts = typedQuery.getResultList();
        this.removeAll(tagproducts);
        return true;
    }
}