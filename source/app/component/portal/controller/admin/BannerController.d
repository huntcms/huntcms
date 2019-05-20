module app.component.portal.controller.admin.BannerController;

import hunt.framework;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import std.digest.sha;
import std.file;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import app.component.system.helper.Utils;

class BannerController : AdminBaseController
{
    mixin MakeController;
    
    this(){
        super();  
    }

    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new BannerRepository(_cManager);
        auto alldata = pageToJson!Banner(repository.findAll(new Pageable(page , 20)));
        logDebug("banners : ", alldata);
        view.assign("banners", alldata);
        string lang = findLocal();
        return view.setLocale(lang).render("portal/banner/list");
    }
    
    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto br = new BannerRepository(_cManager);
            Banner banner = new Banner;
            banner.title = request.post("title");
            banner.subtitle = request.post("subtitle");
            // banner.sort = request.post("sort").to!int;
            banner.sort = initInt("sort", 0, "POST");
            banner.url = request.post("url");
            banner.keyword = request.post("keyword");
            // banner.picurl = request.post("imageFile");
            banner.picurl = request.post("picurl");
            auto id = request.post("id");
            if(id.length != 0)
            {
                banner.id = id.to!int;
                auto exsit_data = br.findById(id.to!int);
                if(exsit_data !is null)
                    banner.created = exsit_data.created;
            }
            else
                banner.created = now;
            banner.updated = now;

            auto saveRes = br.save(banner);
            // 更新缓存信息
            _tmpCache.getBanner("index", true);
            if (saveRes !is null)
                return new RedirectResponse(request, "/admincp/portal/banners");
        }
        
        auto repository = new BannerRepository(_cManager);
        view.assign("groups", repository.getBannersByPid(1));
        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("portal/banner/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new BannerRepository(_cManager);
        view.assign("banner", repository.find(id));
        string lang = findLocal();
        return view.setLocale(lang).render("portal/banner/edit");
    }

    @Action Response del(int id){
        (new BannerRepository(_cManager)).removeById(id);
        _tmpCache.getBanner("index", true);
        return new RedirectResponse(request, url("portal.banner.list", null, "admin"));
    }
}