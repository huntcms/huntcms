module app.component.portal.model.Menu;

import hunt.entity;

@Table("portal_menu")
class Menu : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    int pid;

    string name;

    @Column("is_action")
    short isAction;

    // mca is Module + Controller + Action
    // example: system.user.add
    string mca;

    @Column("link_url")
    string linkUrl;

    @Column("icon_class")
    string iconClass;

    string picture;
    
    int sort;
    
    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
