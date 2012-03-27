//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Notify_Base {

        public static const COINS:int = 0;
        public static const ITEM:int = 1;
        public static const ROLE:int = 2;
        public static const FAME:int = 3;
        public static const TANG_SENG:int = 4;
        public static const FACTION:int = 5;
        public static const CHANGE_MONEY:int = 6;
        public static const RULAI_OPEN_FOR_CALL:int = 7;
        public static const RULAI_CLOSE:int = 8;
        public static const RULAI_OPEN:int = 9;
        public static const mission_award:Object = {
            module:20,
            action:0,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const pk_award:Object = {
            module:20,
            action:1,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const complete_reel_production:Object = {
            module:20,
            action:2,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const role_num_notify:Object = {
            module:20,
            action:10,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const new_research_notify:Object = {
            module:20,
            action:11,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil]]
        };
        public static const new_partners_notify:Object = {
            module:20,
            action:12,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const notify_get_good_fate:Object = {
            module:20,
            action:13,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil]
        };
        public static const notify_player_mission_practice_status:Object = {
            module:20,
            action:14,
            request:[],
            response:[Utils.IntUtil, Utils.ByteUtil]
        };
        public static const update_player_super_gift:Object = {
            module:20,
            action:15,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]
        };
        public static const change_equip:Object = {
            module:20,
            action:16,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil]
        };
        public static const update_lucky_shop_item:Object = {
            module:20,
            action:17,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const buy_good_stuff_in_lucky_shop:Object = {
            module:20,
            action:18,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]
        };
        public static const disband_faction_notify:Object = {
            module:20,
            action:19,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const kickout_member_notify:Object = {
            module:20,
            action:20,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const player_take_bible:Object = {
            module:20,
            action:22,
            request:[],
            response:[Utils.StringUtil, Utils.ByteUtil]
        };
        public static const player_take_bible_berobbed:Object = {
            module:20,
            action:23,
            request:[],
            response:[Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]
        };
        public static const game_timer:Object = {
            module:20,
            action:24,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const send_flower:Object = {
            module:20,
            action:25,
            request:[],
            response:[Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        };
        public static const pass_tower:Object = {
            module:20,
            action:26,
            request:[],
            response:[Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const update_rulai_status:Object = {
            module:20,
            action:28,
            request:[],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil]
        };
        public static const roll_cake:Object = {
            module:20,
            action:29,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil]
        };
        public static const update_server_war_step:Object = {
            module:20,
            action:30,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const have_new_server_war_report:Object = {
            module:20,
            action:31,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const server_war_winner:Object = {
            module:20,
            action:32,
            request:[],
            response:[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]
        };
        public static const world_war_top_login:Object = {
            module:20,
            action:33,
            request:[],
            response:[Utils.StringUtil]
        };
        public static const zodiac_entry_notify:Object = {
            module:20,
            action:34,
            request:[],
            response:[Utils.StringUtil, Utils.ByteUtil]
        };
        public static const get_pet_animal_exp:Object = {
            module:20,
            action:35,
            request:[],
            response:[Utils.StringUtil]
        };
        public static const study_stunt_notify:Object = {
            module:20,
            action:36,
            request:[],
            response:[Utils.StringUtil, Utils.ShortUtil]
        };
        public static const Actions:Array = ["mission_award", "pk_award", "complete_reel_production", "role_num_notify", "new_research_notify", "new_partners_notify", "notify_get_good_fate", "notify_player_mission_practice_status", "update_player_super_gift", "change_equip", "update_lucky_shop_item", "buy_good_stuff_in_lucky_shop", "disband_faction_notify", "kickout_member_notify", "player_take_bible", "player_take_bible_berobbed", "game_timer", "send_flower", "pass_tower", "update_rulai_status", "roll_cake", "update_server_war_step", "have_new_server_war_report", "server_war_winner", "world_war_top_login", "zodiac_entry_notify", "get_pet_animal_exp", "study_stunt_notify"];

    }
}//package com.protocols 
