module app.system.repository.PermissionRepository;

import entity.repository;
import entity.EntityManager;

import app.system.model.Permission;
import hunt;


class PermissionRepository : EntityRepository!(Permission, string)
{
    this()
    {
        super(Application.getInstance().getEntityManagerFactory().createEntityManager());
    }
}
