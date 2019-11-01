module app.component.article.controller.admin.CategoryController;

import app.component.article.model.Category;
import app.component.article.repository.CategoryRepository;
import app.component.article.validation.CategoryForm;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import hunt.framework;
import hunt.http.codec.http.model.HttpMethod;
import hunt.util.DateTime;

class CategoryController : AdminBaseController {

    mixin MakeController;

    this() {
        super();      
        this.addMiddleware(new LogMiddleware());
    }

    @Action 
    Response list(int perPage, int page = 1) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 5 : perPage;
        auto alldata = new CategoryRepository().findByCategory(page, perPage);
        view.assign("categories", alldata.getContent());
        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        makePageBreadCrumbs("articleCategoryList");
        return ResponseView("article/category/list");
    }

    @Action 
    Response add(CategoryForm categoryForm) {

        CategoryRepository repository = new CategoryRepository();
        short errorNum = 0;
        Category category;

        if (request.methodAsString() == HttpMethod.POST.asString()) {

            auto validRes = categoryForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }
                return new RedirectResponse(request, url("admin:article.category.add"));
            }

            int now = cast(int) time();
            category = new Category();
            category.name = categoryForm.name;
            category.sort = categoryForm.sort;
            category.status = categoryForm.statusRadio;
            category.created = now;
            category.updated = now;
            auto saveRes = repository.save(category);

            if (saveRes !is null) {
                assignSussess("标签添加成功! ");
            } else {
                assignError("服务器响应异常, 请稍后重试! ");
            }
            return new RedirectResponse(request, url("admin:article.category.list"));

        }
        makePageBreadCrumbs("articleCategoryAdd");
        return ResponseView("article/category/add");
    }

    @Action 
    Response edit(CategoryForm categoryForm) {
    
        CategoryRepository categoryRepository = new CategoryRepository();
        short errorNum = 0;
        Category category;
        int id;

        if (request.methodAsString() == HttpMethod.POST.asString()) {
            id = initNum("id", 0, "POST");
            if (id <= 0) {
                errorNum += 1;
                assignError("修改id不能为空! ");
            } else {
                category = categoryRepository.find(id);
                if (category is null){
                    errorNum += 1;
                    assignError("数据不存在或已删除, 请稍后重试! ");
                }
            }
            if (errorNum >= 0) {
                return new RedirectResponse(request, url("admin:article.category.list"));
            }
            auto validRes = categoryForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }
                string[string] params;
                params["id"] = id.to!string;
                return new RedirectResponse(request, url("article.category.edit", params, "admin"));
            }

            int now = cast(int) time();
            category.name = categoryForm.name;
            category.sort = categoryForm.sort;
            category.status = categoryForm.statusRadio;
            category.updated = now;
            auto saveRes = categoryRepository.save(category);

            if (saveRes !is null) {
                assignSussess("标签保存成功! ");
            } else {
                assignError("服务器响应异常, 请稍后重试! ");
            }
            
            return new RedirectResponse(request, url("admin:article.category.list"));
        }

        id = initNum("id", 0, "GET");
        if (id <= 0) {
            errorNum += 1;
            assignError("Tag的id不能为空! ");
        } else {
            category = categoryRepository.find(id);
            if (category is null) {
                errorNum += 1;
                assignError("数据不存在或已删除, 请稍后重试! ");
            }
        }
        if (errorNum > 0) {
            return new RedirectResponse(request, url("admin:article.category.list"));
        }
        
        view.assign("category", category);
        makePageBreadCrumbs("articleCategoryEdit");
        return ResponseView("article/category/edit");
    }

    @Action 
    Response del(int id) {
        CategoryRepository cr = new CategoryRepository();
        auto exsitData = cr.findById(id);     
        if(exsitData !is null) {
            int now = cast(int) time();
            exsitData.deleted = now; 
            auto saveData = cr.save(exsitData);
            if(saveData !is null)
                assignSussess("分类删除成功! ");
            else 
                assignError("服务器响应异常, 请稍后重试! ");
        } else {
            assignError("服务器响应异常, 请稍后重试! ");
        }
        return new RedirectResponse(request, url("admin:article.category.list"));
    } 
}
