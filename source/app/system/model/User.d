module app.system.model.User;

import entity;

public import app.system.model.UserRole;

@Table("system_user")
class User
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

//    int role_id;
//    @OneToMany("user")
//    UserRole[] userRoles;

    string email;

    string password;

    string salt;

    // @Column("post_title")
    string name;

    string avatar;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;

    short supered;
}
