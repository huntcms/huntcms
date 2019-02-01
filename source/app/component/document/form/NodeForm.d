module app.component.document.form.NodeForm;

import hunt.framework;

class NodeForm : Form {

	mixin MakeForm;

	@Range(1, 2147483647)
    int document_id;

	@Range(1, 2147483647)
    int language_id;

	@Range(1, 2147483647)
    int parent_id;

	@Length(0, 100)
    string sign_key;

	@Range(0, 2)
    short is_node;

	@Range(1, 2147483647)
    int sort;

	@Range(0, 2)
    short status;

	@Length(0, 100)
    string title;

    // string content;
    
}
