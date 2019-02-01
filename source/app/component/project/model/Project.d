module app.component.project.model.Project;

import hunt.entity;

@Table("project")
class Project : Model 
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    int id;

    string title;

    string sign;

    string logo_url;

    int main_language;

    string introduction;

    string detail;
    
    string detail_html;

    string git_url;

    string last_version;

    string release_date;

    string forum_url;

    int sort;

    short status;

    int created;

    int updated;
}
