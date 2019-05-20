module app.component.article.controller.admin.ArticleController;

import hunt.framework;
import app.component.article.repository.ArticleRepository;
import hunt.util.DateTime;
import app.component.article.model.Article;
import app.component.article.model.TagArticle;
import app.component.article.repository.CategoryRepository;
import app.component.tag.repository.TagRepository;
import app.component.article.repository.TagArticleRepository;
import app.lib.controller.AdminBaseController;
import app.component.system.helper.Utils;
import app.component.system.controller.admin.LogMiddleware;
import app.lib.yun.YunUpLoad;
import std.digest.sha;
import std.file;
import hunt.util.Configuration;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.HttpHeader;

import hunt.http.codec.http.model.MultipartFormInputStream;
import std.format;
import hunt.text;
import app.lib.functions;

class ArticleController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
        this.addMiddleware(new LogMiddleware(_cManager));
    }

    @Action string list()
    {    
        auto repository = new ArticleRepository(_cManager);
        auto tae = new TagArticleRepository(_cManager);
        auto tr  = new TagRepository(_cManager);
        auto alldata = repository.findAll();
        auto tagarticles = tae.findAll();
        auto tags = tr.findAll();
        //logDebug("articles : ", toJSON(alldata).toString);
        view.assign("articles", alldata);
        view.assign("tagarticles", tagarticles);
        view.assign("tags", tags);
        string lang = findLocal();
        return view.setLocale(lang).render("article/article/list");
    }

    @Action Response add()
    {
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();

            Article art = new Article;
            ArticleRepository are = new ArticleRepository(_cManager);

            art.category = (new CategoryRepository((_cManager))).findById( to!int(request.post("category","0")) );    
            art.title = request.post("title");      
            art.summary = request.post("summary");   
            art.author = request.post("author"); 
            art.content = request.post("content"); 
            art.video = request.post("video");
            art.status = to!short(request.post("customRadio","0"));  
            art.picture = request.post("imageFile");

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
            foreach(tag;tagarr){
                logInfo(tag);
            }
            auto id = request.post("id");
            if(id.length != 0)
            {
                art.id = id.to!int;
                auto exsit_data = are.findById(id.to!int);
                if(exsit_data !is null)
                    art.created = exsit_data.created;
            }
            else
            {
                 art.created = now;
            }

            art.updated = now;

            int article_id = (are.save(art)).id;
            
            auto tae = new TagArticleRepository(_cManager);
            if(id.length != 0)
            {
                tae.removes(id.to!int);    
            }
            TagArticle tar = new TagArticle;
            foreach(tag; tagarr)
            {
                tar.article_id = article_id;
                tar.tag_id = tag;
                tar.created = now;
                tae.insert(tar);
            }
            return new RedirectResponse(request, "/admincp/article/articles");
        }
        auto cr = new CategoryRepository(_cManager);
        auto categories = cr.findAll();
        auto tr = new TagRepository(_cManager);
        auto tags = tr.findAll();
        view.assign("categories", categories);
        view.assign("tags", tags);
        
        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("article/article/add"));
    }

    @Action string edit(int id)
    {   
        auto article = new ArticleRepository(_cManager);
        view.assign("article", article.find(id));
        auto cr = new CategoryRepository(_cManager);
        auto categories = cr.findAll();
        auto tr = new TagRepository(_cManager);
        auto tags = tr.findAll();
        auto tar  = new TagArticleRepository(_cManager);

        view.assign("categories", categories);      
        view.assign("tags", tags);
        view.assign("tagarticles", tar.getTagArticle(id));

        string lang = findLocal();
        return view.setLocale(lang).render("article/article/edit");
    }   

    @Action Response del(int id)
    {
        (new ArticleRepository(_cManager)).removeById(id);
        auto tar = new TagArticleRepository(_cManager);
        tar.removes(id.to!int);  
        return new RedirectResponse(request, "/admincp/article/articles");
    }

}
