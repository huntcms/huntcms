module app.component.shop.controller.admin.ProductCategoryController;

import hunt.framework;
import hunt.framework.Simplify;
import hunt.framework.http.RedirectResponse;
import std.uri;
import hunt.logging;
import hunt.util.DateTime;
import app.lib.controller.AdminBaseController;
import app.component.shop.repository.ProductCategoryRepository;
import app.component.shop.model.ProductCategory;
import app.component.shop.repository.ProductTypeRepository;
import app.lib.other.Paginate;

class ProductCategoryController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();
    }

    @Action string list()
    {

        auto conditions = request.all();
        int limit = 20 ;  // 每页显示多少条
        foreach (key, condition; conditions){
            conditions[key] = decodeComponent(condition);
        }
        auto pcRep = new ProductCategoryRepository(_cManager);
        auto list = pcRep.adminList(conditions, limit);
        view.assign("data", list["data"]);
        if("title" !in conditions){
            conditions["title"] = "";
        }
        view.assign("get", conditions);

        uint page = request.get!uint("page" , 1);
        string linkUrl = request.url();
        if (indexOf(linkUrl, "page="~page.to!string) != -1){
            linkUrl = linkUrl.replace("page="~page.to!string, "page={page}");
        }else {
            if (indexOf(request.url(), "?") != -1){
                linkUrl ~= "&page={page}";
            }else {
                linkUrl ~= "?page={page}";
            }
        }
        Paginate pageView = new Paginate(linkUrl , (cast(int) page <= 0 ? 1 : cast(int) page) , to!int(list["total_page"].integer), limit);
        view.assign("pageView", pageView.showPages());
        view.assign("categorys", pcRep.all());
        return view.render("shop/productCategory/list");
    }

    @Action string findTypes(int pid)
    {
        auto type_repo = new ProductTypeRepository(_cManager);
        if(pid == 0)
        {
            return toJSON(type_repo.findAll()).toString;
        }
        else
        {
            auto category_repo = new ProductCategoryRepository(_cManager);
            auto category = category_repo.findById(pid);
            return toJSON([type_repo.findById(category.type_id)]).toString;    
        }
    }

    @Action Response add()
    {
        auto productCategoryRepository = new ProductCategoryRepository(_cManager);
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            logInfo("add1 ");
            auto productCategoryModel = new ProductCategory();
            int time = cast(int) time();
            productCategoryModel.title = request.post("title");
            productCategoryModel.sort = request.post("sort").to!int;
            productCategoryModel.pid = request.post("pid").to!int;
            productCategoryModel.type_id = request.post("type_id").to!int;
            auto parentData = productCategoryRepository.find(productCategoryModel.pid);
            if(parentData){
                productCategoryModel.level = ++parentData.level;
                productCategoryModel.status = request.post("status").to!short;
                productCategoryModel.updated = time;
                productCategoryModel.created  = time;
                auto save = productCategoryRepository.save(productCategoryModel);
                if (save !is null)
                {
                    return new RedirectResponse(request, url("admin:shop.productcategory.list"));
                }else {
                    view.assign("errorMessages", ["操作失败"]);
                }
            }
            else    ///没有父类
            {
                productCategoryModel.level = 1;
                productCategoryModel.status = request.post("status").to!short;
                productCategoryModel.updated = time;
                productCategoryModel.created  = time;
                productCategoryRepository.insert(productCategoryModel);
                return new RedirectResponse(request, url("admin:shop.productcategory.list"));
            }

        }
        view.assign("categorys", productCategoryRepository.all());

        Response response = new Response(request);
        response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
        response.setContent(view.render("shop/productCategory/add"));
        return response;
    }

    @Action Response edit(int id)
    {
        auto productCategoryRepository = new ProductCategoryRepository(_cManager);
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            auto productCategoryModel = productCategoryRepository.find(id);
            int time = cast(int) time();
            productCategoryModel.id = id;
            productCategoryModel.title = request.post("title");
            productCategoryModel.sort = request.post("sort").to!int;
            productCategoryModel.status = request.post("status").to!short;
            productCategoryModel.updated = time;
            auto save = productCategoryRepository.save(productCategoryModel);
            if (save !is null)
            {
                return new RedirectResponse(request, url("admin:shop.productcategory.list"));
            }else {
                view.assign("errorMessages", ["操作失败"]);
            }
        }
        auto type_repo = new ProductTypeRepository(_cManager);
        auto data = productCategoryRepository.find(id);

        view.assign("type" ,type_repo.findById(data.type_id));
        view.assign("data",  data);
        view.assign("categorys", productCategoryRepository.all());

        Response response = new Response(request);
        response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
        response.setContent(view.render("shop/productCategory/edit"));
        return response;
    }

    @Action Response del(int id)
    {
        auto productCategoryRepository = new ProductCategoryRepository(_cManager);
        if(productCategoryRepository.childrens(id))
        {
            return new RedirectResponse(request, url("admin:shop.productcategory.list"));
        }
        auto productCategoryModel = productCategoryRepository.find(id);
        productCategoryRepository.remove(productCategoryModel);
        return new RedirectResponse(request, url("admin:shop.productcategory.list"));
    }

}
