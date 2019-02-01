module app.component.document.model.Node;

import hunt.entity;
// import app.component.document.model.ItemMini;

@Table("document_node")
class Node : Model 
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    int document_id;

    int language_id;

    int parent_id;

    string sign_key;

    short is_node;

    int sort;

    short status;

    int created;

    int updated;

    // @OneToMany("node")
    // ItemMini[] itemMini;
}
