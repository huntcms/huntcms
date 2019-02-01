module app.component.document.model.ItemMini;

import hunt.entity;
import app.component.document.model.Node;

@Table("document_item")
class ItemMini : Model 
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    int node_id;

    int language_id;

    string title;

    int updated;

    // @ManyToOne()
    // @JoinColumn("node_id", "id")
    // Node node;

}
