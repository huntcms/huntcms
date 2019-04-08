module app.component.system.repository.LanguageRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import hunt.logging;
import app.component.system.model.Language;

class LanguageRepository : EntityRepository!(Language, int) {

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }

    Language findOneBySign(string sign){
        auto res = _manager.createQuery!(Language)(" SELECT p FROM Language p WHERE p.sign = :sign")
            .setParameter("sign", sign)
            .getSingleResult();
        return res;
    }

}
