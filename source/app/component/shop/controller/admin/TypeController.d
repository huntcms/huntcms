module app.component.shop.controller.admin.TypeController;


import hunt.framework;
import hunt.entity;
import app.component.shop.repository.ShopProductTypeRepository;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Paginate;
import app.component.system.helper.Utils;

class TypeController : AdminBaseController
{
    mixin MakeController;

 
    @Action string list()
    {    
        uint page = request.get!uint("page" , 1);
        if(page < 1)
            page = 1;

        auto repository = new ShopProductTypeRepository();
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
        if (request.method() == HttpMethod.Post)
        {
            int now = time();
            auto repo = new ShopProductTypeRepository();
            int id = request.post!int("id");
            auto type = repo.findById(id);
            bool isNew = type is null;
            if( isNew )
            {
                type = new ShopProductType();
                type.created = now;
            }
            type.title = request.post("title");
            type.status = request.post!int("status");
            type.updated = now;
            if(isNew)
                repo.insert(type);
            else
                repo.update(type);

            return new RedirectResponse("/admincp/shop/types");
        }
        return request.createResponse().setContent(view.render("shop/type/add"));
    }


    @Action string edit(int id)
    {
        auto repository = new ShopProductTypeRepository();
        view.assign("type", repository.findById(id));

        return view.render("shop/type/edit");
    }

    @Action Response del(int id)
    {
        (new ShopProductTypeRepository()).removeById(id);
        return new RedirectResponse("/admincp/shop/types");
    } 

}
