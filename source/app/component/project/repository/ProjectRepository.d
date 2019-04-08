module app.component.project.repository.ProjectRepository;

import hunt.entity;
import hunt.entity.repository;
import app.component.project.model.Project;
import hunt.util.Serialize;
import hunt.logging;

class ProjectRepository : EntityRepository!(Project, int)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Project findDetailBySign(string sign){
        auto res = _manager.createQuery!(Project)(" SELECT p FROM Project p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        return res;
    }

}
