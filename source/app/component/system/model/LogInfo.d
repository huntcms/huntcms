module app.component.system.model.LogInfo;

import hunt.entity;
import app.component.system.model.User;

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
