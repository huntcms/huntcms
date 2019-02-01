module app.component.system.repository.FileInfoRepository;

import hunt.framework;
import hunt.entity;
import hunt.entity.EntityManager;
import hunt.entity.repository;
import app.component.system.model.FileInfo;

class FileInfoRepository : EntityRepository!(FileInfo, int)
{

    this(EntityManager manager = null) {
        super(manager);
    }

}
