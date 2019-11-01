module app.component.system.repository.FileInfoRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import app.component.system.model.FileInfo;
import hunt.framework.Simplify;

class FileInfoRepository : EntityRepository!(FileInfo, int) {

    this() {
        super(defaultEntityManager());
    }

}
