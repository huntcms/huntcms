module app.component.shop.controller.admin.TypeController;


import hunt.framework;
import hunt.entity;
import app.component.shop.repository.ShopProductTypeRepository;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;

class TypeController : AdminBaseController
{
    mixin MakeController;

 
    @Action string list()
    {    
        uint page = request.get!uint("page" , 1);
        if(page < 1)
            page = 1;

        auto repository = new ShopProductTypeRepository(_cManager);
        int limit = 20 ;  // 每页显示多少条
        auto pageData = repository.findAll(new Pageable(page - 1 , limit));
        JSONValue alldata = pageToJson!ShopProductType(pageData);
        view.assign("types", alldata);
        Paginate temPage = new Paginate("/admincp/shop/types?page={page}" ,
         page , pageData.getTotalPages());
        view.assign("pageView", temPage.showPages());

         return view.render("shop/type/list");
    }


    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto repo = new ShopProductTypeRepository(_cManager);
            int id = request.post("id").to!int;
            auto type = repo.findById(id);
            bool isNew = type is null;
            if( isNew )
            {
                type = new ShopProductType();
                type.created = now;
            }
            type.title = request.post("title");
            type.status = request.post("status").to!int;
            type.updated = now;
            if(isNew)
                repo.insert(type);
            else
                repo.update(type);

            return new RedirectResponse(request, "/admincp/shop/types");
        }

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("shop/type/add"));
		return response;
    }


    @Action string edit(int id)
    {
        auto repository = new ShopProductTypeRepository(_cManager);
        view.assign("type", repository.findById(id));

        return view.render("shop/type/edit");
    }

    @Action Response del(int id)
    {
        (new ShopProductTypeRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/shop/types");
    } 

}
