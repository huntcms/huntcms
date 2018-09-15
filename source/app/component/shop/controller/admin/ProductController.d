module app.component.shop.controller.admin.ProductController;

import hunt.framework;
import hunt.framework.simplify;
import hunt.framework.http.RedirectResponse;
import std.uri;
import std.digest.sha;
import kiss.logger;
import kiss.datetime.format;
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
        auto productRepository = new ProductRepository();
        auto list = productRepository.adminList(conditions, limit);
        auto tpr = new TagProductRepository;
        auto tr  = new TagRepository;
        auto tagproducts = tpr.findAll();
        auto tags = tr.findAll();
        view.assign("data", list["data"]);
        view.assign("get", conditions);
        view.assign("tagproducts", tagproducts);
        view.assign("tags", tags);
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
            auto pcPicurl = request.postForm.getFileValue("pc_picurl");
            auto appPicurl = request.postForm.getFileValue("app_picurl");
            auto wapPicurl = request.postForm.getFileValue("wap_picurl");
            auto picurls1 = request.postForm.getFileValue("picurls1");
            auto picurls2 = request.postForm.getFileValue("picurls2");
            auto picurls3 = request.postForm.getFileValue("picurls3");
            auto picurls4 = request.postForm.getFileValue("picurls4");
            auto picurls5 = request.postForm.getFileValue("picurls5");
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

            auto upload = new YunUpLoad(
                "1004",
                "http://upload.putaocloud.com",
                "0d87e77f509a419285db58f985836901", 
                "2fa77ec72e6a4c338515bfef98b97c42"
                );
            if (pcPicurl)
            {
                ubyte[] file_data;
                auto filesize = pcPicurl.fileSize;
                pcPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                auto sha1 = toHexString(sha1Of(file_data));
                auto saveName = sha1 ~ "." ~ Utils.fileExt(pcPicurl.fileName);
                auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                productModel.pc_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 
            }else
                productModel.pc_picurl = request.post("currentpcpic");

            if (appPicurl)
            {
                ubyte[] file_data;
                auto filesize = appPicurl.fileSize;
                appPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                auto sha1 = toHexString(sha1Of(file_data));
                auto saveName = sha1 ~ "." ~ Utils.fileExt(appPicurl.fileName);
                auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                productModel.app_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 
            }else
                productModel.app_picurl = request.post("currentapppic");

            if (wapPicurl)
            {
                ubyte[] file_data;
                auto filesize = wapPicurl.fileSize;
                wapPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                auto sha1 = toHexString(sha1Of(file_data));
                auto saveName = sha1 ~ "." ~ Utils.fileExt(wapPicurl.fileName);
                auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                productModel.wap_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png"; 
            }else
                productModel.wap_picurl = request.post("currentwappic"); 

            //logInfo(picurls);
            if (picurls1||picurls2||picurls3||picurls4||picurls5)
            {
                string[5] picurlarr;

                if(picurls1)
                {
                    ubyte[] file_data;
                    auto filesize = picurls1.fileSize;
                    picurls1.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(picurls1.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    picurlarr[0] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }
                if(picurls2)
                {
                    ubyte[] file_data;
                    auto filesize = picurls2.fileSize;
                    picurls2.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(picurls2.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    picurlarr[1] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }
                if(picurls3)
                {
                    ubyte[] file_data;
                    auto filesize = picurls3.fileSize;
                    picurls3.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(picurls3.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    picurlarr[2] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }
                if(picurls4)
                {
                    ubyte[] file_data;
                    auto filesize = picurls4.fileSize;
                    picurls4.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(picurls4.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    picurlarr[3] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }
                if(picurls5)
                {
                    ubyte[] file_data;
                    auto filesize = picurls5.fileSize;
                    picurls5.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(picurls5.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    picurlarr[4] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }
                //logInfo(picurlarr);
                                //logInfo(JSONValue(picurlarr));

                productModel.picurls = to!string(picurlarr);
                 
            }else{
                auto tr = new TagRepository;
                auto tags = tr.findAll();
                view.assign("tags", tags);
                view.assign("categorys", pcRepository.all());
                view.assign("errorMessages", ["至少一张预览图"]);
                return request.createResponse().setContent(view.render("shop/product/add"));
            }

            auto tr = new TagRepository;
            auto tags = tr.findAll();
            int[] tagarr;
            tagarr.length = tags.length; 
            foreach(key,tag; tags)
            {
                string tag_id = tag.id.to!string;
                if(request.post("tag"~tag_id , "") != null)
                tagarr[key] = request.post("tag"~tag_id , "").to!int;
            }

            auto tpr = new TagProductRepository;
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
                return new RedirectResponse(createUrl("shop.product.list"));
            }else {
                view.assign("errorMessages", ["操作失败"]);
            }
        }
        auto tr = new TagRepository;
        auto tags = tr.findAll();
        view.assign("tags", tags);
        view.assign("categorys", pcRepository.all());
        return request.createResponse().setContent(view.render("shop/product/add"));
    }

    @Action Response edit(int id, string action)
    {
        auto productRepository = new ProductRepository();
        auto productCategory = new ProductCategoryRepository();
        auto productModel = productRepository.find(id);
        auto productCategoryModel = productCategory.find(productModel.category_id);
        if(action == "property")
        {
            if (request.method == "POST")
            {

                ProductRelationProperty[] productRelationPropertys;
                auto productRelationPropertyRepository = new ProductRelationPropertyRepository();
                auto params = request.postForm.formMap();
                int time = time();
                logInfo(id);
                foreach(key,param; params)
                {

                    string tmpPropertyIdStr = key;
                    tmpPropertyIdStr = tmpPropertyIdStr.replace("propertys", "");
                    tmpPropertyIdStr = tmpPropertyIdStr.replace("%5B", "");
                    tmpPropertyIdStr = tmpPropertyIdStr.replace("%5D", "");
                    tmpPropertyIdStr = tmpPropertyIdStr.replace("]", "");
                    if(isNumeric(tmpPropertyIdStr)){
                        int tmpPropertyId = tmpPropertyIdStr.to!int;
                        foreach(value; param)
                        {
                            logInfo(value);
                            auto tmp = new ProductRelationProperty();
                            tmp.product_id = id;
                            tmp.property_id = tmpPropertyId.to!int;
                            if(isNumeric(value))
                            {
                                tmp.property_option_id = value.to!int;
                            }else{
                                tmp.property_input = value;
                            }
                            tmp.updated = time;
                            tmp.created = time;
                            productRelationPropertys ~= tmp;
                        }
                    }
                }
                if(productRelationPropertys)
                {
                    productRelationPropertyRepository.removeAllByProductId(id);
                    productRelationPropertyRepository.saveAll(productRelationPropertys);
                }
            }
            auto propertyIds = (new TypeRelationPropertyRepository).findAllByPropertyIds(productCategoryModel.type_id);
            auto propertys = (new ShopPropertyRepository).findAllByIds(propertyIds);
            auto propertyOptions = (new PropertyOptionRepository).findAllByPropertyIds(propertyIds);
            view.assign("productPropertyInputs",  (new ProductRelationPropertyRepository).findInputsByProductId(id));
            view.assign("propertys",  propertys);
            view.assign("propertyOptions",  (new ProductRelationPropertyRepository).findChecked(id, propertyOptions));
            view.assign("category",  productCategoryModel);
            view.assign("data",  productModel);
            return request.createResponse().setContent(view.render("shop/product/property"));
        }else{
            if (request.method == "POST")
            {
                productModel.title = request.post("title");
                productModel.code = request.post("code");
                productModel.introduction = request.post("introduction");
                productModel.min_price = cast(int) (request.post("min_price").to!float * 100);
                productModel.max_price = cast(int) (request.post("max_price").to!float * 100);
                productModel.content = request.post("content");
                //productModel.sort = request.post("sort").to!int;
                productModel.status = request.post("status").to!short;
                auto pcPicurl = request.postForm.getFileValue("pc_picurl");
                auto appPicurl = request.postForm.getFileValue("app_picurl");
                auto wapPicurl = request.postForm.getFileValue("wap_picurl");
                auto picurls1 = request.postForm.getFileValue("picurls1");
                auto picurls2 = request.postForm.getFileValue("picurls2");
                auto picurls3 = request.postForm.getFileValue("picurls3");
                auto picurls4 = request.postForm.getFileValue("picurls4");
                auto picurls5 = request.postForm.getFileValue("picurls5");

                productModel.updated = time();

                auto upload = new YunUpLoad(
                "1004",
                "http://upload.putaocloud.com",
                "0d87e77f509a419285db58f985836901",
                "2fa77ec72e6a4c338515bfef98b97c42"
                );
                if (pcPicurl)
                {
                    ubyte[] file_data;
                    auto filesize = pcPicurl.fileSize;
                    pcPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(pcPicurl.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    productModel.pc_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }else
                    productModel.pc_picurl = request.post("currentpcpic");

                if (appPicurl)
                {
                    ubyte[] file_data;
                    auto filesize = appPicurl.fileSize;
                    appPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(appPicurl.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    productModel.pc_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }else
                    productModel.app_picurl = request.post("currentapppic");

                if (wapPicurl)
                {
                    ubyte[] file_data;
                    auto filesize = wapPicurl.fileSize;
                    wapPicurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                    auto sha1 = toHexString(sha1Of(file_data));
                    auto saveName = sha1 ~ "." ~ Utils.fileExt(wapPicurl.fileName);
                    auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                    productModel.wap_picurl = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";
                }else
                    productModel.wap_picurl = request.post("currentwappic");

                // if (picurls1||picurls2||picurls3||picurls4||picurls5)
                // {
                //     string[] picurlarr;
                //     picurlarr.length = picurls.length;
                //     foreach(key,picurl;picurls)
                //     {
                //         ubyte[] file_data;
                //         auto filesize = picurl.fileSize;
                //         picurl.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                //         auto sha1 = toHexString(sha1Of(file_data));
                //         auto saveName = sha1 ~ "." ~ Utils.fileExt(picurl.fileName);
                //         auto json = parseJSON( upload.doUpload(cast(byte[])file_data , cast(string)saveName));
                //         picurlarr[key] = "https://mall-file.putaocdn.com/largefile/" ~ json["hash"].str ~ "_nodown.png";

                //     }
                //     productModel.picurls = JSONValue(picurlarr);

                // }else
                //     productModel.picurls = request.post("currentpicurls");

                auto tr = new TagRepository;
                auto tags = tr.findAll();
                int[] tagarr;
                tagarr.length = tags.length;
                foreach(key,tag; tags)
                {
                    string tag_id = tag.id.to!string;
                    if(request.post("tag"~tag_id , "") != null)
                        tagarr[key] = request.post("tag"~tag_id , "").to!int;
                }

                auto tpr = new TagProductRepository;
                TagProduct tp = new TagProduct;
                tpr.removes(id.to!int);


                auto save = productRepository.save(productModel);
                if (save !is null)
                {
                    foreach(tag; tagarr)
                    {
                        tp.product_id = save.id;
                        tp.tag_id = tag;
                        tp.created = time();
                        tpr.insert(tp);
                    }
                    return new RedirectResponse(createUrl("shop.product.list"));
                }else {
                    view.assign("errorMessages", ["操作失败"]);
                }
            }
            auto tr = new TagRepository;
            auto tags = tr.findAll();
            auto tpr  = new TagProductRepository;

            view.assign("tags", tags);
            view.assign("tagproducts", tpr.getTagProduct(id));
            view.assign("category",  productCategoryModel);
            view.assign("data",  productModel);
            return request.createResponse().setContent(view.render("shop/product/edit"));
        }
    }

    @Action Response del(int id)
    {
        auto productRepository = new ProductRepository();
        auto productModel = productRepository.find(id);
        productRepository.remove(productModel);
        auto tpr = new TagProductRepository;
        tpr.removes(id.to!int); 
        return new RedirectResponse(createUrl("shop.product.list"));
    }
}
