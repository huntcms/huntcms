module app.components.controller.admin.CategoryController;

import hunt;
import app.components.repository.CategoryRepository;
import app.components.model.Category;
import kiss.datetime;


class CategoryController : Controller
{
    mixin MakeController;

    @Action string list()
    {      
       auto repository = new CategoryRepository;
       auto alldata = repository.findAll();
       logDebug("categories : ", toJSON(alldata).toString);
       view.assign("categories", alldata); 
       return view.render("components/category/list");
    }

    @Action Response add()
    {
        if(request.method() == HttpMethod.Post)
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
            return new RedirectResponse("/admincp/components/categories");
        }
        return request.createResponse().setContent(view.render("components/category/add"));
    }

    @Action string edit(int id)
    {   
        auto category = new CategoryRepository;
        view.assign("category", category.find(id));
        return view.render("components/category/edit");       
    } 

    @Action Response del(int id)
    {
        (new CategoryRepository).removeById(id);
        return new RedirectResponse("/admincp/components/categories");
    } 
}
