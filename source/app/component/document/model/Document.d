module app.component.document.model.Document;

import hunt.entity;
import app.component.project.model.ProjectMini;

@Table("document")
class Document : Model 
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

    @JoinColumn("project_id")
    ProjectMini project;

}
