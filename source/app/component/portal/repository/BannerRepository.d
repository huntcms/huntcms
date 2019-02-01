module app.component.portal.repository.BannerRepository;

import hunt.framework;
import hunt.entity.repository;
import hunt.util.Serialize;
import hunt.logging;
import std.json;
import app.component.portal.model.Banner;

class BannerRepository : EntityRepository!(Banner, int)
{
    private EntityManager _entityManager;

    this(EntityManager manager = null)
    {
         _entityManager = manager is null ? createEntityManager() : manager;
        super(_entityManager);
    }

    Banner[] getBannersByPid(int parentId) {
        return _entityManager.createQuery!(Banner)(" SELECT b FROM Banner b WHERE b.pid = :parentId ")
            .setParameter("parentId", parentId)
            .getResultList();
    }

    Banner[] findAllData(){
        return _entityManager.createQuery!(Banner)(" SELECT b FROM Banner b WHERE b.status = 1 AND deleted = 0 ORDER BY b.sort=0 asc, b.sort ")
            .getResultList();
    }

    JSONValue[] findAllJsonData(){
        JSONValue[] jsonData;
        auto banners = _entityManager.createQuery!(Banner)(" SELECT b FROM Banner b WHERE b.status = 1 AND deleted = 0 ORDER BY b.sort=0 asc, b.sort ")
            .getResultList();
        foreach(banner; banners){
            JSONValue tmp;
            tmp["id"] = banner.title;
            tmp["title"] = banner.title;
            tmp["subtitle"] = banner.subtitle;
            tmp["picurl"] = banner.picurl;
            tmp["url"] = banner.url;
            tmp["status"] = banner.status;
            tmp["sort"] = banner.sort;
            tmp["deleted"] = banner.deleted;
            tmp["updated"] = banner.updated;
            tmp["created"] = banner.created;
            tmp["pid"] = banner.pid;
            tmp["group"] = banner.group;
            tmp["keyword"] = banner.keyword;
            jsonData ~= tmp;
        }
        return jsonData;
    }
}