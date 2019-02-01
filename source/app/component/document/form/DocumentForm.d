module app.component.document.form.DocumentForm;

import hunt.framework;

class DocumentForm : Form {

	mixin MakeForm;

	@Range(0, 2147483646)
    int project_id;

	@Length(1, 50, "Length of doc_version must be between {{ min }} and {{ max }} !")
    string doc_version;
    
	@Range(0, 2147483646)
    int main_language;

	@Range(0, 2147483646)
    int sort;

	@Range(0, 2)
    short status;

}
