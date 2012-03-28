//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Notify {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Notify_Base.mission_award, _arg1.notify.mission_award);
            _arg1.registerDataCallback(Mod_Notify_Base.pk_award, _arg1.notify.pk_award);
            _arg1.registerDataCallback(Mod_Notify_Base.complete_reel_production, _arg1.notify.complete_reel_production);
            _arg1.registerDataCallback(Mod_Notify_Base.disband_faction_notify, _arg1.notify.disband_faction_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.kickout_member_notify, _arg1.notify.kickout_member_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.role_num_notify, _arg1.notify.role_num_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.new_research_notify, _arg1.notify.new_research_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.new_partners_notify, _arg1.notify.new_partners_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.update_player_super_gift, _arg1.notify.update_player_super_gift);
            _arg1.registerDataCallback(Mod_Notify_Base.notify_get_good_fate, _arg1.notify.notify_get_good_fate);
            _arg1.registerDataCallback(Mod_Notify_Base.change_equip, _arg1.notify.change_equip);
            _arg1.registerDataCallback(Mod_Notify_Base.update_lucky_shop_item, _arg1.notify.update_lucky_shop_item);
            _arg1.registerDataCallback(Mod_Notify_Base.buy_good_stuff_in_lucky_shop, _arg1.notify.buy_good_stuff_in_lucky_shop);
            _arg1.registerDataCallback(Mod_Notify_Base.notify_player_mission_practice_status, _arg1.notify.notify_player_mission_practice_status);
            _arg1.registerDataCallback(Mod_Notify_Base.player_take_bible, _arg1.notify.player_take_bible);
            _arg1.registerDataCallback(Mod_Notify_Base.player_take_bible_berobbed, _arg1.notify.player_take_bible_berobbed);
            _arg1.registerDataCallback(Mod_Notify_Base.game_timer, _arg1.notify.game_timer);
            _arg1.registerDataCallback(Mod_Notify_Base.send_flower, _arg1.notify.send_flower);
            _arg1.registerDataCallback(Mod_Notify_Base.pass_tower, _arg1.notify.pass_tower);
            _arg1.registerDataCallback(Mod_Notify_Base.update_rulai_status, _arg1.notify.update_rulai_status);
            _arg1.registerDataCallback(Mod_Notify_Base.roll_cake, _arg1.notify.roll_cake);
            _arg1.registerDataCallback(Mod_Notify_Base.update_server_war_step, _arg1.notify.update_server_war_step);
            _arg1.registerDataCallback(Mod_Notify_Base.have_new_server_war_report, _arg1.notify.have_new_server_war_report);
            _arg1.registerDataCallback(Mod_Notify_Base.server_war_winner, _arg1.notify.server_war_winner);
            _arg1.registerDataCallback(Mod_Notify_Base.world_war_top_login, _arg1.notify.world_war_top_login);
            _arg1.registerDataCallback(Mod_Notify_Base.zodiac_entry_notify, _arg1.notify.zodiac_entry_notify);
            _arg1.registerDataCallback(Mod_Notify_Base.get_pet_animal_exp, _arg1.notify.get_pet_animal_exp);
            _arg1.registerDataCallback(Mod_Notify_Base.study_stunt_notify, _arg1.notify.study_stunt_notify);
        }

    }
}//package com.protocols 
