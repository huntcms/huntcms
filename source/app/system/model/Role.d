module app.system.model.Role;

import entity;

@Table("hc_system_role")
class Role : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    // timestamp
    string created;

    // timestamp
    string updated;

    // 1: enabled, 0: disabled
    short status;
}
