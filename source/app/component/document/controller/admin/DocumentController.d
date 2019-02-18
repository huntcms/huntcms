module app.component.document.controller.admin.DocumentController;

import hunt.framework;
import hunt.logging;
import hunt.util.DateTime;
import hunt.util.Serialize;
import hunt.http.codec.http.model.HttpMethod;
import hunt.entity.domain;

import app.lib.controller.AdminBaseController;
import app.component.system.model.Language;
import app.component.document.model.Document;
import app.component.document.model.DocBase;
import app.component.document.model.Node;
import app.component.document.model.Item;
import app.component.document.form.DocumentForm;
import app.component.project.model.ProjectMini;
import app.component.system.repository.LanguageRepository;
import app.component.document.repository.DocumentRepository;
import app.component.document.repository.DocBaseRepository;
import app.component.document.repository.NodeRepository;
import app.component.document.repository.ItemRepository;
import app.component.project.repository.ProjectMiniRepository;
import app.component.project.repository.ProjectRepository;
import app.component.system.helper.Utils;

import std.array;

class DocumentController : AdminBaseController {

    mixin MakeController;

    this(){
        super();
    }

    /**
     * 文档列表
     */
    @Action string list(){
        string[string] conditions;
        conditions["currect"] = "1";
        int page = initInt("page", 1, "GET");
        auto languages = (new LanguageRepository).findAll();
        auto projects = (new ProjectMiniRepository).findAll();
        auto allDocData = pageToJson!DocBase((new DocBaseRepository).findPageAll(conditions, page, 20));
        view.assign("languages", languages);
        view.assign("projects", projects);
        view.assign("documents", allDocData);
        return view.render("document/document/list");
    }

    /**
     * 查看某一项目的全部文档
     * GET project_id
     */
    @Action string history(){
        string[string] conditions;
        int projectId = initInt("project_id", 0, "GET");
        conditions["project_id"] = projectId.to!string;
        int page = initInt("page", 1, "GET");
        auto languages = (new LanguageRepository).findAll();
        auto projects = (new ProjectMiniRepository).findAll();
        auto allDocData = pageToJson!DocBase((new DocBaseRepository).findPageAll(conditions, page, 20));
        view.assign("languages", languages);
        view.assign("projects", projects);
        view.assign("documents", allDocData);
        view.assign("breadcrumbs", breadcrumbsManager.generate("documents"));
        logWarning(breadcrumbsManager.generate("documents"));
        return view.render("document/document/history");
    }


    /**
     * 修改/创建 工程/项目
     *  ---- update: 使用 valid Form 验证数据的合法性
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息
     */
    @Action Response edit(DocumentForm documentForm){

        auto docBaseRepo = new DocBaseRepository();

        if(request.methodAsString() == HttpMethod.POST.asString()){

            auto result = documentForm.valid();
            if(!result.isValid){
                logError("Valid error message : ", result.messages());
                auto errors = result.messages();
                foreach(error; errors){
                    this.assignError(error);
                }

                auto hostory = (request.referer).split(request.host);
                if(hostory !is null && hostory.length == 2){
                    return new RedirectResponse(request, hostory[1]);
                }else{
                    return new RedirectResponse(request, url("project.project.list", null, "admin"));
                }

            }

            logError(toJSON(documentForm));

            int now = cast(int) time();
            int postId = initInt("id", 0, "POST");
            auto postData = new DocBase();

            if(postId > 0){
                postData = docBaseRepo.find(postId);
            }else{
                postData.created = now;
            }
            
            postData.updated = now;
            postData.project_id = documentForm.project_id;
            postData.doc_version = documentForm.doc_version;
            postData.currect = cast(short) 0;
            postData.main_language = documentForm.main_language;
            postData.status = documentForm.status;
            postData.sort = documentForm.sort;

            auto realId = (docBaseRepo.save(postData)).id;
            int docId = docBaseRepo.findCurrectNow(postData.project_id);
            docBaseRepo.makeCurrect(postData.project_id);
            _tmpCache.getTopMenu(true);
            if(docId){
                int[int] newNodes = (new NodeRepository).copyNode(realId, docId, now);
                (new ItemRepository).copyItem(newNodes, now);
            }

            if(postId > 0)
                this.assignSussess("修改文档成功！");
            else
                this.assignSussess("文档创建成功！");

            // document.document.history
            // document.document.list
            string[string] redirectParams;
            redirectParams["project_id"] = to!string(documentForm.project_id);
            return new RedirectResponse(request, url("document.document.history", redirectParams, "admin"));
        }

        int id = initInt("id", 0, "GET");
        auto editType = "add";
        if(id > 0){
            auto document = docBaseRepo.find(id);
            view.assign("document", document);
            editType = "edit";
        }
        view.assign("editType", editType);
        auto languages = (new LanguageRepository).findAll();
        auto projects = (new ProjectRepository).findAll();
        view.assign("projects", projects);
        view.assign("languages", languages);
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("document/document/edit"));
    }

    /**
     * 物理删除/禁用 （会更新 current 选择的版本）
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息
     */
    @Action Response del(string id, string type = "logic"){
        auto docBaseRep = new DocBaseRepository();
        int docId;
        int projectId = 0;
        try {
            docId = id.to!int;
            auto delData = docBaseRep.findById(docId);
            projectId = delData.project_id;
            if(type == "Physical"){
                auto num = (new NodeRepository).countAllByDocId(docId);
                if(num == 0)
                    docBaseRep.removeById(docId);
                
                this.assignSussess("删除成功！");
            }else{
                if(delData){
                    delData.status = 0;
                    docBaseRep.save(delData);
                    this.assignSussess("禁用成功！");
                }else{
                    this.assignError("数据不存在，请确认后重试");
                }
            }

            if(delData){
                // 查找 current 版本 并且 更新缓存
                docBaseRep.makeCurrect(delData.project_id);
                _tmpCache.getTopMenu(true);
            }

        }catch(Exception e){
            this.assignError("参数 id 类型不正确");
        }
        if(projectId > 0){
            string[string] redirectParams;
            redirectParams["project_id"] = to!string(projectId);
            return new RedirectResponse(request, url("document.document.history", redirectParams, "admin"));
        }else{
            return new RedirectResponse(request, url("project.project.list", null, "admin"));
        }

    }





}