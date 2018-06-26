module app.system.model.User;

import entity;

public import app.system.model.Role;

@Table("system_user")
class User
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    string email;

    string password;

    string salt;

    // @Column("post_title")
    string name;

    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;

    short supered;
}
