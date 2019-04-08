module app.component.system.repository.SettingRepository;

import app.component.system.model.Setting;

import hunt.entity;

class SettingRepository : EntityRepository!(Setting, string)
{

    this(EntityManager manager = null) {
        super(manager is null ? createEntityManager() : manager);
    }
    
}
