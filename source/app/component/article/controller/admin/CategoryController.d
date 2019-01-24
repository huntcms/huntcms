module app.component.article.controller.admin.CategoryController;

import hunt.framework;
import app.component.article.repository.CategoryRepository;
import app.component.article.model.Category;
import hunt.util.DateTime;
import app.lib.controller.AdminBaseController;
import hunt.http.codec.http.model.HttpMethod;

class CategoryController : AdminBaseController
{
    mixin MakeController;

    this()
    {
        super();      
    }
    
    @Action string list()
    {      
       auto repository = new CategoryRepository;
       auto alldata = repository.findAll();
       //logDebug("categories : ", toJSON(alldata).toString);
       view.assign("categories", alldata); 
       return view.render("article/category/list");
    }

    @Action Response add()
    {
        if(request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();

            Category pm = new Category;
            CategoryRepository cr = new CategoryRepository;
            pm.name = request.post("name");          
            pm.sort = to!int(request.post("sort" , "0")) ;
            pm.status = to!short(request.post("statusRadio","0"));  
            auto id = request.post("id");
            if(id.length != 0)
            {
                pm.id = id.to!int;
                auto exsit_data = cr.findById(id.to!int);
                if(exsit_data !is null)
                    pm.created = exsit_data.created;
            }
            else
            {
                 pm.created = now;
            }
            
            pm.updated = now;

            cr.save(pm);
            return new RedirectResponse(request, "/admincp/article/categories");
        }

        Response response = new Response(request);
        response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
        response.setContent(view.render("article/category/add"));
        return response;
    }

    @Action string edit(int id)
    {   
        auto category = new CategoryRepository;
        view.assign("category", category.find(id));
        return view.render("article/category/edit");       
    } 

    @Action Response del(int id)
    {
        CategoryRepository cr = new CategoryRepository;
        auto exsit_data = cr.findById(id);      
        exsit_data.status = 0; 
        cr.save(exsit_data);

        return new RedirectResponse(request, "/admincp/article/categories");
    } 
}
