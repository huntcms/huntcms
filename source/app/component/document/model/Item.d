module app.component.document.model.Item;

import hunt.entity;
// import app.component.document.model.Node;

@Table("document_item")
class Item : Model 
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    int node_id;

    int language_id;

    string title;

    string content;
    
    string content_html;

    short status;

    int created;

    int updated;

    // @JoinColumn("node_id")
    // Node node;
}
