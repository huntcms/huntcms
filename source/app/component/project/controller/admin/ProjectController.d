module app.component.project.controller.admin.ProjectController;

import hunt.framework;
import hunt.logging;
import hunt.util.DateTime;
import hunt.util.Serialize;
import hunt.http.codec.http.model.HttpMethod;
import hunt.entity.domain;

import app.lib.controller.AdminBaseController;
import app.component.project.repository.ProjectRepository;
import app.component.project.repository.ProjectMiniRepository;
import app.component.project.model.Project;
import app.component.project.model.ProjectMini;

import app.component.document.repository.DocumentRepository;
import app.component.system.repository.LanguageRepository;
import app.component.system.helper.Utils;
import app.component.project.form.ProjectForm;

class ProjectController : AdminBaseController {

    mixin MakeController;

    this(){
        super();   
    }

    /**
     * 工程/项目列表
     */
    @Action string list(){
        string[string] conditions;
        int page = initInt("page", 1, "GET");
        auto pmRepo = new ProjectMiniRepository();
        // auto alldata = pageToJson!ProjectMini(pmRepo.findPageAll(conditions, page, 2));
        auto alldata = pmRepo.pageList(conditions, page, 20);
        view.assign("projects", alldata);
        logError(alldata);
        // import std.algorithm.iteration;
        // logWarning(request.referer ~ " === " ~ request.host);
        // logWarning((request.referer).splitter(request.host));
        // logWarning(url("project.project.list", null, "admin"));
        return view.render("project/project/list");
    }

    /**
     * 修改/创建 工程/项目
     *  ---- update: 使用 valid Form 验证数据的合法性
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息
     */
    @Action Response edit(ProjectForm projectForm){
        
        auto pRepo = new ProjectRepository();

        if(request.methodAsString() == HttpMethod.POST.asString()){

            auto result = projectForm.valid();
            if(!result.isValid){
                logError("Valid error message : ", result.messages());
                auto errors = result.messages();
                foreach(error; errors){
                    this.assignError(error);
                }
                return new RedirectResponse(request, url("project.project.list", null, "admin"));
            }

            int now = cast(int) time();
            auto postData = new Project();
            int postId = initInt("id", 0, "POST");

            if(postId > 0)
                postData = pRepo.find(postId);
            else
                postData.created = now;
            
            postData.updated = now;

            postData.title = projectForm.title;
            postData.logo_url = projectForm.logo_url;
            postData.sign = projectForm.sign;
            postData.main_language = projectForm.main_language;
            postData.introduction = projectForm.introduction;
            postData.detail = projectForm.introduction;
            postData.detail_html = request.post("detail_html", "");
            postData.git_url = projectForm.git_url;
            postData.last_version = projectForm.last_version;
            postData.release_date = projectForm.release_date;
            postData.forum_url = projectForm.forum_url;
            postData.status = projectForm.status;
            postData.sort = projectForm.sort;

            pRepo.save(postData);
            _tmpCache.getTopMenu(true);
            _tmpCache.getProject(postData.sign, true);
            _tmpCache.getProjectMiniPage(1,1, true);

            if(postId > 0)
                this.assignSussess("修改项目成功！");
            else
                this.assignSussess("项目创建成功！");

            return new RedirectResponse(request, url("project.project.list", null, "admin"));
        }

        int id = initInt("id", 0, "GET");
        string editType = "edit";
        if(id == 0)
            editType = "add";
        view.assign("editType", editType);

        auto project = pRepo.find(id);
        auto lRepo = new LanguageRepository();
        auto languages = lRepo.findAll();
        view.assign("project", project);
        view.assign("languages", languages);

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("project/project/edit"));
    }

    /**
     * 物理删除/禁用
     *  ---- update: 增加 sussessMessages / errorMessages 的提示信息
     */
    @Action Response del(string id, string type = "logic"){
        auto pRepo = new ProjectRepository();
        int projectId;
        try {
            projectId = id.to!int;
            if(type == "Physical"){
                auto childNum = (new DocumentRepository).countAllByProjectId(projectId);
                if(childNum == 0){
                    pRepo.removeById(projectId);
                    this.assignSussess("删除成功！");
                }else{
                    this.assignError("工程又关联的文档，请先删除文档！");
                }
            }else{
                auto delData = pRepo.findById(projectId);
                if(delData){
                    delData.status = 0;
                    pRepo.save(delData);
                    this.assignSussess("禁用成功！");
                }
                else
                    this.assignError("数据不存在，请确认后重试");
            }

        }catch(Exception e){
            this.assignError("参数 id 类型不正确");
        }
        
        _tmpCache.getTopMenu(true);
        return new RedirectResponse(request, url("project.project.list", null, "admin"));
    }

}