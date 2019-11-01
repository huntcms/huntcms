module app.component.system.repository.LogInfoRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import app.component.system.model.LogInfo;

class LogInfoRepository : EntityRepository!(LogInfo, int) {

    this() {
        super(defaultEntityManager());
    }
    
}
