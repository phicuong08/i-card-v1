//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Rune {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Rune_Base.rune_list, _arg1.rune.rune_list);
            _arg1.registerDataCallback(Mod_Rune_Base.rune_use, _arg1.rune.rune_use);
            _arg1.registerDataCallback(Mod_Rune_Base.batch_rune_list, _arg1.rune.batch_rune_list);
            _arg1.registerDataCallback(Mod_Rune_Base.batch_rune_use, _arg1.rune.batch_rune_use);
            _arg1.registerDataCallback(Mod_Rune_Base.auto_rune_info, _arg1.rune.auto_rune_info);
            _arg1.registerDataCallback(Mod_Rune_Base.set_auto_rune, _arg1.rune.set_auto_rune);
            _arg1.registerDataCallback(Mod_Rune_Base.rune_use_notify, _arg1.rune.rune_use_notify);
        }

    }
}//package com.protocols 
