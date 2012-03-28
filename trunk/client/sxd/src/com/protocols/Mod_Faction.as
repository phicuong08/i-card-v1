//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Faction {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Faction_Base.faction_list, _arg1.faction.faction_list);
            _arg1.registerDataCallback(Mod_Faction_Base.found_faction, _arg1.faction.found_faction);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_request, _arg1.faction.faction_request);
            _arg1.registerDataCallback(Mod_Faction_Base.cancel_request, _arg1.faction.cancel_request);
            _arg1.registerDataCallback(Mod_Faction_Base.member_list, _arg1.faction.member_List);
            _arg1.registerDataCallback(Mod_Faction_Base.request_list, _arg1.faction.request_list);
            _arg1.registerDataCallback(Mod_Faction_Base.accept_request, _arg1.faction.accept_request);
            _arg1.registerDataCallback(Mod_Faction_Base.deny_request, _arg1.faction.deny_request);
            _arg1.registerDataCallback(Mod_Faction_Base.modify_faction_desc, _arg1.faction.modify_faction_desc);
            _arg1.registerDataCallback(Mod_Faction_Base.modify_faction_notice, _arg1.faction.modify_faction_notice);
            _arg1.registerDataCallback(Mod_Faction_Base.appoint_job, _arg1.faction.appoint_job);
            _arg1.registerDataCallback(Mod_Faction_Base.dismiss_job, _arg1.faction.dismiss_job);
            _arg1.registerDataCallback(Mod_Faction_Base.kickout_member, _arg1.faction.kickout_member);
            _arg1.registerDataCallback(Mod_Faction_Base.master_transfer, _arg1.faction.master_transfer);
            _arg1.registerDataCallback(Mod_Faction_Base.quit_faction, _arg1.faction.quit_faction);
            _arg1.registerDataCallback(Mod_Faction_Base.disband_faction, _arg1.faction.disband_faction);
            _arg1.registerDataCallback(Mod_Faction_Base.my_faction_info, _arg1.faction.my_faction_info);
            _arg1.registerDataCallback(Mod_Faction_Base.found_faction_coin, _arg1.faction.found_faction_coin);
            _arg1.registerDataCallback(Mod_Faction_Base.modify_group_number, _arg1.faction.modify_group_number);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_contribution_list, _arg1.faction.faction_contribution_list);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_god_info, _arg1.faction.faction_god_info);
            _arg1.registerDataCallback(Mod_Faction_Base.incense, _arg1.faction.incense);
            _arg1.registerDataCallback(Mod_Faction_Base.get_blessing_count, _arg1.faction.get_blessing_count);
            _arg1.registerDataCallback(Mod_Faction_Base.blessing_count_change, _arg1.faction.blessing_count_change);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_message_notify, _arg1.faction.faction_message_notify);
            _arg1.registerDataCallback(Mod_Faction_Base.clean_faction_request, _arg1.faction.clean_faction_request);
            _arg1.registerDataCallback(Mod_Faction_Base.join_seal_satan, _arg1.faction.join_seal_satan);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_call_npc, _arg1.faction.seal_satan_call_npc);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_join_notify, _arg1.faction.seal_satan_join_notify);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_member_list, _arg1.faction.seal_satan_member_list);
            _arg1.registerDataCallback(Mod_Faction_Base.close_seal_satan, _arg1.faction.close_seal_satan);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_call_faction_member, _arg1.faction.seal_satan_call_faction_member);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_info, _arg1.faction.seal_satan_info);
            _arg1.registerDataCallback(Mod_Faction_Base.seal_satan_award_notify, _arg1.faction.seal_satan_award_notify);
            _arg1.registerDataCallback(Mod_Faction_Base.call_eat_info, _arg1.faction.call_eat_info);
            _arg1.registerDataCallback(Mod_Faction_Base.call_eat, _arg1.faction.call_eat);
            _arg1.registerDataCallback(Mod_Faction_Base.call_eat_detailed_info, _arg1.faction.call_eat_detailed_info);
            _arg1.registerDataCallback(Mod_Faction_Base.join_eat, _arg1.faction.join_eat);
            _arg1.registerDataCallback(Mod_Faction_Base.is_can_join_activity, _arg1.faction.is_can_join_activity);
            _arg1.registerDataCallback(Mod_Faction_Base.get_faction_level, _arg1.faction.get_faction_level);
            _arg1.registerDataCallback(Mod_Faction_Base.get_faction_master_trace, _arg1.faction.get_faction_master_trace);
            _arg1.registerDataCallback(Mod_Faction_Base.seize_the_throne, _arg1.faction.seize_the_throne);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_roll_cake_remain_times, _arg1.faction.faction_roll_cake_remain_times);
            _arg1.registerDataCallback(Mod_Faction_Base.faction_roll_cake_info, _arg1.faction.faction_roll_cake_info);
            _arg1.registerDataCallback(Mod_Faction_Base.roll_cake, _arg1.faction.roll_cake);
        }

    }
}//package com.protocols 
