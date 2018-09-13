module app.component.system.model.Permission;

import hunt.entity;

@Table("system_permission")
class Permission 
{
    mixin MakeEntity;

    @PrimaryKey
    int id;

    string title;

    string mca;

    @Column("is_action")
    short isAction;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
