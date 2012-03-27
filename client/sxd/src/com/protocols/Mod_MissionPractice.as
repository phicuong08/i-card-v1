//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_MissionPractice {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_MissionPractice_Base.get_practice_info, _arg1.missionPractice.get_practice_info);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.start_practice, _arg1.missionPractice.start_practice);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.cancel_practice, _arg1.missionPractice.cancel_practice);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.quickly, _arg1.missionPractice.quickly);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.notify, _arg1.missionPractice.notify);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.get_continue_practice_info, _arg1.missionPractice.get_continue_practice_info);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.continue_practice, _arg1.missionPractice.continue_practice);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.set_auto_sale_item, _arg1.missionPractice.set_auto_sale_item);
            _arg1.registerDataCallback(Mod_MissionPractice_Base.cancel_auto_sale_item, _arg1.missionPractice.cancel_auto_sale_item);
        }

    }
}//package com.protocols 
