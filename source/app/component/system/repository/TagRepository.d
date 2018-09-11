module app.component.system.repository.TagRepository;

import hunt.entity.repository;
import app.component.system.model.Tag;
import hunt.framework;
import std.json;

class TagRepository : EntityRepository!(Tag, int)
{
    private EntityManager _entityMnagaer;
    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Tag criteriaQuery;
        Root!Tag root;
    }

    this(EntityManager manager = null)
    {
         _entityMnagaer = manager is null ? createEntityManager() : manager;
        super(_entityMnagaer);
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityMnagaer.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!Tag;
        objects.root = objects.criteriaQuery.from();
        objects.criteriaQuery.orderBy(objects.builder.asc(objects.root.Tag.sort));

        return objects;
    }

      
}