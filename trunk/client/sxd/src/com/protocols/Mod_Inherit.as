//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Inherit {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Inherit_Base.role_list, _arg1.inherit.role_list);
            _arg1.registerDataCallback(Mod_Inherit_Base.role_attribute, _arg1.inherit.role_attribute);
            _arg1.registerDataCallback(Mod_Inherit_Base.attribute_after_inherit, _arg1.inherit.attribute_after_inherit);
            _arg1.registerDataCallback(Mod_Inherit_Base.inherit, _arg1.inherit.inherit);
        }

    }
}//package com.protocols 
