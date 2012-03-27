//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_SuperSport {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_SuperSport_Base.open_super_sport, _arg1.SuperSport.open_super_sport);
            _arg1.registerDataCallback(Mod_SuperSport_Base.get_challenge_list, _arg1.SuperSport.get_challenge_list);
            _arg1.registerDataCallback(Mod_SuperSport_Base.start_challenge, _arg1.SuperSport.start_challenge);
            _arg1.registerDataCallback(Mod_SuperSport_Base.clear_cd_time, _arg1.SuperSport.clear_cd_time);
            _arg1.registerDataCallback(Mod_SuperSport_Base.buy_challenge_times, _arg1.SuperSport.buy_challenge_times);
            _arg1.registerDataCallback(Mod_SuperSport_Base.notify_new_sport_war_report, _arg1.SuperSport.notify_new_sport_war_report);
            _arg1.registerDataCallback(Mod_SuperSport_Base.notify, _arg1.SuperSport.notify);
            _arg1.registerDataCallback(Mod_SuperSport_Base.close_super_sport, _arg1.SuperSport.close_super_sport);
            _arg1.registerDataCallback(Mod_SuperSport_Base.get_player_war_report, _arg1.SuperSport.get_player_war_report);
            _arg1.registerDataCallback(Mod_SuperSport_Base.get_ranking_top, _arg1.SuperSport.get_ranking_top);
            _arg1.registerDataCallback(Mod_SuperSport_Base.notify_update_win_top, _arg1.SuperSport.notify_update_win_top);
            _arg1.registerDataCallback(Mod_SuperSport_Base.notify_global, _arg1.SuperSport.notify_global);
        }

    }
}//package com.protocols 
