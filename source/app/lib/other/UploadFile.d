module app.other.UploadFile;

import std.json;
import std.digest.sha;
import std.file;
import std.net.curl;

import kiss.util.configuration;
import kiss.datetime;

import collie.codec.http.server.httpform;

import app.component.system.repository.FileInfoRepository;
import app.component.system.model.FileInfo;
import app.auth.UserAuth;

string uploadToCloud()
{
    //ubyte[] file_data;
    //auto filesize = f.fileSize;
    //f.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
    ////logDebug("file content :  ",cast(string)file_data);
    //auto now = time();
    //ConfigBuilder config = Config.config("hunt");
    //
    //
    //upload("/tmp/downloaded-ftp-file", "ftp.digitalmars.com/sieve.ds");
    //
    //FileInfo fi = new FileInfo;
    //fi.filename = f.fileName;
    //fi.rename = request.post("rename", "");
    //fi.size = f.fileSize();
    //fi.type = f.contentType;
    //fi.sha1 = toHexString(sha1Of(file_data));
    //fi.url = config.file.cloud.read ~ fi.sha1;
    //fi.created = now;
    //fi.updated = now;
    //fi.user_id = UserAuth.userId();
    //
    //auto fir = new FileInfoRepository();
    //if (fir.save(fi) is null)
    //{
    //    res["error_code"] = 10001;
    //}
    //auto http = HTTP(url);
    //auto saveName = fi.sha1 ~ "." ~ Utils.fileExt(fi.filename);
    //std.file.write(con.file.path.value ~ saveName, file_data);
    //return saveName;
    return "test";
}
