//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Mission {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Mission_Base.get_sections, _arg1.mission.get_sections);
            _arg1.registerDataCallback(Mod_Mission_Base.enter_mission, _arg1.mission.enter_mission);
            _arg1.registerDataCallback(Mod_Mission_Base.fight_monster, _arg1.mission.fight_monster);
            _arg1.registerDataCallback(Mod_Mission_Base.rank_mission, _arg1.mission.rank_mission);
            _arg1.registerDataCallback(Mod_Mission_Base.open_box, _arg1.mission.open_box);
            _arg1.registerDataCallback(Mod_Mission_Base.pickup_award, _arg1.mission.pickup_award);
            _arg1.registerDataCallback(Mod_Mission_Base.sign_play_mission_video, _arg1.mission.pickup_award);
            _arg1.registerDataCallback(Mod_Mission_Base.get_monster_strategy_list, _arg1.mission.get_monster_strategy_list);
            _arg1.registerDataCallback(Mod_Mission_Base.get_player_war_report, _arg1.mission.get_player_war_report, true);
        }

    }
}//package com.protocols 
