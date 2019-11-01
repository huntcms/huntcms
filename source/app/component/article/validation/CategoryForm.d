module app.component.article.validation.CategoryForm;

import hunt.framework;

class CategoryForm : Form {

	mixin MakeForm;

	@Length(1, 255, "请输入标题! ")
	string name;

	@Range(0, 2147483646, "请输入排序值! ")
	int sort;

    @Range(0, 1, "请选择状态! ")
    short statusRadio;

}