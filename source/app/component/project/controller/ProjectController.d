module app.component.project.controller.ProjectController;

import hunt.framework;
import hunt.util.Configuration;
import hunt.logging;
import hunt.http.codec.http.model.HttpMethod;
import app.lib.controller.FrontBaseController;
import app.component.system.helper.Utils;
import app.component.project.repository.ProjectMiniRepository;
import app.component.project.repository.ProjectRepository;
import app.component.project.model.ProjectMini;
import app.component.system.helper.PaginateFront;
import std.digest.sha;
import std.file;
import std.datetime;

class ProjectController : FrontBaseController{

    mixin MakeController;

    private ProjectMiniRepository _pmRepo;
    private ProjectRepository _pRepo;

    this(){
        super();
        _pmRepo = new ProjectMiniRepository();
        _pRepo = new ProjectRepository();
    }

    @Action Response list(){
        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        string[string] conditions;
        conditions["status"] = "1";
        int page = initInt("page", 1, "GET");
        int limit = 9;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        // auto pageInfo = _pmRepo.findPage(conditions, page, limit);
        auto pageInfo = _tmpCache.getProjectMiniPage(page, limit);
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        logInfo(pageInfo);
        if(pageInfo && pageInfo["itemCount"] > 1 && pageInfo["currect"] <= pageInfo["pageCount"]){
            timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
            auto minis = _pmRepo.findPageData(conditions, page, limit);
            auto pageView = new PaginateFront("/projects.html?page={page}", 
                (cast(int) pageInfo["currect"] <= 0 ? 1 : cast(int) pageInfo["currect"]), 
                pageInfo["pageCount"], limit);
            timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");    
            view.assign("pageView", pageView.showPages());
            timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
            view.assign("projects", minis);
        }        
        auto endTime = cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        timeGroup ~= endTime;
        view.assign("timeGroup",timeGroup);
        view.assign("exeTime", request.elapsed());
        // frontPageInfo
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("projects"));
    }


    @Action Response detail(string sign){     
        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");       
        // auto project = _pRepo.findDetailBySign(sign);
        auto project = _tmpCache.getProject(sign);
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        view.assign("project", project);        
        view.assign("timeGroup",timeGroup);
        view.assign("exeTime", request.elapsed());
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("projectDetail"));
    }

}