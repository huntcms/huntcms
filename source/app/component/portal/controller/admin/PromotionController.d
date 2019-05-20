module app.component.portal.controller.admin.PromotionController;

import hunt.framework;
import app.component.portal.model.Promotion;
import app.component.portal.repository.PromotionRepository;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.component.system.helper.Utils;
import app.lib.yun.YunUpLoad;
import app.component.system.helper.Utils;
import std.digest.sha;
import hunt.http.codec.http.model.HttpMethod;

class PromotionController : AdminBaseController
{
    mixin MakeController;
  
    this()
    {
        super();      
    }

    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new PromotionRepository(_cManager);
        auto alldata = pageToJson!Promotion(repository.findAll(new Pageable(page , 20)));
        //logDebug("menus : ", alldata);
        view.assign("promotions", alldata);
        string lang = findLocal();
        return view.setLocale(lang).render("portal/promotion/list");
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto pr = new PromotionRepository(_cManager);
            Promotion promotion = new Promotion;
            promotion.title = request.post("title");
            promotion.subtitle = request.post("subtitle");
            promotion.link_url = request.post("link_url");
            promotion.type = request.post("type");
            promotion.keyword = request.post("keyword");
            promotion.sort = request.post("sort").to!int;
            promotion.status = request.post("status").to!int;

            int submodulenum = request.post("submodulenum").to!int;
            JSONValue submodule;
            for(int i=1;i<=submodulenum;i++)
            {
                JSONValue f;
                f["picurl_back"] = request.post("module"~i.to!string~"picurlback");
                f["picurl_front"] = request.post("module"~i.to!string~"picurlfront");
                f["title"] = request.post("module"~i.to!string~"title");
                f["subtitle"] = request.post("module"~i.to!string~"subtitle");
                f["link_url"] = request.post("module"~i.to!string~"linkurl");
                f["sort"] = request.post("module"~i.to!string~"sort");
                f["isnew"] = request.post("module"~i.to!string~"isnew");
                submodule["submodule"~i.to!string] = f;
            }

            promotion.modules = submodule.to!string;
            auto id = request.post("id");
            if(id.length != 0)
            {
                promotion.id = id.to!int;
                auto exsit_data = pr.findById(id.to!int);
                if(exsit_data !is null)
                    promotion.created = exsit_data.created;
            }
            else
                promotion.created = now;
                promotion.updated = now;

            auto saveRes = pr.save(promotion);
            if (saveRes !is null)
                return new RedirectResponse(request, "/admincp/portal/promotions");
        }

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("portal/promotion/add"));
    }

    @Action Response edit(int id)
    {
        auto repository = new PromotionRepository(_cManager);
        view.assign("promotion", repository.find(id));

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("portal/promotion/edit"));
    }

    @Action Response del(int id)
    {
        (new PromotionRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/portal/promotions");
    }
}