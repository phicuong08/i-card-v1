//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Partners {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Partners_Base.partners_list, _arg1.partners.partners_list);
            _arg1.registerDataCallback(Mod_Partners_Base.partners_invite, _arg1.partners.partners_invite);
            _arg1.registerDataCallback(Mod_Partners_Base.now_and_next_Recommend_role_list, _arg1.partners.now_and_next_Recommend_role_list);
        }

    }
}//package com.protocols 
