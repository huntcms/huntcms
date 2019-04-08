module app.component.shop.controller.admin.ProductController;

import hunt.framework;
import hunt.framework.Simplify;
import hunt.framework.http.RedirectResponse;
import std.uri;
import std.digest.sha;
import hunt.logging;
import hunt.util.DateTime;
import app.lib.controller.AdminBaseController;
import app.component.shop.repository.ProductRepository;
import app.component.shop.repository.ProductCategoryRepository;
import app.component.shop.model.Product;
import app.component.shop.model.TagProduct;
import app.component.tag.repository.TagRepository;
import app.component.shop.repository.TagProductRepository;
import app.lib.other.Paginate;
import app.lib.yun.YunUpLoad;
import app.component.system.helper.Utils;
import app.component.shop.repository.TypeRelationPropertyRepository;
import app.component.shop.repository.ShopPropertyRepository;
import app.component.shop.repository.PropertyOptionRepository;
import app.component.shop.repository.ProductRelationPropertyRepository;
import app.component.shop.model.ProductRelationProperty;
import std.array;
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
        auto productRepository = new ProductRepository(_cManager);
        auto list = productRepository.adminList(conditions, limit);
        auto tpr = new TagProductRepository(_cManager);
        auto tr  = new TagRepository(_cManager);
        auto tagproducts = tpr.findAll();
        auto tags = tr.findAll();
        view.assign("data", list["data"]);

        if("title" !in conditions){
            conditions["title"] = "";
        }
        view.assign("get", conditions);
        view.assign("tagproducts", tagproducts);
        view.assign("tags", tags);
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
        return view.render("shop/product/list");
    }

    @Action Response add()
    {
        auto pcRepository = new ProductCategoryRepository(_cManager);
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            auto productModel = new Product();
            auto productRepository = new ProductRepository(_cManager);
            int time = cast(int) time();

            productModel.pc_picurl = request.post("pc_picurl");
            productModel.app_picurl = request.post("app_picurl");
            productModel.wap_picurl = request.post("wap_picurl");
            string[] picurlarr;
            for( size_t i = 1 ; i < 6 ; i++) {
                auto tmp = request.post("picurls" ~ i.to!string);
                picurlarr ~= tmp.dup;
            }
            productModel.picurls = toJSON(picurlarr).toString;

            productModel.category_id = request.post("category_id").to!int;
            productModel.title = decodeComponent(request.post("title"));
            productModel.code = request.post("code");
            productModel.introduction = decodeComponent(request.post("introduction"));
            productModel.min_price = cast(int) (request.post("min_price").to!float * 100);
            productModel.max_price = cast(int) (request.post("max_price").to!float * 100);
            productModel.content = request.post("content");
            //productModel.sort = request.post("sort").to!int;
            productModel.status = request.post("status").to!short;
            productModel.updated  = time;
            productModel.created  = time;

            auto tr = new TagRepository(_cManager);
            auto tags = tr.findAll();
            int[] tagarr;
            tagarr.length = tags.length; 
            foreach(key,tag; tags)
            {
                string tag_id = tag.id.to!string;
                if(request.post("tag"~tag_id , "") != null)
                tagarr[key] = request.post("tag"~tag_id , "").to!int;
            }

            auto tpr = new TagProductRepository(_cManager);
            TagProduct tp = new TagProduct;

            auto save = productRepository.save(productModel);
            if (save !is null)
            {
                foreach(tag; tagarr)
                {
                    tp.product_id = save.id;
                    tp.tag_id = tag;
                    tp.created = time;
                    tpr.insert(tp);
                }
                return new RedirectResponse(request, url("admin:shop.product.list"));
            }else {
                view.assign("errorMessages", ["操作失败"]);
            }
        }
        auto tr = new TagRepository(_cManager);
        auto tags = tr.findAll();
        view.assign("tags", tags);
        view.assign("categorys", pcRepository.all());

        Response response = new Response(request);
        response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
        response.setContent(view.render("shop/product/add"));
        return response;
    }

    @Action Response edit(int id, string action)
    {
        auto productRepository = new ProductRepository(_cManager);
        auto productCategory = new ProductCategoryRepository(_cManager);
        auto productModel = productRepository.find(id);
        
        JSONValue picurls;
        if(productModel.picurls){
            picurls = parseJSON(productModel.picurls).array;
        }

        auto productCategoryModel = productCategory.find(productModel.category_id);
        if(action == "property")
        {
            if (request.methodAsString() == HttpMethod.POST.asString())
            {

                ProductRelationProperty[] productRelationPropertys;
                auto productRelationPropertyRepository = new ProductRelationPropertyRepository(_cManager);
                // auto params = request.postForm.formMap();
                int time = cast(int) time();
                logInfo(id);
                // foreach(key,param; params)
                // {

                //     string tmpPropertyIdStr = key;
                //     tmpPropertyIdStr = tmpPropertyIdStr.replace("propertys", "");
                //     tmpPropertyIdStr = tmpPropertyIdStr.replace("%5B", "");
                //     tmpPropertyIdStr = tmpPropertyIdStr.replace("%5D", "");
                //     tmpPropertyIdStr = tmpPropertyIdStr.replace("]", "");
                //     if(isNumeric(tmpPropertyIdStr)){
                //         int tmpPropertyId = tmpPropertyIdStr.to!int;
                //         foreach(value; param)
                //         {
                //             logInfo(value);
                //             auto tmp = new ProductRelationProperty();
                //             tmp.product_id = id;
                //             tmp.property_id = tmpPropertyId.to!int;
                //             if(isNumeric(value))
                //             {
                //                 tmp.property_option_id = value.to!int;
                //             }else{
                //                 tmp.property_input = value;
                //             }
                //             tmp.updated = time;
                //             tmp.created = time;
                //             productRelationPropertys ~= tmp;
                //         }
                //     }
                // }
                if(productRelationPropertys)
                {
                    productRelationPropertyRepository.removeAllByProductId(id);
                    productRelationPropertyRepository.saveAll(productRelationPropertys);
                }
            }
            auto propertyIds = (new TypeRelationPropertyRepository(_cManager)).findAllByPropertyIds(productCategoryModel.type_id);
            auto propertys = (new ShopPropertyRepository(_cManager)).findAllByIds(propertyIds);
            auto propertyOptions = (new PropertyOptionRepository(_cManager)).findAllByPropertyIds(propertyIds);
            view.assign("productPropertyInputs",  (new ProductRelationPropertyRepository(_cManager)).findInputsByProductId(id));
            view.assign("propertys",  propertys);
            view.assign("propertyOptions",  (new ProductRelationPropertyRepository(_cManager)).findChecked(id, propertyOptions));
            view.assign("category",  productCategoryModel);
            view.assign("data",  productModel);

            Response response = new Response(request);
            response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
            response.setContent(view.render("shop/product/property"));
            return response;

        }else{
            if (request.methodAsString() == HttpMethod.POST.asString())
            {
                productModel.title = request.post("title");
                productModel.code = request.post("code");
                productModel.introduction = request.post("introduction");
                productModel.min_price = cast(int) (request.post("min_price").to!float * 100);
                productModel.max_price = cast(int) (request.post("max_price").to!float * 100);
                productModel.content = request.post("content");
                //productModel.sort = request.post("sort").to!int;
                productModel.status = request.post("status").to!short;
                productModel.pc_picurl = request.post("pc_picurl");
                productModel.app_picurl = request.post("app_picurl");
                productModel.wap_picurl = request.post("wap_picurl");

                productModel.updated = cast(int) time();

                string[] picurlarr;
                picurlarr.length = 5;
                for( int i = 1 ; i < 6 ; i++) {
                    auto tmp = request.post("picurls" ~ i.to!string);
                    picurlarr ~= tmp.dup;
                }
                productModel.picurls = toJSON(picurlarr).toString;

                auto tr = new TagRepository(_cManager);
                auto tags = tr.findAll();
                int[] tagarr;
                tagarr.length = tags.length;
                foreach(key,tag; tags)
                {
                    string tag_id = tag.id.to!string;
                    if(request.post("tag"~tag_id , "") != null)
                        tagarr[key] = request.post("tag"~tag_id , "").to!int;
                }

                auto tpr = new TagProductRepository(_cManager);
                TagProduct tp = new TagProduct;
                tpr.removes(id.to!int);


                auto save = productRepository.save(productModel);
                if (save !is null)
                {
                    foreach(tag; tagarr)
                    {
                        tp.product_id = save.id;
                        tp.tag_id = tag;
                        tp.created = cast(int) time();
                        tpr.insert(tp);
                    }
                    return new RedirectResponse(request, url("admin:shop.product.list"));
                }else {
                    view.assign("errorMessages", ["操作失败"]);
                }
            }
            auto tr = new TagRepository(_cManager);
            auto tags = tr.findAll();
            auto tpr  = new TagProductRepository(_cManager);

            view.assign("tags", tags);
            view.assign("tagproducts", tpr.getTagProduct(id));
            view.assign("category",  productCategoryModel);
            view.assign("data",  productModel);
            view.assign("picurls",  picurls);

            Response response = new Response(request);
            response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
            response.setContent(view.render("shop/product/edit"));
            return response;
        }
    }

    @Action Response del(int id)
    {
        auto productRepository = new ProductRepository(_cManager);
        auto productModel = productRepository.find(id);
        productRepository.remove(productModel);
        auto tpr = new TagProductRepository(_cManager);
        tpr.removes(id.to!int); 
        return new RedirectResponse(request, url("admin:shop.product.list"));
    }
}
