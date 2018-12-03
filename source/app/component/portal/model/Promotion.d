module app.component.portal.model.Promotion;

import hunt.entity;

@Table("portal_promotion")
class Promotion : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string title;

    string subtitle;

    string link_url;

    string type;

    string modules;

    string keyword;

    int sort;

    int updated;

    int created;

    int status;
}