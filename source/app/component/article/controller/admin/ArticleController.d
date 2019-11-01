module app.component.article.controller.admin.ArticleController;

import app.component.article.model.Article;
import app.component.article.model.TagArticle;
import app.component.article.repository.ArticleRepository;
import app.component.article.repository.CategoryRepository;
import app.component.article.repository.TagArticleRepository;
import app.component.article.validation.ArticleForm;
import app.component.system.controller.admin.LogMiddleware;
import app.component.system.helper.Utils;
import app.component.tag.repository.TagRepository;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.lib.yun.YunUpLoad;

import hunt.framework;
import hunt.http.codec.http.model.HttpHeader;
import hunt.http.codec.http.model.HttpMethod;
import hunt.http.codec.http.model.MultipartFormInputStream;
import hunt.util.DateTime;
import hunt.util.Configuration;
import hunt.text;

import std.digest.sha;
import std.file;
import std.format;

class ArticleController : AdminBaseController {

    mixin MakeController;

    this() {
        super();      
        this.addMiddleware(new LogMiddleware());
    }

    @Action 
    Response list(int page = 1, int perPage = 10) {

        int categoryId = initNum("categoryId", 0, "GET");
        perPage = perPage < 1 ? 10 : perPage;
        page = page < 1 ? 1 : page;
        auto alldata = new ArticleRepository().findByArticle(categoryId, page, perPage);
        int[] tagIds, articleIds;
        auto articles = alldata.getContent();
        foreach(article; articles) {
            articleIds ~= article.id;
        }
        auto tagarticles = new TagArticleRepository().getTagArticleByIds(articleIds);

        // auto tags = new TagRepository().findTagsByIds(tagIds);
        view.assign("categoryId", categoryId);
        view.assign("articles", alldata.getContent());
        view.assign("tagarticles", tagarticles);
        // view.assign("tags", tags);

        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));

        makePageBreadCrumbs("articleList");
        return ResponseView("article/article/list");

    }

    @Action 
    Response add(ArticleForm articleForm) {

        ArticleRepository articleRepository = new ArticleRepository();
        CategoryRepository categoryRepository = new CategoryRepository();
        TagRepository tagRepository = new TagRepository();
        TagArticleRepository tagArticleRepository  = new TagArticleRepository();
        auto tags = tagRepository.findAll();
        int errorNum = 0;

        if(request.methodAsString() == HttpMethod.POST.asString()) {
            auto validRes = articleForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }                
                return new RedirectResponse(request, url("admin:article.article.add"));
            }
            int now = cast(int) time();
            Article article = new Article();
            article.category = categoryRepository.findById(articleForm.category);    
            // article.categories_id = articleForm.category;
            article.title = articleForm.title;  
            article.summary = articleForm.summary; 
            article.author = articleForm.author;  
            article.content = request.post("content"); 
            article.video = articleForm.video;  
            article.status = articleForm.customRadio;  
            article.picture = articleForm.imageFile; 
            article.created = now;
            article.updated = now;

            int[] tagarr;
            tagarr.length = tags.length; 
            foreach(key, tag; tags) {
                string tag_id = tag.id.to!string;
                if(request.post("tag" ~ tag_id, "") != null) {
                    tagarr[key] = initNum("tag" ~ tag_id, 0, "POST");
                }
            }

            int article_id = (articleRepository.save(article)).id;
            
            foreach(tag; tagarr) {
                TagArticle tagArticle = new TagArticle();
                tagArticle.article_id = article_id;
                tagArticle.tag_id = tag;
                tagArticle.created = now;
                tagArticleRepository.insert(tagArticle);
            }
            assignSussess("数据保存成功! ");
            return new RedirectResponse(request, url("admin:article.article.list"));
        }

        auto categories = categoryRepository.findAll();
        view.assign("categories", categories);
        view.assign("tags", tags);
        makePageBreadCrumbs("articleAdd");
        return ResponseView("article/category/add");
    }

    @Action 
    Response edit(ArticleForm articleForm) {   

        ArticleRepository articleRepository = new ArticleRepository();
        Article article;
        CategoryRepository categoryRepository = new CategoryRepository();
        TagRepository tagRepository = new TagRepository();
        auto tags = tagRepository.findAll();
        TagArticleRepository tagArticleRepository  = new TagArticleRepository();
        int id, errorNum = 0;

        if(request.methodAsString() == HttpMethod.POST.asString()) {

            id = initNum("id", 0, "POST");
            if (id > 0) {
                article = articleRepository.find(id);
                if (article is null) {
                    errorNum += 1;
                    assignError("数据异常或不存在, 请稍后重试! ");
                }
            } else {
                errorNum += 1;
                assignError("缺少参数id, 请稍后重试! ");
            }
            if(errorNum > 0) {
                return new RedirectResponse(request, url("admin:article.article.list"));
            }

            auto validRes = articleForm.valid();
            if(!validRes.isValid()) {
                auto errors = validRes.messages();
                foreach(error; errors) {
                    errorNum += 1;
                    assignError(error);
                }                
                string[string] params;
                params["id"] = id.to!string;
                return new RedirectResponse(request, url("article.article.edit", params , "admin"));
            }

            int now = cast(int) time();
            article.category = categoryRepository.findById(articleForm.category);    
            // article.categories_id = articleForm.category;
            article.title = articleForm.title;  
            article.summary = articleForm.summary; 
            article.author = articleForm.author;  
            article.content = request.post("content"); 
            article.video = articleForm.video;  
            article.status = articleForm.customRadio;  
            article.picture = articleForm.imageFile; 
            article.updated = now;
        
            int[] tagarr;
            tagarr.length = tags.length; 
            foreach(key, tag; tags) {
                string tag_id = tag.id.to!string;
                if(request.post("tag" ~ tag_id, "") != null) {
                    tagarr[key] = initNum("tag" ~ tag_id, 0, "POST");
                }
            }

            int article_id = (articleRepository.save(article)).id;
            tagArticleRepository.removes(article_id.to!int);
            foreach(tag; tagarr) {
                TagArticle tagArticle = new TagArticle();
                tagArticle.article_id = article_id;
                tagArticle.tag_id = tag;
                tagArticle.created = now;
                tagArticleRepository.insert(tagArticle);
            }
            assignSussess("数据保存成功! ");
            return new RedirectResponse(request, url("admin:article.article.list"));
        }

        auto categories = categoryRepository.findAll();

        id = initNum("id", 0, "GET");
        if (id > 0) {
            article = articleRepository.find(id);
            if (article is null) {
                errorNum += 1;
                assignError("数据异常或不存在, 请稍后重试! ");
            }
        } else {
            errorNum += 1;
            assignError("缺少参数id, 请稍后重试! ");
        }
        if (errorNum > 0) {
            return new RedirectResponse(request, url("admin:article.article.list"));
        }

        view.assign("article", article);
        view.assign("categories", categories);      
        view.assign("tags", tags);
        view.assign("tagarticles", tagArticleRepository.getTagArticle(id));
        view.assign("articleId", id);
        makePageBreadCrumbs("articleEdit");

        return ResponseView("article/category/edit");
    }   

    @Action 
    Response del(int id) {
        (new ArticleRepository()).removeById(id);
        (new TagArticleRepository()).removes(id.to!int);  
        assignSussess("文章删除成功! ");
        return new RedirectResponse(request, url("admin:article.article.list"));
    }

}
