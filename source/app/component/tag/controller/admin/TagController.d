module app.component.tag.controller.admin.TagController;

import app.component.tag.model.Tag;
import app.component.tag.helper.Utils;
import app.component.tag.repository.TagRepository;
import app.component.tag.validation.TagForm;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import hunt.framework;
import hunt.http.codec.http.model.HttpMethod;

class TagController : AdminBaseController {

    mixin MakeController;

    @Action 
    Response list(int perPage, int page = 1) {
        page = page < 1 ? 1 : page;
        perPage = perPage < 1 ? 10 : perPage;
        auto alldata = new TagRepository().findTagPage(page, perPage);
        view.assign("tags", alldata.getContent());
        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        makePageBreadCrumbs("tagList");
        return ResponseView("tag/tag/list");
    }

    @Action 
    Response add (TagForm tagForm) {

        TagRepository repository = new TagRepository();
        short errorNum = 0;

        if (request.methodAsString() == HttpMethod.POST.asString()) {

            auto validRes = tagForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }
                return new RedirectResponse(request, url("admin:tag.tag.add"));
            }

            int now = cast(int) time();
            Tag tag = new Tag();
            tag.name = tagForm.name;
            tag.sort = tagForm.sort;
            tag.status = tagForm.statusRadio;
            tag.created = now;
            tag.updated = now;
            auto saveRes = repository.save(tag);

            if (saveRes !is null) {
                assignSussess("标签添加成功! ");
            } else {
                assignError("服务器响应异常, 请稍后重试! ");
            }
            return new RedirectResponse(request, url("admin:tag.tag.list"));

        }

        makePageBreadCrumbs("tagAdd");
        return ResponseView("tag/tag/add");
    }

    @Action 
    Response edit (TagForm tagForm) {

        auto repository = new TagRepository();
        short errorNum = 0;
        Tag tag;
        int id;

        if (request.methodAsString() == HttpMethod.POST.asString()) {
            id = initNum("id", 0, "POST");
            if (id <= 0) {
                errorNum += 1;
                assignError("修改tag的id不能为空! ");
            } else {
                tag = repository.find(id);
                if(tag is null) {
                    errorNum += 1;
                    assignError("数据不存在或已删除, 请稍后重试! ");
                }
            }
            if (errorNum >= 0) {
                return new RedirectResponse(request, url("admin:tag.tag.list"));
            }
            auto validRes = tagForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }
                string[string] params;
                params["id"] = id.to!string;
                return new RedirectResponse(request, url("tag.tag.edit", params, "admin"));
            }
            
            int now = cast(int) time();
            tag.name = tagForm.name;
            tag.sort = tagForm.sort;
            tag.status = tagForm.statusRadio;
            tag.updated = now;
            auto saveRes = repository.save(tag);
        
            if (saveRes !is null) {
                assignSussess("标签保存成功! ");
            } else {
                assignError("服务器响应异常, 请稍后重试! ");
            }

            return new RedirectResponse(request, url("admin:tag.tag.list"));
        }

        id = initNum("id", 0, "GET");
        if (id <= 0) {
            errorNum += 1;
            assignError("Tag的id不能为空! ");
        } else {
            tag = repository.find(id);
            if (tag is null) {
                errorNum += 1;
                assignError("数据不存在或已删除, 请稍后重试! ");
            }
        }
        if (errorNum > 0) {
            return new RedirectResponse(request, url("admin:tag.tag.list"));
        }
        
        view.assign("tag", tag);
        makePageBreadCrumbs("tagEdit");
        return ResponseView("tag/tag/edit");
    }

    @Action 
    Response del(int id) {
        TagRepository tagRepository = new TagRepository();
        auto exsitData = tagRepository.findById(id);     
        if(exsitData !is null) {
            int now = cast(int) time();
            exsitData.deleted = now; 
            auto saveData = tagRepository.save(exsitData);
            if(saveData !is null)
                assignSussess("标签删除成功! ");
            else 
                assignError("服务器响应异常, 请稍后重试! ");
        } else {
            assignError("服务器响应异常, 请稍后重试! ");
        }
        return new RedirectResponse(request, url("admin:tag.tag.list"));

    }
}