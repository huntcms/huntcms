module app.component.system.helper.SettingObject;

struct SettingItem
{
    string key;
}

class SettingObject
{
    @SettingItem("site_keyworkds")
    string siteName = "HuntCMS";

    @SettingItem("site_url")
    string siteUrl = "http://localhost/";

    @SettingItem("site_keyworkds")
    string siteKeywords = "Hunt, HuntCMS, Hunt Framework";

    @SettingItem("site_keyworkds")
    string siteDescription = "A huntcms based website.";

    // @SettingItem("site_status")
    // bool siteStatus = true;
}
