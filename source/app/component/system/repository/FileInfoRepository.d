module app.component.system.repository.FileInfoRepository;

import hunt.entity.repository;

import app.component.system.model.FileInfo;

import hunt.entity;
import hunt.entity.EntityManager;

import kiss.logger;
import hunt.framework;

class FileInfoRepository : EntityRepository!(FileInfo, int)
{

    // struct Objects
    // {
    //     CriteriaBuilder builder;
    //     CriteriaQuery!FileInfo criteriaQuery;
    //     Root!FileInfo root;
    // }

    this(EntityManager manager = null) {
        super(manager);
    }


    // Objects newObjects()
    // {
    //     Objects objects;

    //     objects.builder = getEntityManager().getCriteriaBuilder();
    //     objects.criteriaQuery = objects.builder.createQuery!FileInfo;
    //     objects.root = objects.criteriaQuery.from();

    //     return objects;
    // }
    
}
