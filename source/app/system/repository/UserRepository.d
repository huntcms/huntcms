module app.system.repository.UserRepository;

import entity.repository;

import app.system.model.User;

class UserRepository : EntityRepository!(User, int)
{

}
