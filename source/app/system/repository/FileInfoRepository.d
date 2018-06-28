module app.system.repository.FileInfoRepository;

import entity.repository;

import app.system.model.FileInfo;

import entity;
import entity.EntityManager;

import kiss.logger;

class FileInfoRepository : EntityRepository!(FileInfo, int)
{

    private EntityManager _entityManager;

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!FileInfo criteriaQuery;
        Root!FileInfo root;
    }

    this(EntityManager manager = null) {
        super(manager);
        _entityManager = manager;
    }


    Objects newObjects()
    {
        Objects objects;

        objects.builder = _entityManager.getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!FileInfo;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }
}
