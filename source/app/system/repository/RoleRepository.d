module app.system.repository.RoleRepository;

import entity.repository;
import app.system.model.Role;

import app.system.repository.UserRoleRepository;
import hunt;


class RoleRepository : EntityRepository!(Role, int)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }

    Role[] getUserRoles(int userId)
    {
        return this.findAllById((new UserRoleRepository).getUserRoleIds(userId));
    }
}
