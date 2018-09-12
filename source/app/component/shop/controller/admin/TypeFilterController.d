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

class TypeFilterController : AdminBaseController
{
    mixin MakeController;

    void add_option_title(ref JSONValue alldata)
    {
        /// add option title 
        int[] optionIds;
        foreach( o ; alldata["data"].array)
        {
            auto ar = parseJSON(o["property_options"].str);
            foreach(id ; ar.array)
            {
                optionIds ~= cast(int)id.integer;
            }
        }

        auto repo_property = new PropertyOptionRepository();
        auto properties = repo_property.findAllByIds(optionIds);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
            auto ar = parseJSON(alldata["data"][i]["property_options"].str);
            string[] titles;
            foreach(id ; ar.array)
            {
                import std.algorithm.searching;
                auto list = find!("a.id == b")(properties , id.integer);
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
        Paginate temPage = new Paginate("/admincp/shop/propertyoption?page={page}" ,
         page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());

         return view.render("shop/propertyoption/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = time();
            auto repo = new TypePropertyFilterRepository();
            int id = request.post!int("id");
            auto property = repo.findById(id);
            bool isNew = property is null;
            if( isNew )
            {
                property = new ShopProductTypePropertyFilter();
                property.created = now;
            }
            property.title = request.post("title");
            property.type_id = request.post!int("type_id");
            property.property_options = request.post("property_options");
            property.sort = request.post!int("sort");
            property.updated = now;
            if(isNew)
                repo.insert(property);
            else
                repo.update(property);

            return new RedirectResponse("/admincp/shop/propertyoptions");
        }
        auto repo_property = new ShopPropertyRepository();
        auto properties = repo_property.findAll();
        view.assign("properties", properties);
        return request.createResponse().setContent(view.render("shop/propertyoption/add"));
    }


    @Action string edit(int id)
    {
        auto repository = new PropertyOptionRepository();
        view.assign("type", repository.findById(id));
        auto repo_property = new ShopPropertyRepository();
        auto properties = repo_property.findAll();
        view.assign("properties", properties);
        return view.render("shop/propertyoption/edit");
    }

    @Action Response del(int id)
    {
        (new PropertyOptionRepository()).removeById(id);
        return new RedirectResponse("/admincp/shop/propertyoptions");
    } 
}