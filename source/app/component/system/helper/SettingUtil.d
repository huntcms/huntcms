module app.component.system.helper.SettingUtil;

import hunt.framework.application.Application;
import app.component.system.repository.SettingRepository;
import app.component.system.model.Setting;
import std.traits;
import hunt.cache;
import hunt.entity.DefaultEntityManagerFactory;

class SettingUtil
{
    T settingInit(T)(Setting[string] settings)
    {
        auto so = new T;
        mixin (generateItemsCode!T);
        //pragma(msg, generateItemsCode!T);
        return so;
    }

    static string generateItemsCode(T)()
    {
        string code = "Setting s;";

        string key;
        static foreach (t; __traits(derivedMembers, T))
        {
            static if (hasUDA!(__traits(getMember, T, t), SettingItem))
            {
                key = getUDAs!(__traits(getMember, T, t), SettingItem)[0].key;
                code ~= "s = settings.get(\"" ~ key ~ "\", null);\n";
                code ~= "if (s !is null) so." ~ t ~ " = s.value;\n";
            }
        }

        return code;
    }
}

SettingObject setting(bool force = false)
{
    auto settingUtil = new SettingUtil;
    string cacheKey = "huntcmsSetting";
    _huntcmsSetting = Application.getInstance().cache().get!SettingObject(cacheKey);
    if (_huntcmsSetting is null || force)
    {
        Setting[string] settings;
        EntityManager manager = defaultEntityManagerFactory().createEntityManager();
        foreach (s; (new SettingRepository(manager)).findAll())
        {
            settings[s.key] = s;
        }
        manager.close();
        _huntcmsSetting = settingUtil.settingInit!SettingObject(settings);
        Application.getInstance().cache().set(cacheKey, _huntcmsSetting);
    }

    return _huntcmsSetting;
}

private SettingObject _huntcmsSetting;
