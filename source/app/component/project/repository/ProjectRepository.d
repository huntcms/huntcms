module app.component.project.repository.ProjectRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.project.model.Project;
import hunt.util.Serialize;
import hunt.logging;

class ProjectRepository : EntityRepository!(Project, int)
{

    // private EntityManager _entityManager;

    // this(EntityManager manager = null){
    //     super(manager);
    //     _entityManager = manager is null ? createEntityManager() : manager;
    // }

    Project findDetailBySign(string sign){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Project)(" SELECT p FROM Project p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        _entityManager.close();
        return res;
    }

}
