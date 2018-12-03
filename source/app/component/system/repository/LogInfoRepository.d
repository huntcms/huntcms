module app.component.system.repository.LogInfoRepository;

import hunt.entity.repository;

import app.component.system.model.LogInfo;

import hunt.entity;
import hunt.entity.EntityManager;

// import kiss.logger;
import hunt.framework;

class LogInfoRepository : EntityRepository!(LogInfo, int)
{
    private EntityManager _entityManager;

    // struct Objects
    // {
    //     CriteriaBuilder builder;
    //     CriteriaQuery!LogInfo criteriaQuery;
    //     Root!LogInfo root;
    // }

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager;
    }


    // Objects newObjects()
    // {
    //     Objects objects;

    //     objects.builder = getEntityManager().getCriteriaBuilder();
    //     objects.criteriaQuery = objects.builder.createQuery!LogInfo;
    //     objects.root = objects.criteriaQuery.from();

    //     return objects;
    // }
}
