module app.component.portal.model.Banner;

import hunt.entity;

@Table("portal_banner")
class Banner
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    string title;

    string subtitle;

    string picurl;

    string url;

    int sort;

    int pid;
    
    // timestamp
    int created;

    // timestamp
    int updated;

    //timestamp
    int deleted;

    // 1: enabled, 0: disabled
    short status;

    string group;

    string keyword;
}
