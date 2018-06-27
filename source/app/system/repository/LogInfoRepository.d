module app.system.repository.LogInfoRepository;

import entity.repository;

import app.system.model.LogInfo;

import entity;
import entity.EntityManager;

import kiss.logger;

class LogInfoRepository : EntityRepository!(LogInfo, int)
{

    struct Objects
    {
        CriteriaBuilder builder;
        CriteriaQuery!LogInfo criteriaQuery;
        Root!LogInfo root;
    }

    this(EntityManager manager = null) {
        super(manager);
    }


    Objects newObjects()
    {
        Objects objects;

        objects.builder = getEntityManager().getCriteriaBuilder();
        objects.criteriaQuery = objects.builder.createQuery!LogInfo;
        objects.root = objects.criteriaQuery.from();

        return objects;
    }
}
