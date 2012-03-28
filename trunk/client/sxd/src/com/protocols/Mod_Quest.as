//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Quest {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Quest_Base.npc_info_by_npcid, _arg1.quest.npc_info_by_npcid);
            _arg1.registerDataCallback(Mod_Quest_Base.npc_info_by_questid, _arg1.quest.npc_info_by_questid);
            _arg1.registerDataCallback(Mod_Quest_Base.accept_quest, _arg1.quest.accept_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.complete_quest, _arg1.quest.complete_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.list_player_quest, _arg1.quest.list_player_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.giveup_quest, _arg1.quest.giveup_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.can_receive_quest, _arg1.quest.can_receive_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.town_quest_show, _arg1.quest.town_quest_show);
            _arg1.registerDataCallback(Mod_Quest_Base.finish_quest, _arg1.quest.finish_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.day_quest_list, _arg1.dailyQuest.day_quest_list);
            _arg1.registerDataCallback(Mod_Quest_Base.day_accept_quest, _arg1.dailyQuest.day_accept_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.day_giveup_quest, _arg1.dailyQuest.day_giveup_quest);
            _arg1.registerDataCallback(Mod_Quest_Base.day_quest_refresh, _arg1.dailyQuest.day_quest_refresh);
            _arg1.registerDataCallback(Mod_Quest_Base.day_now_complete, _arg1.dailyQuest.day_now_complete);
            _arg1.registerDataCallback(Mod_Quest_Base.day_get_award, _arg1.dailyQuest.day_get_award);
            _arg1.registerDataCallback(Mod_Quest_Base.day_quest_refresh_star, _arg1.dailyQuest.day_quest_refresh_star);
            _arg1.registerDataCallback(Mod_Quest_Base.finish_all_day_quest, _arg1.dailyQuest.finish_all_day_quest);
        }

    }
}//package com.protocols 
