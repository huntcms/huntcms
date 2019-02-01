module app.component.system.repository.UserRepository;

import hunt.entity;
import hunt.entity.repository;
import hunt.logging;
import app.component.system.model.User;
import std.json;

class UserRepository : EntityRepository!(User, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    User findByEmail(string email) { 
        return _entityManager.createQuery!(User)("SELECT u FROM User u WHERE u.email = :email ")
            .setParameter("email", email)
            .getSingleResult();
    }
}
