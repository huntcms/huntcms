module app.system.repository.FileInfoRepository;

import entity.repository;

import app.system.model.FileInfo;

import entity;
import entity.EntityManager;

import kiss.logger;
import hunt;

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
