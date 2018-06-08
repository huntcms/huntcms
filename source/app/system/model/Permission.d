module app.system.model.Permission;

import entity;

@Table("hc_system_role")
class Permission : Entity
{
    mixin GetFunction;

    @PrimaryKey
    string key;

    string title;

    @Column("is_action")
    bool isAction;

    // timestamp
    string created;

    // timestamp
    string updated;

    // 1: enabled, 0: disabled
    short status;
}
