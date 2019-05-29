module app.component.shop.controller.admin.TypeFilterController;

import hunt.framework;
import hunt.entity;
import app.component.shop.model.ShopProperty;
import app.component.shop.model.ShopProductType;
import app.component.shop.model.ShopPropertyOption;

import app.component.shop.repository.TypePropertyFilterRepository;
import app.component.shop.repository.ShopPropertyRepository;
import app.component.shop.repository.PropertyOptionRepository;
import app.component.shop.repository.ShopProductTypeRepository;

import app.component.shop.controller.admin.PropertyOptionController;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;
import std.algorithm;
import std.json;

class TypeFilterController : AdminBaseController
{
    mixin MakeController;

    void add_option_title(ref JSONValue alldata)
    {
        /// add option title 
        int[] optionIds;
        foreach( o ; alldata["data"].array)
        {
            auto ar = o["property_options"].str.split(',');
            foreach(id ; ar)
            {
                optionIds ~= to!int(id);
            }
        }

        auto repo_property = new PropertyOptionRepository(_cManager);
        auto properties = repo_property.findAllByIds(optionIds);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
            auto ar = alldata["data"][i]["property_options"].str.split(',');
            string[] titles;
            foreach(id ; ar)
            {
                import std.algorithm.searching;
                auto list = find!("a.id == b")(properties , to!int(id));
                if( list !is null)
                    titles ~= list[0].title;
            }
            alldata["data"][i]["property_options_desc"] = titles.join(" ");
        }
    }

    @Action string list()
    {    
        uint page = request.get!uint("page" , 1);
        if(page < 1)
            page = 1;

        auto repository = new TypePropertyFilterRepository(_cManager);
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopProductTypePropertyFilter(pageData);
        logInfo(alldata);
        // PropertyOptionController.add_title!(ShopProductTypeRepository , "type_id" , "type_title")(alldata);
        // ========================================================
        int[] propertyIds;
        foreach( o ; alldata["data"].array)
        {
            int tmp = cast(int) o["type_id"].integer;
            if(!canFind(propertyIds, tmp))
                propertyIds ~= tmp;
        }
        auto properties = (new ShopProductTypeRepository(_cManager)).findAllByIds(propertyIds);
        logWarning(properties);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
            auto list = find!("a.id == b")(properties , alldata["data"][i]["type_id"].integer);
            if(list is null)
                alldata["data"][i]["type_title"] = "not found";
            else
                alldata["data"][i]["type_title"] = list[0].title;
        }
        // ========================================================

        add_option_title(alldata);
        view.assign("types", alldata);
        Paginate temPage = new Paginate("/admincp/shop/typefilters?page={page}" ,
            page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());
        string lang = findLocal();
        return view.setLocale(lang).render("shop/typefilter/list");
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto repo = new TypePropertyFilterRepository(_cManager);
            int id = request.post("id").to!int;
            auto property = repo.findById(id);
            bool isNew = property is null;
            if( isNew )
            {
                property = new ShopProductTypePropertyFilter();
                property.created = now;
            }
            property.title = request.post("title");
            property.type_id = request.post("type_id").to!int;
            property.property_options = request.post("property_options") ;
            property.sort = request.post("sort").to!int;
            logInfo(property.property_options);
            property.updated = now;
            if(isNew)
                repo.insert(property);
            else
                repo.update(property);

            return new RedirectResponse(request, "/admincp/shop/typefilters");
        }
        auto repo_type = new ShopProductTypeRepository(_cManager);
        auto types = repo_type.findAll();
        view.assign("types", types);

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("shop/typefilter/add"));
    }


    @Action string edit(int id)
    {
        auto repository = new TypePropertyFilterRepository(_cManager);
        view.assign("type", repository.findById(id));
        auto repo_type = new ShopProductTypeRepository(_cManager);
        auto types = repo_type.findAll();
        view.assign("types", types);
        string lang = findLocal();
        return view.setLocale(lang).render("shop/typefilter/edit");
    }

    @Action Response del(int id)
    {
        (new TypePropertyFilterRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/shop/typefilters");
    } 
}