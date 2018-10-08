module app.component.system.model.Setting;

import hunt.entity;

@Table("system_setting")
class Setting
{
    mixin MakeEntity;

    // exmple: site_name
    @PrimaryKey
    string key;

    // example: Site name
    string name;

    // example: The website title
    string description;

    // example: input
    short type;

    // example: My Site
    string value;

    // have selection values
    string options;

    // 1: enabled, 0: disabled
    short status;
}
