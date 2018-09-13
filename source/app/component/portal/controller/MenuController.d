module app.component.portal.controller.admin.MenuController;

import hunt.framework;
import app.component.portal.model.Menu;
import app.component.portal.repository.MenuRepository;
import app.lib.controller.AdminBaseController;
import kiss.logger;
import kiss.util.serialize;
import kiss.datetime;
//import app.component.portal.helper.Utils;
import app.component.system.helper.Utils;
import app.component.system.model.FileInfo;
import app.component.system.repository.FileInfoRepository;
import app.component.system.repository.UserRepository;
import std.json;
import std.digest.sha;
import std.file;
import kiss.util.configuration;
import hunt.entity.domain;
import hunt.entity.DefaultEntityManagerFactory;
import app.auth.UserAuth;
import app.lib.yun.YunUpLoad;


class MenuController : AdminBaseController
{
    mixin MakeController;
  
    this()
    {
        super();      
    }

    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new MenuRepository();
        auto alldata = pageToJson!Menu(repository.findAll(new Pageable(page , 20, repository.Field.sort , OrderBy.ASC)));
        //logDebug("menus : ", alldata);
        view.assign("menus", alldata);

        return view.render("portal/menu/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto mr = new MenuRepository;
            Menu mn = new Menu;
            mn.pid = request.post("pid" , 0);
            mn.name = request.post("name");
            if(mn.name is null){
                view.assign("errorMessages", ["name required!"]);
                return request.createResponse().setContent(view.render("portal/menu/add"));
            }
            //mn.mca = request.post("mca");
            mn.linkUrl = request.post("linkUrl");
            mn.iconClass = request.post("iconClass" , "");
            mn.sort = request.post("sort" , 0);
            //mn.isAction = request.post("actionRadio").to!short;
            mn.status = request.post("statusRadio").to!short;

            auto f = request.postForm.getFileValue("imageFile");

            if (f)
            {
                ubyte[] file_data;
                auto filesize = f.fileSize;
                f.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                //logDebug("file content :  ",cast(string)file_data);
                FileInfo fi = new FileInfo;
                fi.filename = f.fileName;
                fi.size = f.fileSize();
                fi.type = f.contentType;
                fi.sha1 = toHexString(sha1Of(file_data));
                fi.created = now;
                fi.updated = now;

                auto manager = defaultEntityManagerFactory().createEntityManager();

                auto userRepository = new UserRepository(manager);

                auto user = UserAuth.get(request);

                logDebug("id : ", user.id, "  email : ", user.name);
                fi.user = userRepository.findByEmail(user.name);

                auto fir = new FileInfoRepository();
                fir.save(fi);

                //ConfigBuilder con = Config.config("hunt");
                auto saveName = fi.sha1 ~ "." ~ Utils.fileExt(fi.filename);
                        auto upload = new YunUpLoad("1004",
                "http://upload.putaocloud.com",
                "0d87e77f509a419285db58f985836901", 
                "2fa77ec72e6a4c338515bfef98b97c42");

                auto json = parseJSON( upload.doUpload(cast(byte[])file_data , saveName));
                //std.file.write(con.file.path.value ~ saveName, file_data);
                logInfo(json);
                mn.picture = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 
            }else
                mn.picture = request.post("currentpic");
            auto id = request.post("id");
            if(id.length != 0)
            {
                mn.id = id.to!int;
                auto exsit_data = mr.findById(id.to!int);
                if(exsit_data !is null)
                    mn.created = exsit_data.created;
            }
            else
                mn.created = now;
            mn.updated = now;

            auto saveRes = mr.save(mn);
            if (saveRes !is null)
                return new RedirectResponse("/admincp/portal/menus");
        }
        auto repository = new MenuRepository;
        view.assign("firstLevelMenus", repository.getMenusByPid(1));
        //view.assign("routes", routes());

        return request.createResponse().setContent(view.render("portal/menu/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new MenuRepository;
        view.assign("menu", repository.find(id));
        view.assign("firstLevelMenus", repository.getMenusByPid(1));
        //view.assign("routes", routes());

        return view.render("portal/menu/edit");
    }

    
    @Action Response del(int id)
    {
        (new MenuRepository).removeById(id);
        return new RedirectResponse("/admincp/portal/menus");
    }

    @Action string[] routes()
    {
        string[] routearr;
        auto routes = slurp!(string, string, string)(getcwd()~"/config/admin.routes.list", "%s %s %s");
        routearr.length = routes.length;
        foreach(key, route; routes)
        {
            if(route[0]=="GET")
            routearr[key] = route[1];
        }

        return routearr;
    }

}