module app.system.model.UserRole;

import entity;

public import app.system.model.User;

@Table("system_user_role")
class UserRole 
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    // int role_id;
    // @ManyToOne()
    // @JoinColumn("role_id")
    // Role role;

    @ManyToOne()
    @JoinColumn("user_id")
    User user;

    // int user_id;

    int role_id;
}
