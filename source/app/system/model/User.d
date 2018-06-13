module app.system.model.User;

import entity;

public import app.system.model.Role;

@Table("system_user")
class User : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int id;

    // int role_id;
    @ManyToOne()
    @JoinColumn("role_id")
    Role role;

    string email;

    string password;

    string salt;

    // @Column("post_title")
    string name;

    // timestamp
    string created;

    // timestamp
    string updated;

    // 1: enabled, 0: disabled
    short status;
}
