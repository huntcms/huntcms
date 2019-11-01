module app.component.portal.controller.admin.BannerController;

import app.component.portal.model.Banner;
import app.component.portal.repository.BannerRepository;
import app.component.portal.validation.BannerForm;
import app.component.system.controller.admin.LogMiddleware;
import app.component.system.helper.Utils;
import app.lib.controller.AdminBaseController;
import app.lib.functions;

import hunt.framework;
import hunt.http.codec.http.model.HttpMethod;
import hunt.util.Configuration;

import std.digest.sha;
import std.file;
import std.json;

class BannerController : AdminBaseController {

    mixin MakeController;

    this() {
        super();      
        this.addMiddleware(new LogMiddleware());
    }

    @Action 
    Response list(int perPage = 10, int page = 1) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 5 : perPage;
        auto alldata = new BannerRepository().findByBanner(page, perPage);

        view.assign("banners", alldata.getContent());
        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));

        makePageBreadCrumbs("bannerList");
        return ResponseView("portal/banner/list");
    }
    
    @Action 
    Response add(BannerForm bannerForm) {

        BannerRepository bannerRepository = new BannerRepository();
        int errorNum = 0;

        if(request.methodAsString() == HttpMethod.POST.asString()) {
            auto validRes = bannerForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }                
                return new RedirectResponse(request, url("admin:portal.banner.add"));
            }

            int now = cast(int) time();
            Banner banner = new Banner();
            banner.title = bannerForm.title;
            banner.subtitle = bannerForm.subtitle;
            banner.sort = bannerForm.sort;
            banner.status = bannerForm.statusRadio;
            banner.url = bannerForm.url;
            banner.keyword = bannerForm.keyword;
            banner.picurl = bannerForm.picurl;
            banner.pid = bannerForm.pid;
            banner.group = bannerForm.group;
            banner.created = now;
            banner.updated = now;

            bannerRepository.save(banner);
            assignSussess("数据保存成功! ");
            return new RedirectResponse(request, url("admin:portal.banner.list"));
        }
        
        makePageBreadCrumbs("bannerAdd");
        view.assign("groups", bannerRepository.getBannersByPid(1));
        
        return ResponseView("portal/banner/add");
    }

    @Action 
    Response edit(BannerForm bannerForm) {
        
        int id, errorNum = 0;
        Banner banner;
        BannerRepository bannerRepository = new BannerRepository();
        
        if(request.methodAsString() == HttpMethod.POST.asString()) {

            id = initNum("id", 0, "POST");
            if (id > 0) {
                banner = bannerRepository.find(id);
                if (banner is null) {
                    errorNum += 1;
                    assignError("数据异常或不存在, 请稍后重试! ");
                }
            } else {
                errorNum += 1;
                assignError("缺少参数id, 请稍后重试! ");
            }
            if(errorNum > 0) {
                return new RedirectResponse(request, url("admin:portal.banner.list"));
            }

            auto validRes = bannerForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }                
                string[string] params;
                params["id"] = id.to!string;
                return new RedirectResponse(request, url("portal.banner.edit", params, "admin"));
            }

            int now = cast(int) time();
            banner.title = bannerForm.title;
            banner.subtitle = bannerForm.subtitle;
            banner.sort = bannerForm.sort;
            banner.status = bannerForm.statusRadio;
            banner.url = bannerForm.url;
            banner.keyword = bannerForm.keyword;
            banner.picurl = bannerForm.picurl;
            banner.pid = bannerForm.pid;
            banner.group = bannerForm.group;
            banner.updated = now;

            bannerRepository.save(banner);
            assignSussess("数据保存成功! ");
            return new RedirectResponse(request, url("admin:portal.banner.list"));

        }

        id = initNum("id", 0, "GET");
        if (id > 0) {
            banner = bannerRepository.find(id);
            if (banner is null) {
                errorNum += 1;
                assignError("数据出错或不存在, 请稍后重试! ");
            }
        } else {
            errorNum += 1;
            assignError("缺少参数id, 请稍后重试! ");
        }
        if (errorNum > 0) {
            return new RedirectResponse(request, url("admin:portal.banner.list"));
        }

        view.assign("banner", banner);
        makePageBreadCrumbs("bannerEdit");
        return ResponseView("portal/banner/edit");
    }

    @Action 
    Response del(int id){
        (new BannerRepository()).removeById(id);
        assignSussess("Banner删除成功! ");
        return new RedirectResponse(request, url("admin:portal.banner.list"));
    }
}