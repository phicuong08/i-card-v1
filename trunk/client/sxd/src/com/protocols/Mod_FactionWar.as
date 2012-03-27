//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_FactionWar {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_status, _arg1.factionWarMap.notify_status);
            _arg1.registerDataCallback(Mod_FactionWar_Base.get_faction_war_list, _arg1.factionWarMap.get_faction_war_list);
            _arg1.registerDataCallback(Mod_FactionWar_Base.sign_up, _arg1.factionWarMap.sign_up);
            _arg1.registerDataCallback(Mod_FactionWar_Base.sign_up_list, _arg1.factionWarMap.sign_up_list);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_open_faction_war, _arg1.factionWarMap.notify_open_faction_war);
            _arg1.registerDataCallback(Mod_FactionWar_Base.cup_list, _arg1.factionWarMap.cup_list);
            _arg1.registerDataCallback(Mod_FactionWar_Base.get_faction_war_info, _arg1.factionWarMap.get_faction_war_info);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_begin_faction_war, _arg1.factionWarMap.notify_begin_faction_war);
            _arg1.registerDataCallback(Mod_FactionWar_Base.fight_player, _arg1.factionWarMap.fight_player);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_versus_fighting, _arg1.factionWarMap.notify_versus_fighting);
            _arg1.registerDataCallback(Mod_FactionWar_Base.send_versus_fight_data, _arg1.factionWarMap.send_versus_fight_data);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_versus_fight_over, _arg1.factionWarMap.notify_versus_fight_over);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_round_over, _arg1.factionWarMap.notify_round_over);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_faction_war_over, _arg1.factionWarMap.notify_faction_war_over);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_faction_war_gift, _arg1.factionWarMap.notify_faction_war_gift);
            _arg1.registerDataCallback(Mod_FactionWar_Base.get_faction_war_gift_detail, _arg1.factionWarMap.get_faction_war_gift_detail);
            _arg1.registerDataCallback(Mod_FactionWar_Base.give_faction_war_gift, _arg1.factionWarMap.give_faction_war_gift);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_good_faction_war_gift, _arg1.factionWarMap.notify_good_faction_war_gift);
            _arg1.registerDataCallback(Mod_FactionWar_Base.get_versus_rank_list, _arg1.factionWarMap.get_versus_rank_list);
            _arg1.registerDataCallback(Mod_FactionWar_Base.notify_give_faction_war_gift, _arg1.factionWarMap.notify_give_faction_war_gift);
            _arg1.registerDataCallback(Mod_FactionWar_Base.get_my_faction_war, _arg1.factionWarMap.get_my_faction_war);
        }

    }
}//package com.protocols 
