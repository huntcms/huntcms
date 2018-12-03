module app.component.system.controller.admin.FileController;

import hunt.framework;
import app.component.system.model.FileInfo;
import app.component.system.repository.FileInfoRepository;
import std.json;
import std.digest.sha;
import std.file;
import hunt.util.configuration;
import hunt.datetime;
import app.component.system.helper.Utils;

import app.component.system.repository.UserRepository;
import hunt.entity.DefaultEntityManagerFactory;
import app.lib.yun.YunUpLoad;

import hunt.http.codec.http.model.MultipartFormInputStream;
import std.format;
import hunt.string;

class FileController : Controller
{
    mixin MakeController;

    @Action JSONValue upload() {
        JSONValue res;
        res["error_code"] = 0;

        try {
            auto allFiles = request.allFiles();
            logInfo(allFiles);
            if(allFiles){
                foreach(file; allFiles){
                    MultipartFormInputStream.MultiPart mp = cast(MultipartFormInputStream.MultiPart) file;
                    auto fDir = mp.getFile();
                    if(mp.getName() == "file"){
                        auto file_data = cast(const(ubyte)[]) read(fDir);
                        auto filesize = mp.getSize();
                        auto now = time();
                        FileInfo fi = new FileInfo;
                        fi.filename = mp.getSubmittedFileName();
                        fi.rename = "";
                        fi.size = filesize;
                        fi.type = mp.getContentType();
                        fi.sha1 = toHexString(sha1Of(cast(ubyte[]) file_data));
                        fi.created = now;
                        fi.updated = now;

                        auto userInfo = Application.getInstance().accessManager.user;
                
                        if(userInfo is null) {
                            res["error_code"] = 30001;
                            res["error_msg"] = "please login!";
                            return res;
                        }

                        fi.user = (new UserRepository).find(userInfo.id);
                        auto fir = new FileInfoRepository();
                        if (fir.save(fi) is null) {
                            res["error_code"] = 10001;
                        }
                        ConfigBuilder con = Config.config("hunt");
                        auto saveName = fi.sha1 ~ "." ~ Utils.fileExt(mp.getSubmittedFileName());
                        auto upload = new YunUpLoad("1004", "http://upload.putaocloud.com", "0d87e77f509a419285db58f985836901", "2fa77ec72e6a4c338515bfef98b97c42");
                        auto json = parseJSON(upload.doUpload(cast(byte[])file_data , cast(string) saveName));
                        res["filename"] = saveName;
                        res["picurl"] = json["url"].str;
                    }
                    if(fDir) fDir.remove;
                }

            }else{
                logError(" upload file error ");
            }
        } catch (Exception e) {
             res["error_code"] = 10002;
             res["error_msg"] = e.msg;
        }

        return res;
    }
}
