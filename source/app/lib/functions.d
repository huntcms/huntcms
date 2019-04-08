module app.lib.functions;
import hunt.util.DateTime;
import std.conv;
import std.format;

string client_ip()
{
    import hunt.framework.http.Request;
    import std.array;
    if(request().headerExists("X-Forwarded-For"))
    {
        string ips = request().header("X-Forwarded-For");
        auto arr = ips.split(",");
        if(arr.length >= 0)
            return arr[0];
    }
    return request().clientAddress().toAddrString();
}
