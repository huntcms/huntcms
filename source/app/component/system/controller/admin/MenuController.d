module app.component.system.controller.admin.MenuController;

import hunt.framework;
import hunt.framework.i18n.I18n;
import hunt.framework.application.ApplicationConfig;
import app.component.system.model.Menu;
import app.component.system.repository.MenuRepository;
import app.component.system.model.LangPackage;
import app.component.system.repository.LangPackageRepository;
import app.component.system.helper.Utils;

import app.lib.controller.AdminBaseController;
import app.lib.functions;
import hunt.logging;
import hunt.util.Serialize;
import hunt.util.DateTime;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import hunt.entity.domain;
import std.uni;
import app.lib.functions;
class MenuController : AdminBaseController
{
    mixin MakeController;
    private ConfigBuilder _configFront;
    this()
    {
        super();      
        _configFront = configManager().config("hunt");
        // logError(_configFront.hunt.application.defaultLanguage.value);
    }


    @Action Response list(int perPage, int page = 1)
    {
        perPage = perPage < 1 ? 10 : perPage;
        auto alldata = (new MenuRepository(_cManager)).findByMenu(page-1, perPage);

        view.assign("menus", alldata.getContent());
        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("system/menu/list"));
    }


    @Action Response add()
    {
        string lang = findLocal();
        if (request.methodAsString() == HttpMethod.POST.asString()) {
            int now = cast(int) time();
            auto mr = new MenuRepository(_cManager);
            Menu mn = new Menu;
            mn.pid = request.post("pid", "0") is null ? 0 : request.post("pid", "0").to!int;
            mn.name = request.post("name");
            mn.mca = request.post("mca");
            // mn.keyword = "__SYSTEM_MENU_" ~ toUpper(mn.mca).replace(".", "_");
            mn.linkUrl = request.post("linkUrl");
            mn.iconClass = request.post("iconClass", "");
            mn.sort = request.post("sort", "0") is null ? 0 : request.post("sort", "0").to!int;
            mn.isAction = request.post("actionRadio").to!short;
            mn.status = request.post("statusRadio").to!short;
            auto id = request.post("id");
            if(id.length != 0) {
                mn.id = id.to!int;
                auto exsit_data = mr.findById(id.to!int);
                if(exsit_data !is null){
                    mn.created = exsit_data.created;
                    mn.keyword = exsit_data.keyword;
                }
            } else {
                mn.created = now;
            }
            mn.updated = now;

            auto saveRes = mr.save(mn);
            if (saveRes !is null){
                auto keyWord = "__SYSTEM_MENU_" ~ (saveRes.id).to!string;
                if(saveRes.keyword != keyWord){
                    saveRes.keyword = keyWord;
                    mr.save(saveRes);
                }
                
                auto repository = new LangPackageRepository(_cManager);
                auto lp = repository.findByKeyword(lang, keyWord);
                if(lp !is null){
                    if(lp.value != mn.name){
                        lp.value = mn.name;
                        lp.updated = now;
                        repository.save(lp);
                        I18n i18n = I18n.instance();
                        i18n.add(lp.local, keyWord, lp.value);
                    }
                }else{
                    LangPackage lpn = new LangPackage();
                    lpn.local = lang;
                    lpn.value = mn.name;
                    lpn.key = keyWord;
                    lpn.created = now;
                    lpn.updated = now;
                    repository.save(lpn);
                    I18n i18n = I18n.instance();
                    i18n.add(lpn.local, lpn.key, lpn.value);
                }

                return new RedirectResponse(request, "/admincp/system/menus");
            }

        }
        auto repository = new MenuRepository(_cManager);
        view.assign("firstLevelMenus", repository.getMenusByPid(0));

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("system/menu/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new MenuRepository(_cManager);
        view.assign("menu", repository.find(id));
        view.assign("firstLevelMenus", repository.getMenusByPid(0));
        string lang = findLocal();
        return view.setLocale(lang).render("system/menu/edit");
    }

    @Action Response del(int id)
    {
        (new MenuRepository(_cManager)).removeById(id);
        // return new RedirectResponse(request, "/admincp/system/menus");
        return new RedirectResponse(request, url("system.menu.list", null, "admin"));
    }
}
