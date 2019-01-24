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
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;

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

        auto repo_property = new PropertyOptionRepository();
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

        auto repository = new TypePropertyFilterRepository();
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopProductTypePropertyFilter(pageData);
        
        PropertyOptionController.add_title!(ShopProductTypeRepository , "type_id" , "type_title")(alldata);
        add_option_title(alldata);
        view.assign("types", alldata);
        Paginate temPage = new Paginate("/admincp/shop/typefilters?page={page}" ,
         page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());

         return view.render("shop/typefilter/list");
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto repo = new TypePropertyFilterRepository();
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
        auto repo_type = new ShopProductTypeRepository();
        auto types = repo_type.findAll();
        view.assign("types", types);

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("shop/typefilter/add"));
		return response;
    }


    @Action string edit(int id)
    {
        auto repository = new TypePropertyFilterRepository();
        view.assign("type", repository.findById(id));
        auto repo_type = new ShopProductTypeRepository();
        auto types = repo_type.findAll();
        view.assign("types", types);
        return view.render("shop/typefilter/edit");
    }

    @Action Response del(int id)
    {
        (new TypePropertyFilterRepository()).removeById(id);
        return new RedirectResponse(request, "/admincp/shop/typefilters");
    } 
}