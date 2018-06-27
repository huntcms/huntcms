module app.system.repository.UserRepository;

import entity.repository;

import app.system.model.User;

import entity.EntityManager;

class UserRepository : EntityRepository!(User, int)
{
    this(EntityManager manager = null) {
        super(manager);
    }
}
