module app.component.document.model.DocBase;

import hunt.entity;

@Table("document")
class DocBase : Model 
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    int project_id;

    string doc_version;
    
    int main_language;
    
    short currect;

    int sort;

    short status;

    int created;

    int updated;

}
