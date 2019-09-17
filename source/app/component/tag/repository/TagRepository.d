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

    Page!Tag findByTag(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp1 = _manager.createQuery!(Tag)("SELECT t FROM Tag t", new Pageable(page, perPage))
        .getPageResult();
        return temp1;
    }
      
}