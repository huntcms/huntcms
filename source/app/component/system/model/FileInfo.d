module app.component.system.model.FileInfo;

import hunt.entity;
import app.component.system.model.User;

@Table("system_file_info")
class FileInfo : Model 
{
    mixin MakeModel;

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
