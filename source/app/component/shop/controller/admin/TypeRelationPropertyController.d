module app.component.shop.controller.admin.TypeRelationPropertyController;


import hunt.framework;
import hunt.entity;
import app.component.shop.model.ShopProductType;
import app.component.shop.model.ShopProperty;
import app.component.shop.model.ShopProductTypeRelationProperty;
import app.component.shop.repository.ShopProductTypeRepository;
import app.component.shop.repository.TypeRelationPropertyRepository;
import app.component.shop.repository.ShopPropertyRepository;
import app.component.shop.repository.PropertyOptionRepository;

import app.lib.controller.AdminBaseController;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;
import app.component.shop.controller.admin.PropertyOptionController;
import hunt.http.codec.http.model.HttpMethod;


class TypeRelationPropertyController : AdminBaseController
{
    mixin MakeController;

 
    @Action string list()
    {    
        uint page = request.get!uint("page" , 1);
        if(page < 1)
            page = 1;

        auto repository = new TypeRelationPropertyRepository();
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopProductTypeRelationProperty(pageData);
        view.assign("types", alldata);

        PropertyOptionController.add_title!(ShopProductTypeRepository , "type_id" , "type_title")(alldata);
        PropertyOptionController.add_title!(ShopPropertyRepository , "property_id" , "property_title")(alldata);
        

        Paginate temPage = new Paginate("/admincp/shop/typeproperties?page={page}" ,
         page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());

         return view.render("shop/type_property/list");
    }

    @Action string listByType(int type_id)
    {
        auto type_repo = new  TypeRelationPropertyRepository();
        auto typeRaltionproperties = type_repo.findAllByType(type_id);
        int[] property_ids;
        foreach( t ; typeRaltionproperties)
        {
            property_ids ~= t.property_id;
        }

        auto option_repo = new PropertyOptionRepository();
        auto options = option_repo.findAllByPropertyIds(property_ids);
        return toJson(options).toString;
    }

    @Action string add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto repo = new TypeRelationPropertyRepository();
            int id = request.post("id").to!int;
            auto type = repo.findById(id);
            bool isNew = type is null;
            if( isNew )
            {
                type = new ShopProductTypeRelationProperty();
                type.created = now;
            }
            type.type_id = request.post("type_id").to!int;
            type.property_id = request.post("property_id").to!int;
            type.sort = request.post("sort").to!int;
            type.updated = now;
            if(isNew)
                repo.insert(type);
            else
                repo.update(type);

            return "ok";
        }
        auto repo_property = new ShopPropertyRepository();
        auto properties = repo_property.findAll();
        view.assign("properties", properties);
        auto repo_type = new ShopProductTypeRepository();
        auto types = repo_type.findAll();
        view.assign("types", types);
        return view.render("shop/type_property/add");
    }


    @Action string edit(int id)
    {
        auto repository = new TypeRelationPropertyRepository();
        view.assign("type", repository.findById(id));
        auto repo_property = new ShopPropertyRepository();
        auto properties = repo_property.findAll();
        view.assign("properties", properties);
        auto repo_type = new ShopProductTypeRepository();
        auto types = repo_type.findAll();
        view.assign("types", types);
        return view.render("shop/type_property/edit");
    }

    @Action Response del(int id)
    {
        (new TypeRelationPropertyRepository()).removeById(id);
        return new RedirectResponse(request, "/admincp/shop/typeproperties");
    } 

}
