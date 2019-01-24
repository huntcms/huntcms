module app.component.tag.controller.admin.TagController;

import hunt.framework;
import app.component.tag.repository.TagRepository;
import app.component.tag.model.Tag;
import app.lib.controller.AdminBaseController;
import app.component.tag.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;

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
        if (request.methodAsString() == HttpMethod.POST.asString())
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
                return new RedirectResponse(request, "/admincp/tag/tags");
        }
        auto repository = new TagRepository;

        Response response = new Response(request);
		response.setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString());
		response.setContent(view.render("tag/tag/add"));
		return response;
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
        return new RedirectResponse(request, "/admincp/tag/tags");
    }
}