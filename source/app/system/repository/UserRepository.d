module app.system.repository.UserRepository;

import entity.repository;

import app.system.model.User;

// import entity.EntityManager;
import hunt;

class UserRepository : EntityRepository!(User, int)
{
    this(EntityManager manager = null) {
        super(manager);
    }
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }


}
