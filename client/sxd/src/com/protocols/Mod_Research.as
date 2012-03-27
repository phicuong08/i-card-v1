//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Research {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Research_Base.research_list, _arg1.research.research_list);
            _arg1.registerDataCallback(Mod_Research_Base.research_upgrade, _arg1.research.research_upgrade);
            _arg1.registerDataCallback(Mod_Research_Base.clear_cd_time_show, _arg1.research.clear_cd_time_show);
            _arg1.registerDataCallback(Mod_Research_Base.clear_cd_time, _arg1.research.clear_cd_time);
            _arg1.registerDataCallback(Mod_Research_Base.research_add_list, _arg1.research.research_add_list);
        }

    }
}//package com.protocols 
