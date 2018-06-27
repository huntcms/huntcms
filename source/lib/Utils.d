module lib.Utils;
import std.digest.sha;

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
