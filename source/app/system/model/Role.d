module app.system.model.Role;

import entity;

@Table("system_role")
class Role
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    // @OneToMany("role")
    // UserRole[] userRoles;

    string name;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
