//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_MultiMission {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_MultipleMission_Base.open_multiple_mission, _arg1.multiMission.open_multiple_mission);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.get_multiple_mission_team_list, _arg1.multiMission.get_multiple_mission_team_list);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.get_player_team_info, _arg1.multiMission.get_player_team_info);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.create_multiple_mission_team, _arg1.multiMission.create_multiple_mission_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.dissolve_multiple_mission_team, _arg1.multiMission.dissolve_multiple_mission_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.join_multiple_mission_team, _arg1.multiMission.join_multiple_mission_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.exit_multiple_mission_team, _arg1.multiMission.exit_multiple_mission_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.kicked_out_member, _arg1.multiMission.kicked_out_member);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.sort_multiple_mission_team, _arg1.multiMission.sort_multiple_mission_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.close_multiple_mission, _arg1.multiMission.close_multiple_mission);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.fight_multiple_mission, _arg1.multiMission.fight_multiple_mission);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.get_war_result, _arg1.multiMission.get_war_result);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.notify, _arg1.multiMission.notify);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.get_multiple_mission_status, _arg1.multiMission.get_multiple_mission_status);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.notify_new_team, _arg1.multiMission.notify_new_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.notify_drop_team, _arg1.multiMission.notify_drop_team);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.notify_update_member_number, _arg1.multiMission.notify_update_member_number);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.check_is_can_challenge, _arg1.multiMission.check_is_can_challenge);
            _arg1.registerDataCallback(Mod_MultipleMission_Base.get_player_cd_time, _arg1.multiMission.get_player_cd_time);
        }

    }
}//package com.protocols 
