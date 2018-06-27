module app.system.model.LogInfo;

import entity;
import app.system.model.User;

@Table("system_log_info")
class LogInfo
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    @ManyToOne()
    @JoinColumn("user_id")
    User user;

    string action;

    string params;

    string type;

    // timestamp
    int time;

}
