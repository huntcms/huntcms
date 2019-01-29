module app.component.tag.repository.TagRepository;

import hunt.entity.repository;
import app.component.tag.model.Tag;
import hunt.framework;
import std.json;

class TagRepository : EntityRepository!(Tag, int)
{
    private EntityManager _entityMnagaer;

    this(EntityManager manager = null)
    {
         _entityMnagaer = manager is null ? createEntityManager() : manager;
        super(_entityMnagaer);
    }
      
}