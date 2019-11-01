module app.component.article.validation.ArticleForm;

import hunt.framework;

class ArticleForm : Form {

	mixin MakeForm;

	@Range(1, 2147483646)
	int category;

	@Length(1, 255, "请输入标题! ")
	string title;

	@Length(1, 255, "请输入简介! ")
	string summary;

	@Length(0, 50, "作者不能超过{{ max }}个字! ")
	string author;

	@Length(0, 255, "图片地址不正确! ")
    string imageFile;

	@Length(0, 255, "视频地址不正确! ")
    string video;

    @Range(0, 1, "请选择状态! ")
    short customRadio;

}