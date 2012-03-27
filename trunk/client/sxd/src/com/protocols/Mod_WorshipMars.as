//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_WorshipMars {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_WorshipMars_Base.mars_info, _arg1.worshipMars.mars_info);
            _arg1.registerDataCallback(Mod_WorshipMars_Base.incense, _arg1.worshipMars.incense);
            _arg1.registerDataCallback(Mod_WorshipMars_Base.get_blessing_times_and_exp_add, _arg1.worshipMars.get_blessing_times_and_exp_add);
            _arg1.registerDataCallback(Mod_WorshipMars_Base.blessing_times_and_exp_add_notify, _arg1.worshipMars.blessing_times_and_exp_add_notify);
            _arg1.registerDataCallback(Mod_WorshipMars_Base.get_remain_incense_times, _arg1.worshipMars.get_remain_incense_times);
        }

    }
}//package com.protocols 
