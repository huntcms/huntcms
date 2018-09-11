module app.component.system.model.Tag;

import hunt.entity;

@Table("tags")
class Tag
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    string name;

    int sort;
    
    // timestamp
    int created;

    // timestamp
    int updated;

    // 1: enabled, 0: disabled
    short status;
}
