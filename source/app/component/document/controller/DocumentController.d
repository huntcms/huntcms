module app.component.document.controller.DocumentController;

import hunt.framework;
import hunt.util.Configuration;
import hunt.logging;
import hunt.http.codec.http.model.HttpMethod;
import hunt.util.Serialize;
import app.lib.controller.FrontBaseController;
import app.component.system.helper.Utils;
import app.component.project.repository.ProjectMiniRepository;
import app.component.document.repository.DocumentRepository;
import app.component.document.repository.DocBaseRepository;
import app.component.document.repository.NodeRepository;
import app.component.document.repository.ItemMiniRepository;
import app.component.document.repository.ItemRepository;
import app.component.system.repository.LanguageRepository;
import app.component.project.model.ProjectMini;
import app.component.project.model.Project;
import app.component.document.model.DocBase;
import app.component.document.model.Node;
import app.component.document.model.ItemMini;
import app.component.document.model.Item;
import app.component.system.model.Language;
import app.component.system.helper.PaginateFront;
import std.digest.sha;
import std.file;
import std.algorithm.iteration;
import std.array;
import std.datetime;

alias EntityCondition = hunt.entity.domain.Condition.Condition;
class DocumentController : FrontBaseController{

    mixin MakeController;

    private ProjectMiniRepository _pmRepo;
    private DocumentRepository _docRepo;
    private DocBaseRepository _docbaseRepo;
    private NodeRepository _nRepo;
    private ItemMiniRepository _imRepo;
    private ItemRepository _iRepo;
    private LanguageRepository _langRepo;

    this(){
        super();
        _pmRepo = new ProjectMiniRepository(_cManager);
        _docRepo = new DocumentRepository(_cManager);
        _docbaseRepo = new DocBaseRepository(_cManager);
        _nRepo = new NodeRepository(_cManager);
        _imRepo = new ItemMiniRepository(_cManager);
        _iRepo = new ItemRepository(_cManager);
        _langRepo = new LanguageRepository(_cManager);
    }

    /**
     * 
     */
    // @Action Response detail(string langSign, string proSignAndVersion, string nodeSigns){     
    @Action Response detail(string proSign, string docVersion, string nodeSigns = ""){          

        long[] timeGroup;
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        int someError = 1;
        // auto project = _pmRepo.findDetailBySign(proSign);
        // logWarning(proSign ~ " ~~ " ~ docVersion ~ " ~~ " ~ nodeSigns);
        auto project = _tmpCache.getProject(proSign);
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        // auto language = _langRepo.findOneBySign("en");
        auto language = _tmpCache.getOneLanguage("en");   
        timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs"); 

        if(project && language){
            view.assign("project", project);
            view.assign("language", language);
            DocBase doc;

            timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
            if(docVersion == "current"){
                doc = _docbaseRepo.find(new EntityCondition(" %s = %s and %s = 1 ", 
                        _docbaseRepo.Field.project_id, project.id, _docbaseRepo.Field.currect));
            }else{
                doc = _docbaseRepo.find(new EntityCondition(" %s = %s and %s = '%s' ", 
                        _docbaseRepo.Field.project_id, project.id, _docbaseRepo.Field.doc_version, docVersion));
            }
            timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");

            if(doc){
                view.assign("doc", doc);
                timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
                auto frontMenu = _tmpCache.findFrontMenus(doc.id, language.id, doc.main_language);
                // logWarning(toJSON(frontMenu));
                timeGroup ~= cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
                view.assign("frontMenu", frontMenu);
                if(nodeSigns){
                    auto signs = nodeSigns.split("/");
                    auto leng = signs.length;
                    auto nodeSign = signs[leng-1];
                    auto showItem = _tmpCache.findItemByNodeSign(nodeSign, doc.id, language.id);
                    logInfo(nodeSign ~ "~~~" ~ (doc.id).to!string ~ "~~~" ~ (language.id).to!string);
                    view.assign("showItem", showItem);
                }else{
                    auto tmpItem = new Item();
                    tmpItem.title = "";
                    tmpItem.content_html = "";
                    view.assign("showItem", tmpItem);
                }
                someError = 0;
                view.assign("docVersion", docVersion);
            }
        }
        if(someError == 1){
            return new RedirectResponse(request, "/projects");
        }
        auto endTime = cast(long) convert!("hnsecs", "msecs")(Clock.currStdTime() - (Date(1970, 1, 1) - Date.init).total!"hnsecs");
        timeGroup ~= endTime;

        view.assign("timeGroup",timeGroup);
        // auto exeTime = endTime - timeGroup[0];
        // view.assign("exeTime",exeTime);
        view.assign("exeTime", request.elapsed());

        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.render("document"));
    }

}