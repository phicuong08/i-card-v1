//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Vip {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Vip_Base.get_player_vip_info, _arg1.vip.get_player_vip_info);
        }

    }
}//package com.protocols 
