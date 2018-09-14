module app.component.shop.controller.admin.PropertyOptionController;


import hunt.framework;
import hunt.entity;
import app.component.shop.model.ShopProperty;
import app.component.shop.model.ShopPropertyOption;
import app.component.shop.repository.PropertyOptionRepository;
import app.component.shop.repository.ShopPropertyRepository;
import app.component.shop.repository.ShopProductTypeRepository;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;

class PropertyOptionController : AdminBaseController
{
    mixin MakeController;

    static void add_title(T ,alias ID,alias TITLE)(ref JSONValue alldata)
    {
         /// add property title in data.
        int[] propertyIds;
        foreach( o ; alldata["data"].array)
        {
            propertyIds ~= cast(int) o[ID].integer;
        }
        auto repo_property = new T();
        auto properties = repo_property.findAllByIds(propertyIds);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
            import std.algorithm.searching;
            auto list = find!("a.id == b")(properties , alldata["data"][i][ID].integer);
            if(list is null)
                alldata["data"][i][TITLE] = "not found";
            else
                alldata["data"][i][TITLE] = list[0].title;
        }
    }
    
  

    @Action string list()
    {    
        uint page = request.get!uint("page" , 1);
        if(page < 1)
            page = 1;

        auto repository = new PropertyOptionRepository();
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopPropertyOption(pageData);
        
        add_title!(ShopPropertyRepository , "property_id" , "property_title")(alldata);
       
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
            auto repo = new PropertyOptionRepository();
            int id = request.post!int("id");
            auto property = repo.findById(id);
            bool isNew = property is null;
            if( isNew )
            {
                property = new ShopPropertyOption();
                property.created = now;
            }
            property.title = request.post("title");
            property.property_id = request.post!int("property_id");
            property.status = request.post!int("status");
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