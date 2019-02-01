module app.component.system.repository.LanguageRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import hunt.logging;
import app.component.system.model.Language;

class LanguageRepository : EntityRepository!(Language, int) {

    private EntityManager _entityManager;

    this(EntityManager manager = null){
        super(manager);
        _entityManager = manager is null ? createEntityManager() : manager;
    }

    Language findOneBySign(string sign){
        EntityManager _entityManager = createEntityManager();
        auto res = _entityManager.createQuery!(Language)(" SELECT p FROM Language p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        return res;
    }

}
