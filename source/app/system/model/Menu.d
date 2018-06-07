module app.system.model.Menu;

import entity;

@Table("system_menu")
class Menu : Entity
{
    mixin GetFunction;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    string permission_key;

    // timestamp
    string created;

    // timestamp
    string updated;

    // 1: enabled, 0: disabled
    short status;
}
