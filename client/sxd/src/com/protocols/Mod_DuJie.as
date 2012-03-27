//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_DuJie {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Dujie_Base.dujie_info, _arg1.dujie.dujie_info);
            _arg1.registerDataCallback(Mod_Dujie_Base.add_player_role_state_point, _arg1.dujie.add_player_role_state_point);
            _arg1.registerDataCallback(Mod_Dujie_Base.role_list, _arg1.dujie.role_list);
            _arg1.registerDataCallback(Mod_Dujie_Base.go_dujie, _arg1.dujie.go_dujie);
        }

    }
}//package com.protocols 
