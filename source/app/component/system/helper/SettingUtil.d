//module app.component.system.helper.SettingUtil;
//
//import app.component.system.helper.SettingObject;
//import app.component.system.repository.SettingRepository;
//import app.component.system.model.Setting;
//import std.traits;
//class SettingUtil
//{
//    T settingInit(T)(Setting[string] settings)
//    {
//        auto so = new T;
//
//        //mixin (generateItemsCode!T);
//
//        return so;
//    }
//
//    string generateItemsCode(T)()
//    {
//        string code = "Setting s;";
//
//        static foreach (t; __traits(derivedMembers, T))
//        {
//            static if (hasUDA!(t, SettingItem))
//            {
//                string key = getUDAs!(t, SettingItem)[0].key;
//                code ~= "s" ~ t ~ " = settings.get(" ~ key ~ ", "");\n";
//                code ~= "if (s !is null) so." ~ t ~ " = s.value;\n";
//            }
//        }
//
//        return code;
//    }
//}
//
//SettingObject setting(bool force = false)
//{
//    auto settingUtil = new SettingUtil;
//    if (_huntcmsSetting is null || force)
//    {
//        Setting[string] settings;
//        foreach (s; (new SettingRepository).findAll())
//        {
//            settings[s.key] = s;
//        }
//        _huntcmsSetting = settingUtil.settingInit!SettingObject(settings);
//    }
//
//    return _huntcmsSetting;
//}
//
//private SettingUtil _huntcmsSetting;
