//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Player {

        public static function register(_arg1:Data):void{
            var _local2:Function = _arg1.registerDataCallback;
            _local2(Mod_Player_Base.login, _arg1.player.login);
            _local2(Mod_Player_Base.player_first_init, _arg1.player.player_first_init);
            _local2(Mod_Player_Base.get_player_info, _arg1.player.get_player_info);
            _local2(Mod_Player_Base.update_player_data, _arg1.player.update_player_data);
            _local2(Mod_Player_Base.update_player_data_for_town, _arg1.player.update_player_data_for_town);
            _local2(Mod_Player_Base.get_player_function, _arg1.player.get_player_function);
            _local2(Mod_Player_Base.sign_play_player_function, _arg1.player.sign_play_player_function);
            _local2(Mod_Player_Base.buy_power, _arg1.player.buy_power);
            _local2(Mod_Player_Base.set_player_camp, _arg1.player.set_player_camp);
            _local2(Mod_Player_Base.get_other_player_info, _arg1.player.get_other_player_info);
            _local2(Mod_Player_Base.get_buy_power_data, _arg1.player.get_buy_power_data);
            _local2(Mod_Player_Base.receive_player_delay_notify_message, _arg1.player.receive_player_delay_notify_message);
            _local2(Mod_Player_Base.validate_id_card, _arg1.player.validate_id_card);
            _local2(Mod_Player_Base.against_wallows_notify, _arg1.player.against_wallows_notify);
            _local2(Mod_Player_Base.against_wallows_info, _arg1.player.against_wallows_info);
            _local2(Mod_Player_Base.server_time, _arg1.player.server_time);
            _local2(Mod_Player_Base.get_player_camp_salary, _arg1.player.get_player_camp_salary);
            _local2(Mod_Player_Base.player_get_online_gift, _arg1.player.player_get_online_gift);
            _local2(Mod_Player_Base.get_player_current_online_gift, _arg1.player.get_player_current_online_gift);
            _local2(Mod_Player_Base.get_affiche_list, _arg1.player.get_affiche_list);
            _local2(Mod_Player_Base.practice_notify, _arg1.player.practice_notify);
            _local2(Mod_Player_Base.get_practice_data, _arg1.player.get_practice_data);
            _local2(Mod_Player_Base.get_player_war_cd_time, _arg1.player.get_player_war_cd_time);
            _local2(Mod_Player_Base.get_game_assistant_info, _arg1.player.get_game_assistant_info);
            _local2(Mod_Player_Base.send_ingot_receive_show_vip, _arg1.player.send_ingot_receive_show_vip);
            _local2(Mod_Player_Base.get_warning_affiche, _arg1.player.get_warning_affiche);
            _local2(Mod_Player_Base.back_times, _arg1.player.back_times);
            _local2(Mod_Player_Base.player_info_contrast, _arg1.player.player_info_contrast);
            _local2(Mod_Player_Base.player_consume_alert_set_info, _arg1.consumeAlertSetting.player_consume_alert_set_info);
            _local2(Mod_Player_Base.player_consume_alert_set, _arg1.consumeAlertSetting.player_consume_alert_set);
        }

    }
}//package com.protocols 
