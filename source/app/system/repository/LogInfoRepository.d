module app.system.repository.LogInfoRepository;

import entity.repository;

import app.system.model.LogInfo;

import entity;
import entity.EntityManager;

import kiss.logger;
import hunt;

class LogInfoRepository : EntityRepository!(LogInfo, int)
{

    // struct Objects
    // {
    //     CriteriaBuilder builder;
    //     CriteriaQuery!LogInfo criteriaQuery;
    //     Root!LogInfo root;
    // }

    this(EntityManager manager = null) {
        // if(manager !is null)
        //     manager = Application.getInstance().getEntityManagerFactory().createEntityManager();
        super(manager);
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
