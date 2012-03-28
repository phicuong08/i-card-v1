//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Tower {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Tower_Base.get_tower_info, _arg1.tower.get_tower_info);
            _arg1.registerDataCallback(Mod_Tower_Base.start_challenge, _arg1.tower.start_challenge);
            _arg1.registerDataCallback(Mod_Tower_Base.reset_layer, _arg1.tower.reset_layer);
            _arg1.registerDataCallback(Mod_Tower_Base.start_auto_challenge, _arg1.tower.start_auto_challenge);
            _arg1.registerDataCallback(Mod_Tower_Base.stop_auto_challenge, _arg1.tower.stop_auto_challenge);
            _arg1.registerDataCallback(Mod_Tower_Base.notify_auto_challenge_report, _arg1.tower.notify_auto_challenge_report);
            _arg1.registerDataCallback(Mod_Tower_Base.quickly_auto_challenge, _arg1.tower.quickly_auto_challenge);
        }

    }
}//package com.protocols 
