module app.article.controller.admin.ArticleController;


import hunt;
import app.article.repository.ArticleRepository;
import kiss.datetime;
import app.article.model.Article;
import app.article.repository.CategoryRepository;


class ArticleController : Controller
{
    mixin MakeController;

    @Action string list()
    {    
        auto repository = new ArticleRepository;
        auto alldata = repository.findAll();
        logDebug("articles : ", toJSON(alldata).toString);
        view.assign("articles", alldata);

       return view.render("article/article/list");
    }

    @Action Response add()
    {
        if(request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();

            Article art = new Article;
            ArticleRepository are = new ArticleRepository;
            art.category = (new CategoryRepository).findById( to!int(request.post("category" , "0")) );    
            art.title = request.post("title" , "");      
            art.summary = request.post("summary" , "");   
            art.author = request.post("author" , ""); 
            art.content = request.post("content" , "");           
            art.status = to!short(request.post("customRadio","0"));  

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

            are.save(art);

            return new RedirectResponse("/admincp/article/articles");
        }
        auto repository = new CategoryRepository;
        auto categories = repository.findAll();
        view.assign("categories", categories);

        return request.createResponse().setContent(view.render("article/article/add"));
    }

    @Action string edit(int id)
    {   
        auto article = new ArticleRepository;
        view.assign("article", article.find(id));
        auto repository = new CategoryRepository;
        auto categories = repository.findAll();
        view.assign("categories", categories);      
  
        return view.render("article/article/edit");
    }   

    @Action Response del(int id)
    {
        (new ArticleRepository).removeById(id);
        return new RedirectResponse("/admincp/article/articles");
    }
}
