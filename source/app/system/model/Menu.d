module app.system.model.Menu;

import entity;

@Table("system_menu")
class Menu
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    @Column("is_action")
    short isAction;

    // mca is Module + Controller + Action
    // example: system.user.add
    string mca;

    @Column("link_url")
    string linkUrl;

    // timestamp
    string created;

    // timestamp
    string updated;

    // 1: enabled, 0: disabled
    short status;
}
