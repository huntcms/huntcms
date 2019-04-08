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
        return _manager.createQuery!(User)("SELECT u FROM User u WHERE u.email = :email ")
            .setParameter("email", email)
            .getSingleResult();
    }
}
