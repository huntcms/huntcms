module app.system.repository.UserRepository;

import entity.repository;

import app.system.model.User;

// import entity.EntityManager;
import hunt;

class UserRepository : EntityRepository!(User, int)
{
    private EntityManager _entityManager;

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!User criteriaQuery;
        Root!User root;
    }

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!User;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }

    User findByEmail(string email)
    {
        auto objects = this.newObjects();

        auto p1 = objects.builder.equal(objects.root.User.email, email);

        auto typedQuery = _entityManager.createQuery(objects.criteriaQuery.select(objects.root).where( p1 ));
        User[] users = typedQuery.getResultList();
        if(users.length > 0)
            return users[0];
        return null;
    }
}
