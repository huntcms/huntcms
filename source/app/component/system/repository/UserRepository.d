module app.component.system.repository.UserRepository;

import hunt.entity;
import hunt.entity.repository;
import hunt.logging;
import app.component.system.model.User;
import std.json;

class UserRepository : EntityRepository!(User, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    User findByEmail(string email) { 
        // trace(email);
        return _manager.createQuery!(User)("SELECT u FROM User u WHERE u.email = :email ")
            .setParameter("email", email)
            .getSingleResult();
    }

    Page!User findByUser(int page = 0, int perPage = 10)
    {
        page = page < 1 ? 0 : page;
        perPage = perPage < 1 ? 10 : perPage;

        auto temp = _manager.createQuery!(User)("SELECT u FROM User u", new Pageable(page, perPage))
        .getPageResult();
        logError(temp);
        return temp;
    }
}
