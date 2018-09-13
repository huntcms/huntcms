module app.component.shop.controller.admin.ProductController;

import hunt.framework;
import hunt.framework.simplify;
import hunt.framework.http.RedirectResponse;
import std.uri;
import kiss.logger;
import kiss.datetime.format;
import app.lib.controller.AdminBaseController;
import app.component.shop.repository.ProductRepository;
import app.component.shop.repository.ProductCategoryRepository;
import app.component.shop.model.Product;
import app.lib.other.Paginate;

class ProductController : AdminBaseController
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
        foreach (key, condition; conditions)
        {
            conditions[key] = decodeComponent(condition);
        }
        auto productRepository = new ProductRepository();
        auto list = productRepository.adminList(conditions, limit);
        view.assign("data", list["data"]);
        view.assign("get", conditions);

        uint page = request.get!uint("page" , 1);
        string linkUrl = request.fullUrl();
        if (indexOf(linkUrl, "page="~page.to!string) != -1){
            linkUrl = linkUrl.replace("page="~page.to!string, "page={page}");
        }else {
            if (indexOf(request.fullUrl(), "?") != -1){
                linkUrl ~= "&page={page}";
            }else {
                linkUrl ~= "?page={page}";
            }
        }
        Paginate pageView = new Paginate(linkUrl , (cast(int) page <= 0 ? 1 : cast(int) page) , to!int(list["total_page"].integer), limit);
        view.assign("pageView", pageView.showPages());
        return view.render("shop/product/list");
    }

    @Action Response add()
    {
        auto pcRepository = new ProductCategoryRepository();
        if (request.method == "POST")
        {
            auto productModel = new Product();
            auto productRepository = new ProductRepository();
            int time = time();
            //auto pcPicurl = request.postForm.getFileValue("pc_picurl");
            //auto appPicurl = request.postForm.getFileValue("app_picurl");
            //auto wapPicurl = request.postForm.getFileValue("wap_picurl");
            //auto picurls = request.postForm.getFileValue("picurls");
            productModel.category_id = request.post("category_id").to!int;
            productModel.title = decodeComponent(request.post("title"));
            productModel.code = request.post("code");
            productModel.introduction = decodeComponent(request.post("introduction"));
            productModel.min_price = cast(int) (request.post("min_price").to!float * 100);
            productModel.max_price = cast(int) (request.post("max_price").to!float * 100);
            productModel.content = request.post("content");
            productModel.sort = request.post("sort").to!int;
            productModel.status = request.post("status").to!short;
            productModel.updated  = time;
            productModel.created  = time;

            auto save = productRepository.save(productModel);
            if (save !is null)
            {
                return new RedirectResponse(createUrl("shop.product.list"));
            }else {
                view.assign("errorMessages", ["操作失败"]);
            }
        }
        view.assign("categorys", pcRepository.all());
        return request.createResponse().setContent(view.render("shop/product/add"));
    }

    @Action Response edit(int id)
    {
        auto productRepository = new ProductRepository();
        if (request.method == "POST")
        {
            auto productModel = productRepository.find(id);
            productModel.title = request.post("title");
            productModel.code = request.post("code");
            productModel.introduction = request.post("introduction");
            productModel.min_price = cast(int) (request.post("min_price").to!float * 100);
            productModel.max_price = cast(int) (request.post("max_price").to!float * 100);
            productModel.content = request.post("content");
            productModel.sort = request.post("sort").to!int;
            productModel.status = request.post("status").to!short;
            productModel.updated = time();
            auto save = productRepository.save(productModel);
            if (save !is null)
            {
                return new RedirectResponse(createUrl("shop.product.list"));
            }else {
                view.assign("errorMessages", ["操作失败"]);
            }
        }
        view.assign("categorys",  (new ProductCategoryRepository()).all());
        view.assign("data",  productRepository.find(id));
        return request.createResponse().setContent(view.render("shop/product/edit"));
    }

    @Action Response del(int id)
    {
        auto productRepository = new ProductRepository();
        auto productModel = productRepository.find(id);
        productRepository.remove(productModel);
        return new RedirectResponse(createUrl("shop.product.list"));
    }
}
