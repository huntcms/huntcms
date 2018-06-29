module app.system.repository.RoleRepository;

import entity.repository;
import app.system.model.Role;

import app.system.repository.UserRoleRepository;
import hunt;


class RoleRepository : EntityRepository!(Role, int)
{
    private EntityManager _entityManager;

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!Role criteriaQuery;
        Root!Role root;
    }

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager;
    }

    Role[] getUserRoles(int userId)
    {
        return this.findAllById(new UserRoleRepository().getUserRoleIds(userId));
    }


    int[] searchPostRoleIds(string[string] requestParams)
    {
        int[] roleIds;

        foreach(key, value; requestParams)
        {
            if(indexOf(key, "roleid") != -1)
            {
                logInfo(key);
                roleIds ~= value.to!int();
            }
        }
        return roleIds;
    }
}
