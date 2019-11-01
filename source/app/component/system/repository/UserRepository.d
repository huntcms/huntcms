module app.component.system.repository.UserRepository;

import app.component.system.model.User;
import hunt.entity;
import hunt.entity.repository;
import hunt.logging;
import std.json;
import hunt.framework.Simplify;

class UserRepository : EntityRepository!(User, int) {

    this() {
        super(defaultEntityManager());
    }

    User findByEmail(string email) { 
        // trace(email);
        return _manager.createQuery!(User)("SELECT u FROM User u WHERE u.email = :email ")
            .setParameter("email", email)
            .getSingleResult();
    }

    Page!User findByUser(int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        return _manager.createQuery!(User)("SELECT u FROM User u", new Pageable(page - 1, perPage))
            .getPageResult();
    }
}
