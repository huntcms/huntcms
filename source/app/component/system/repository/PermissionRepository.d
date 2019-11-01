module app.component.system.repository.PermissionRepository;

import app.component.system.model.Permission;
import app.component.system.model.PermissionGroup;

import hunt.entity.EntityManager;
import hunt.entity.repository;
import hunt.framework.Simplify;

class PermissionRepository : EntityRepository!(Permission, int) {

    this() {
        super(defaultEntityManager());
    }

    Page!Permission findByPermission(int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        string sql = "SELECT p FROM Permission p";
        auto temp = _manager.createQuery!(Permission)(sql, new Pageable(page - 1, perPage))
            .getPageResult();
        return temp;
    }

    Page!PermissionGroup findByPermissionGroup(int page = 1, int perPage = 10) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        string sql = "SELECT p FROM PermissionGroup p";
        auto temp1 = _manager.createQuery!(PermissionGroup)(sql, new Pageable(page - 1, perPage))
            .getPageResult();
        return temp1;
    }

}
