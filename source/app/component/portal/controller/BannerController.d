module app.component.portal.controller.admin.BannerController;

import hunt.framework;
import app.component.portal.repository.BannerRepository;
import app.component.portal.model.Banner;
import app.lib.controller.AdminBaseController;
import app.component.portal.helper.Utils;



class BannerController : AdminBaseController
{
    mixin MakeController;
    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new BannerRepository();
        auto alldata = pageToJson!Banner(repository.findAll(new Pageable(page , 20)));
        logDebug("banners : ", alldata);
        view.assign("banners", alldata);

        return view.render("portal/banner/list");
    }
    
    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto br = new BannerRepository;
            Banner banner = new Banner;
            banner.title = request.post("title");
            banner.subtitle = request.post("subtitle");
            banner.sort = request.post("sort").to!int;
            banner.url = request.post("url");
            banner.picurl = request.post("picurl");
            banner.pid    = request.post("pid").to!int;
            banner.group  = br.findById(banner.pid.to!int).title;
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
            if (saveRes !is null)
                return new RedirectResponse("/admincp/portal/banners");
        }
        auto repository = new BannerRepository;
        view.assign("groups", repository.getBannersByPid(0));

        return request.createResponse().setContent(view.render("portal/banner/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new BannerRepository;
        view.assign("banner", repository.find(id));
        view.assign("groups", repository.getBannersByPid(0));

        return view.render("portal/banner/edit");
    }

    
    @Action Response del(int id)
    {
        (new BannerRepository).removeById(id);
        return new RedirectResponse("/admincp/portal/banners");
    }
}