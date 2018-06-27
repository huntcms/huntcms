module app.system.model.Permission;

import entity;

@Table("system_permission")
class Permission 
{
    mixin MakeEntity;

    @PrimaryKey
    string id;

    string title;

    @Column("is_action")
    short isAction;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
