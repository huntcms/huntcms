module app.component.tag.repository.TagRepository;

import hunt.entity.repository;
import app.component.tag.model.Tag;
import hunt.framework;
import std.json;

class TagRepository : EntityRepository!(Tag, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }
      
}