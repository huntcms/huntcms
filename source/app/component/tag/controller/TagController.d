module app.component.tag.controller.admin.TagController;

import hunt.framework;
import app.component.tag.repository.TagRepository;
import app.component.tag.model.Tag;
import app.lib.controller.AdminBaseController;
import app.component.tag.helper.Utils;


class TagController : AdminBaseController
{
    mixin MakeController;
    @Action string list()
    {
        uint page = request.get!uint("page" , 0);
        auto repository = new TagRepository();
        auto alldata = pageToJson!Tag(repository.findAll(new Pageable(page , 20)));
        logDebug("tags : ", alldata);
        view.assign("tags", alldata);

        return view.render("tag/tag/list");
    }

    @Action Response add()
    {
        if (request.method() == HttpMethod.Post)
        {
            int now = cast(int) time();
            auto tr = new TagRepository;
            Tag tag = new Tag;
            tag.name = request.post("name");

            auto id = request.post("id");
            if(id.length != 0)
            {
                tag.id = id.to!int;
                auto exsit_data = tr.findById(id.to!int);
                if(exsit_data !is null)
                    tag.created = exsit_data.created;
            }
            else
                tag.created = now;
                tag.updated = now;

            auto saveRes = tr.save(tag);
            if (saveRes !is null)
                return new RedirectResponse("/admincp/tag/tags");
        }
        auto repository = new TagRepository;
         
        return request.createResponse().setContent(view.render("tag/tag/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new TagRepository;
        view.assign("tag", repository.find(id));

        return view.render("tag/tag/edit");
    }

    @Action Response del(int id)
    {
        (new TagRepository).removeById(id);
        return new RedirectResponse("/admincp/tag/tags");
    }
}