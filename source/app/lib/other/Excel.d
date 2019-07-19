module app.lib.other.Excel;
import std.file;
import std.csv;
import std.algorithm;
import std.array;
import std.stdio;
import std.typecons;
import hunt.util.DateTime;
import hunt.util.Serialize;
import hunt.framework.util.Random;
import std.uni;
import std.digest.sha;
import std.traits;
import std.conv;
import std.algorithm.searching;
import hunt.logging;
import std.json;
import std.regex;

class Excel(T) if(isArray!(T))
{

    private T _data;
    private string[] _titles;
    private string[] _columnKeys;
    private string _filename;
    this(){}

    //设置列标题，titles长度必须与columns长度一致
    void setColumnTitles(string[] titles)
    {
        _titles = titles;
    }

    //设置要输出的数据
    void setData(T t)
    {
        _data = t;
    }

    //设置每一列data里输出哪些字段（按键名取）
    void setColumnDataField(string[] columnKeys)
    {
        _columnKeys = columnKeys;
    }

    void setFilename(string filename)
    {
        _filename = filename;
    }

    //浏览器下载
    ubyte[] download(string dataType = null)
    {

        string str;
        string salt = _filename == "" ? _filename : toLower(toHexString(getRandom(16)))[0 .. 8];
        int curtime = cast(int) time();
        bool isStringColumn = _columnKeys.length > 0 ? true : false;
        if(_titles.length != _columnKeys.length)
        {
            throw new Exception("title and column length not equal!");
        }
        string titles = join(_titles, ",");
        str ~= titles ~ "\n";
        JSONValue data;
        if(dataType == "JSONValue")
        {
            data = _data;
        }
        else
        {
            data = toJson(_data);
        }
        foreach(d; data.array)
        {
            string rowStr;
            auto columns =  _columnKeys;
            foreach(ck, column; columns)
            {
                if(ck > 0)
                {
                    rowStr ~= ",";
                }
                try{
                    // logInfo(column);
                    string c = d[column].type() == JSON_TYPE.integer ? d[column].integer.to!string : d[column].str;
                    rowStr ~= c;
                }catch(Exception e)
                {
                    logError(e);
                    throw new Exception("column is not found!");
                }
            }
            rowStr ~= "\n";
            str ~= rowStr;
        }
        return this.utf8ToGbk(str);
    }

    private ubyte[] utf8ToGbk(string str)
    {
        auto re = regex(r"[^\u4E00-\u9FA5\u3000-\u303F\uFF00-\uFFEF\u0000-\u007F\u201c-\u201d]","g");
        str = replaceAll(str, re, "??");
        import core.sys.posix.iconv;
        size_t inlen = str.length;
        size_t outln = inlen;
        iconv_t cd = iconv_open("gbk", "utf-8");
        ubyte[] outStr = new ubyte[inlen];
        char* inbuf = cast(char*)str.ptr;
        char* outbuf = cast(char*)outStr.ptr;
        iconv(cd, cast(char**)&inbuf, &inlen, cast(char**)&outbuf, &outln);
        iconv_close(cd);
        return outStr[0..($ - outln)];
    }
    //设置要输出的行数
    //void setRowNum(int rowNum)
    //{
    //
    //}
}