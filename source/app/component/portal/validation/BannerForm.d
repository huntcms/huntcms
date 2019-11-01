module app.component.portal.validation.BannerForm;

import hunt.framework;

class BannerForm : Form {

	mixin MakeForm;

	@Length(1, 255, "请输入标题! ")
	string title;

	@Length(1, 255, "请输入子标题! ")
	string subtitle;

	@Range(0, 2147483646, "请输入排序值! ")
	int sort;

    @Range(0, 1, "请选择状态! ")
    short statusRadio;

	@Length(1, 255)
	string url;

	@Length(1, 255, "请输入关键词! ")
	string keyword;

	@Length(1, 255)
	string picurl;

	@Range(0, 2147483646)
    short pid;

	@Length(1, 255)
	string group;

}
