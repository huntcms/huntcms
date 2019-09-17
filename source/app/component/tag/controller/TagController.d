module app.component.tag.controller.admin.TagController;

import hunt.framework;
import app.component.tag.repository.TagRepository;
import app.component.tag.model.Tag;
import app.lib.controller.AdminBaseController;
import app.lib.functions;
import app.component.tag.helper.Utils;
import hunt.http.codec.http.model.HttpMethod;

class TagController : AdminBaseController
{
    mixin MakeController;


    @Action Response list(int perPage, int page = 1)
    {
        perPage = perPage < 1 ? 1 : perPage;
        auto alldata = new TagRepository(_cManager).findByTag(page-1, perPage);

        view.assign("tags", alldata.getContent());
        view.assign("pageModel",  alldata.getModel());
        view.assign("pageQuery", buildQueryString(request.input()));
        return new Response(request)
        .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
        .setContent(view.render("tag/tag/list"));
    }

    @Action Response add()
    {
        if (request.methodAsString() == HttpMethod.POST.asString())
        {
            int now = cast(int) time();
            auto tr = new TagRepository(_cManager);
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
        auto repository = new TagRepository(_cManager);

        string lang = findLocal();
        return new Response(request)
            .setHeader(HttpHeader.CONTENT_TYPE, MimeType.TEXT_HTML_UTF_8.asString())
            .setContent(view.setLocale(lang).render("tag/tag/add"));
    }

    @Action string edit(int id)
    {
        logDebug(" edit id : ", id, "  get id : ", request.get("id"));
        auto repository = new TagRepository(_cManager);
        view.assign("tag", repository.find(id));

        string lang = findLocal();
        return view.setLocale(lang).render("tag/tag/edit");
    }

    @Action Response del(int id)
    {
        (new TagRepository(_cManager)).removeById(id);
        return new RedirectResponse(request, "/admincp/tag/tags");
    }
}