module app.component.project.form.ProjectForm;

import hunt.framework;

class ProjectForm : Form {

	mixin MakeForm;

	@Length(1, 100, "Length of title must be between {{ min }} and {{ max }} !")
    string title;
	
	@Length(1, 50, "Length of sign must be between {{ min }} and {{ max }} !")
    string sign;

	@Length(1, 255, "Length of logo_url must be between {{ min }} and {{ max }} !")
    string logo_url;

	@Range(1, 9999)
	int main_language;

	@Length(1, 512, "Length of introduction must be between {{ min }} and {{ max }} !")
    string introduction;

	@Length(1, 65535, "Length of detail must be between {{ min }} and {{ max }} !")
    string detail;
	
	@Pattern(`((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?`, "Git_url must begin with http/https/ftp/ftps")
    string git_url;

	@Length(1, 50, "Length of last_version must be between {{ min }} and {{ max }} !")
    string last_version;

	@Pattern("(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)", "Release_date is a wrong day")
    string release_date;

	@Pattern(`((http|ftp|https)://)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\&%_\./-~-]*)?`, "Forum_url must begin with http/https/ftp/ftps")
    string forum_url;

	@Range(1, 2147483646)
	int sort;

	@Range(0, 2)
	short status;

}