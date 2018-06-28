module app.system.helper.Utils;
import std.digest.sha;
import hunt;

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

public:
    static int[] getCheckbox(string[string] requestParams, string keyword)
    {
        int[] resultIds;

        foreach(key, value; requestParams)
        {
            if(indexOf(key, keyword) != -1)
            {
                resultIds ~= value.to!int();
            }
        }
        return resultIds;
    }

}
