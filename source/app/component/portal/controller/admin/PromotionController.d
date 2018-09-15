module app.component.portal.controller.admin.PromotionController;

import hunt.framework;
import app.component.portal.model.Promotion;
import app.component.portal.repository.PromotionRepository;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Utils;
import app.lib.yun.YunUpLoad;
import app.component.system.helper.Utils;
import std.digest.sha;

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
        auto repository = new PromotionRepository();
        auto alldata = pageToJson!Promotion(repository.findAll(new Pageable(page , 20)));
        //logDebug("menus : ", alldata);
        view.assign("promotions", alldata);

        return view.render("portal/promotion/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto pr = new PromotionRepository;
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
                auto f1 = request.postForm.getFileValue("module"~i.to!string~"picurlback");
                auto f2 = request.postForm.getFileValue("module"~i.to!string~"picurlfront");
                //alias tmp = string[string];
                JSONValue f;

                if (f1)
                {
                    ubyte[] file_data;
                    auto filesize = f1.fileSize;
                    f1.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(f1.fileName);
                    auto upload = new YunUpLoad("1004",
                    "http://upload.putaocloud.com",
                    "0d87e77f509a419285db58f985836901", 
                    "2fa77ec72e6a4c338515bfef98b97c42");

                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    logInfo(json);
                    f["picurl_back"] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 

                }

                if (f2)
                {
                    ubyte[] file_data;
                    auto filesize = f2.fileSize;
                    f2.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(f2.fileName);
                    auto upload = new YunUpLoad("1004",
                    "http://upload.putaocloud.com",
                    "0d87e77f509a419285db58f985836901", 
                    "2fa77ec72e6a4c338515bfef98b97c42");

                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    logInfo(json);
                    f["picurl_back"] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 
                }

                f["title"] = request.post("module"~i.to!string~"title");
                f["subtitle"] = request.post("module"~i.to!string~"subtitle");
                f["link_url"] = request.post("module"~i.to!string~"linkurl");
                f["sort"] = request.post("module"~i.to!string~"sort");
                f["isnew"] = request.post("module"~i.to!string~"isnew");
                submodule["submodule"~i.to!string] = f;
            }

            
            //else
              //  art.picture = request.post("currentpic");

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
                return new RedirectResponse("/admincp/portal/promotions");
        }

        return request.createResponse().setContent(view.render("portal/promotion/add"));
    }

    @Action Response edit(int id)
    {
        auto repository = new PromotionRepository;
        view.assign("promotion", repository.find(id));

        return request.createResponse().setContent(view.render("portal/promotion/edit"));
    }

    @Action Response del(int id)
    {
        (new PromotionRepository).removeById(id);
        return new RedirectResponse("/admincp/portal/promotions");
    }
}