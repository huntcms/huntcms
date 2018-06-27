module app.system.model.FileInfo;

import entity;
import app.system.model.User;

@Table("system_file_info")
class FileInfo
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    @ManyToOne()
    @JoinColumn("user_id")
    User user;

    string filename;

    string rename;

    string sha1;

    string type;

    long size;

    // timestamp
    int created;

    // timestamp
    int updated;

}
