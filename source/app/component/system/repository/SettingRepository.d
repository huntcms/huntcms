module app.component.system.repository.SettingRepository;

import app.component.system.model.Setting;

import hunt.entity;
import hunt.framework.Simplify;

class SettingRepository : EntityRepository!(Setting, string) {

    this() {
        super(defaultEntityManager());
    }
    
}
