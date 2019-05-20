module app.component.shop.controller.admin.PropertyOptionController;


import hunt.framework;
import hunt.entity;
import app.component.shop.model.ShopProperty;
import app.component.shop.model.ShopPropertyOption;
import app.component.shop.repository.PropertyOptionRepository;
import app.component.shop.repository.ShopPropertyRepository;
import app.component.shop.repository.ShopProductTypeRepository;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;
import std.algorithm;

class PropertyOptionController : AdminBaseController
{
    mixin MakeController;

    static void add_title(T ,alias ID,alias TITLE)(ref JSONValue alldata)
    {
        // add property title in data.
        int[] propertyIds;
        foreach( o ; alldata["data"].array)
        {
            int tmp = cast(int) o[ID].integer;
            if(!canFind(propertyIds, tmp))
                propertyIds ~= tmp;
        }
        logError(_cManager);
        auto repo_property = new T();
        logInfo(repo_property);
        auto properties = repo_property.findAllByIds(propertyIds);
        logWarning(properties);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
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

        auto repository = new PropertyOptionRepository(_cManager);
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopPropertyOption(pageData);
        // logError(alldata);

        // add_title!(ShopPropertyRepository, "property_id", "property_title")(alldata);
        // ========================================================
        int[] propertyIds;
        foreach( o ; alldata["data"].array)
        {
            int tmp = cast(int) o["property_id"].integer;
            if(!canFind(propertyIds, tmp))
                propertyIds ~= tmp;
        }
        auto properties = (new ShopPropertyRepository(_cManager)).findAllByIds(propertyIds);
        logWarning(properties);
        for( size_t i = 0 ; i < alldata["data"].array.length ; i++)
        {
            auto list = find!("a.id == b")(properties , alldata["data"][i]["property_id"].integer);
            if(list is null)
                alldata["data"][i]["property_title"] = "not found";
            else
                alldata["data"][i]["property_title"] = list[0].title;
        }
        // ========================================================
       
        view.assign("types", alldata);
        Paginate temPage = new Paginate("/admincp/shop/propertyoption?page={page}", page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());

        string lang = findLocal();
        return view.setLocale(lang).render("shop/propertyoption/list");
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto repo = new PropertyOptionRepository(_cManager);
            int id = request.post("id").to!int;
            auto property = repo.findById(id);
            bool isNew = property is null;
            if( isNew )
            {
                property = new ShopPropertyOption();
                property.created = now;
            }
            property.title = request.post("title");
            property.property_id = request.post("property_id").to!int;
            property.status = request.post("status").to!int;
            property.sort = request.post("sort").to!int;
            property.updated = now;
            if(isNew)
                repo.insert(property);
            else
                repo.update(property);

            return new RedirectResponse(request, "/admincp/shop/propertyoptions");
        }
        auto repo_property = new ShopPropertyRepository(_cManager);
        auto properties = repo_property.findAll();
        view.assign("properties", properties);

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("shop/propertyoption/add"));
    }


    @Action string edit(int id)
    {
        auto repository = new PropertyOptionRepository(_cManager);
        view.assign("type", repository.findById(id));
        auto repo_property = new ShopPropertyRepository(_cManager);
        auto properties = repo_property.findAll();
        view.assign("properties", properties);
        string lang = findLocal();
        return view.setLocale(lang).render("shop/propertyoption/edit");
    }

    @Action Response del(int id)
    {
        (new PropertyOptionRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/shop/propertyoptions");
    } 
}