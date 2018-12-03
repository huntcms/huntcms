module app.component.system.repository.RoleRepository;

import hunt.entity;
import hunt.entity.repository;

import app.component.system.model.Role;
import app.component.system.repository.UserRoleRepository;


class RoleRepository : EntityRepository!(Role, int)
{
    private EntityManager _entityManager;

    // struct Objects
    // {
    //     CriteriaBuilder builder;
    //     CriteriaQuery!Role criteriaQuery;
    //     Root!Role root;
    // }

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
                roleIds ~= value.to!int();
            }
        }
        return roleIds;
    }
}
