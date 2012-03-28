//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_CampWar {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_CampWar_Base.get_camp_open_time, _arg1.campWar.get_camp_open_time);
            _arg1.registerDataCallback(Mod_CampWar_Base.open_camp_war, _arg1.campWar.open_camp_war);
            _arg1.registerDataCallback(Mod_CampWar_Base.close_camp_war, _arg1.campWar.close_camp_war);
            _arg1.registerDataCallback(Mod_CampWar_Base.get_camp_player, _arg1.campWar.get_camp_player);
            _arg1.registerDataCallback(Mod_CampWar_Base.join_camp_war, _arg1.campWar.join_camp_war);
            _arg1.registerDataCallback(Mod_CampWar_Base.exit_camp_war, _arg1.campWar.exit_camp_war);
            _arg1.registerDataCallback(Mod_CampWar_Base.get_war_result, _arg1.campWar.get_war_result);
            _arg1.registerDataCallback(Mod_CampWar_Base.notify, _arg1.campWar.notify);
            _arg1.registerDataCallback(Mod_CampWar_Base.notify_report, _arg1.campWar.notify_report);
            _arg1.registerDataCallback(Mod_CampWar_Base.finish_war, _arg1.campWar.finish_war);
            _arg1.registerDataCallback(Mod_CampWar_Base.buy_buff, _arg1.campWar.buy_buff);
            _arg1.registerDataCallback(Mod_CampWar_Base.get_buff, _arg1.campWar.get_buff);
            _arg1.registerDataCallback(Mod_CampWar_Base.set_robot, _arg1.campWar.set_robot);
            _arg1.registerDataCallback(Mod_CampWar_Base.get_robot_status, _arg1.campWar.get_robot_status);
        }

    }
}//package com.protocols 
