//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_GetPeach {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_GetPeach_Base.get_peach, _arg1.getPeach.get_peach);
            _arg1.registerDataCallback(Mod_GetPeach_Base.buy_monkeys, _arg1.getPeach.buy_monkeys);
            _arg1.registerDataCallback(Mod_GetPeach_Base.peach_info, _arg1.getPeach.peach_info);
            _arg1.registerDataCallback(Mod_GetPeach_Base.player_info, _arg1.getPeach.player_info);
        }

    }
}//package com.protocols 
