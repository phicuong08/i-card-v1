//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_HeroMission {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_HeroMission_Base.get_hero_mission_list, _arg1.heroMission.get_hero_mission_list);
            _arg1.registerDataCallback(Mod_HeroMission_Base.buy_hero_challenge, _arg1.heroMission.buy_hero_challenge);
            _arg1.registerDataCallback(Mod_HeroMission_Base.start_practice, _arg1.heroMission.start_practice);
            _arg1.registerDataCallback(Mod_HeroMission_Base.stop_practice, _arg1.heroMission.stop_practice);
            _arg1.registerDataCallback(Mod_HeroMission_Base.notify, _arg1.heroMission.notify);
            _arg1.registerDataCallback(Mod_HeroMission_Base.get_continue_practice_info, _arg1.heroMission.get_continue_practice_info);
            _arg1.registerDataCallback(Mod_HeroMission_Base.continue_practice, _arg1.heroMission.continue_practice);
            _arg1.registerDataCallback(Mod_HeroMission_Base.quickly, _arg1.heroMission.quickly);
        }

    }
}//package com.protocols 
