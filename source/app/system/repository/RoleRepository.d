module app.system.repository.RoleRepository;

import entity.repository;
import app.system.model.Role;

import app.system.repository.UserRoleRepository;

class RoleRepository : EntityRepository!(Role, int)
{
    Role[] getUserRoles(int userId)
    {
        return this.findAllById((new UserRoleRepository).getUserRoleIds( userId ));
    }
}
