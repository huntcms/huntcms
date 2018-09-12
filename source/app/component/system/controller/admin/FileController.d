module app.component.system.controller.admin.FileController;

import hunt.framework;
import app.component.system.model.FileInfo;
import app.component.system.repository.FileInfoRepository;
import std.json;
import std.digest.sha;
import std.file;
import kiss.util.configuration;
import kiss.datetime;
import app.component.system.helper.Utils;
import app.auth.UserAuth;

import app.component.system.repository.UserRepository;
import hunt.entity.DefaultEntityManagerFactory;

class FileController : Controller
{
    mixin MakeController;

    @Action JSONValue upload()
    {
        JSONValue res;
        res["error_code"] = 0;

        try
        {
            auto f = request.postForm.getFileValue("imageFile");
            logDebug("filename : ", f.fileName);
            if (f)
            {
                ubyte[] file_data;
                auto filesize = f.fileSize;
                f.read(filesize, (const(ubyte[]) data) { file_data ~= data; });
                //logDebug("file content :  ",cast(string)file_data);
                auto now = time();
                FileInfo fi = new FileInfo;
                fi.filename = f.fileName;
                fi.rename = request.post("rename", "");
                fi.size = f.fileSize();
                fi.type = f.contentType;
                fi.sha1 = toHexString(sha1Of(file_data));
                fi.created = now;
                fi.updated = now;

                auto manager = defaultEntityManagerFactory().createEntityManager();

                auto userRepository = new UserRepository(manager);

                auto user = UserAuth.get(request);
                if(user is null)
                {
                    res["error_code"] = 30001;
                    res["error_msg"] = "please login!";
                    return res;
                }
                logDebug("id : ", user.id, "  email : ", user.name);
                fi.user = userRepository.findByEmail(user.name);

                auto fir = new FileInfoRepository();
                if (fir.save(fi) is null)
                {
                    res["error_code"] = 10001;
                }
                ConfigBuilder con = Config.config("hunt");
                auto saveName = fi.sha1 ~ "." ~ Utils.fileExt(fi.filename);
                std.file.write(con.file.path.value ~ saveName, file_data);
                res["filename"] = saveName;
            }
            else
            {
                logError(" upload file error ");
            }
        }
        catch (Exception e)
        {
             res["error_code"] = 10002;
             res["error_msg"] = e.msg;
        }

        return res;
    }
}
