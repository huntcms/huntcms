module app.system.helper.Utils;
import std.digest.sha;

import std.json;
import entity.domain;

import kiss.util.serialize;

static JSONValue pageToJson(T)(Page!T pageObj)
{
	JSONValue page;
	int cur = pageObj.getNumber();
	page["cur"] = cur;
	page["total"] = pageObj.getTotalElements();
	page["totalPages"] = pageObj.getTotalPages() -1;
	page["size"] = pageObj.getSize();
	page["prev"] = cur - 1;
	page["next"] = cur + 1;
	JSONValue[] data;
	foreach(p ; pageObj.getContent())
	{
		data ~= toJSON(p);
		
	}
	page["data"] = JSONValue(data);
	return page;
}

class Utils
{
public:
    static string fileExt(string filename)
    {
        import std.string;

        auto sections = split(filename, '.');
        if (sections.length > 1)
            return sections[$ - 1];
        return string.init;
    }
}
