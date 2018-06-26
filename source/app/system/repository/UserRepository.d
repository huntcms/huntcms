module app.system.repository.UserRepository;

import entity.repository;

import app.system.model.User;
import hunt;
class UserRepository : EntityRepository!(User, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }
}
