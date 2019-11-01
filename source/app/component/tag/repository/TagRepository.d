module app.component.tag.repository.TagRepository;

import app.component.tag.model.Tag;
import hunt.entity.repository;
import hunt.framework;
import std.json;
import std.conv;

class TagRepository : EntityRepository!(Tag, int) {

    this() {
        super(defaultEntityManager());
    }

    Page!Tag findTagPage(int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        return  _manager.createQuery!(Tag)("SELECT t FROM Tag t WHERE t.delete = 0", new Pageable(page - 1, perPage))
            .getPageResult();
    }
      
    Tag[] findTagsByIds(int[] ids) {
        if (ids.length < 1) return null;
        string idStr = ids.to!string;
        idStr = idStr[1 .. $ - 1];
        return  _manager.createQuery!(Tag)("SELECT t FROM Tag t WHERE t.delete = 0 and t.id in (" ~ idStr ~ ")")
            .getResultList();
    }


}