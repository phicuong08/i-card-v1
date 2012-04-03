//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.protocols {
    import ICard.haloer.utils.*;

    public class Mod_Player_Base {

        public static const SUCCEED:int = 0;
        public static const FAILED:int = 1;
        public static const FIRST_TIME:int = 2;
        public static const AGAINST_WALLOWS:int = 3;
        public static const DISABLE_LOGIN:int = 4;
        public static const YES:int = 5;
        public static const NO:int = 6;
        public static const FORBIDDEN_NICKNAME:int = 7;
        public static const DUPLICATED_NICKNAME:int = 8;
        public static const TOOLONG_NICKNAME:int = 9;
        public static const PLAYER_LEVEL:int = 10;
        public static const PLAYER_INGOT:int = 11;
        public static const PLAYER_COINS:int = 12;
        public static const PLAYER_HEALTH:int = 13;
        public static const PLAYER_MAX_HEALTH:int = 14;
        public static const PLAYER_POWER:int = 15;
        public static const PLAYER_MAX_POWER:int = 16;
        public static const PLAYER_EXPERIENCE:int = 17;
        public static const PLAYER_MAX_EXPERIENCE:int = 18;
        public static const PLAYER_MEDICAL:int = 19;
        public static const PLAYER_INIT_MEDICAL:int = 20;
        public static const PLAYER_TRANSPORT:int = 21;
        public static const PLAYER_AVATAR:int = 22;
        public static const PLAYER_AVATAR_CD:int = 23;
        public static const PLAYER_PACK_EMPTY_NUM:int = 24;
        public static const PLAYER_FUNCTION:int = 25;
        public static const PLAYER_QUEST_STATE:int = 26;
        public static const PLAYER_CAMP_ID:int = 27;
        public static const FAME:int = 28;
        public static const FAME_LEVEL:int = 29;
        public static const VIP_LEVEL:int = 30;
        public static const PLAYER_CD_TIME:int = 31;
        public static const CAN_INCENSE_COUNT:int = 32;
        public static const PLAYER_SKILL:int = 33;
        public static const MAX_MISSION_LOCK:int = 34;
        public static const STATE_POINT:int = 35;
        public static const PLAYER_ROLE_LEVEL:int = 36;
        public static const PLAYER_TOWN_KEY:int = 37;
        public static const HEALTH_UP_SYS:int = 38;
        public static const HEALTH_UP_MEDICAL:int = 39;
        public static const HEALTH_UP_MEDICAL_EMPTY:int = 40;
        public static const FREE_MEDICAL:int = 41;
        public static const CAMP_SALARY:int = 42;
        public static const EXTRA_POWER:int = 43;
        public static const MAX_EXTRA_POWER:int = 44;
        public static const ONLINE_GIFT:int = 45;
        public static const GET_ONLINE_GIFT:int = 46;
        public static const CAN_NOT_UP_HEALTH_JOIN_CAMP_WAR:int = 47;
        public static const PLAYER_DAY_QUEST:int = 48;
        public static const QUEST_GIFT_BAG:int = 49;
        public static const FINISH_DAY_QUEST:int = 50;
        public static const NOT_ENOUGH_INGOT:int = 51;
        public static const FULL_BUY_TIMES:int = 52;
        public static const SUCCESS:int = 53;
        public static const CAMP_ERR:int = 54;
        public static const CANT_CHANGE_CAMP:int = 55;
        public static const IDCARDISUSE:int = 56;
        public static const ONE_WARNING:int = 57;
        public static const TWO_WARNING:int = 58;
        public static const WARNING:int = 59;
        public static const TIMEUP:int = 60;
        public static const ACTION_SUCCESS:int = 61;
        public static const ALREADY_GET:int = 62;
        public static const NOT_JOIN_CAMP:int = 63;
        public static const ACTION_FAILED:int = 64;
        public static const PACK_FULL:int = 65;
        public static const UPDATE_PRACTICE:int = 66;
        public static const START_PRACTICE:int = 67;
        public static const FINISHED_PRACTICE:int = 68;
        public static const CANCEL_PRACTICE:int = 69;
        public static const NO_INGOT:int = 70;
        public static const CAN_NOT_BACK_TIMES:int = 71;
        public static const login:Object = {
            module:0,
            action:0,
            request:[Utils.StringUtil, Utils.StringUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]
        };
        public static const player_first_init:Object = {
            module:0,
            action:1,
            request:[Utils.IntUtil, Utils.StringUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_player_info:Object = {
            module:0,
            action:2,
            request:[],
            response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        };
        public static const update_player_data:Object = {
            module:0,
            action:3,
            request:[Utils.ByteUtil],
            response:[[Utils.ByteUtil, Utils.LongUtil]]
        };
        public static const update_player_data_for_town:Object = {
            module:0,
            action:4,
            request:[Utils.ByteUtil],
            response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]]
        };
        public static const buy_power:Object = {
            module:0,
            action:5,
            request:[],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const get_player_function:Object = {
            module:0,
            action:6,
            request:[],
            response:[[Utils.IntUtil, Utils.ByteUtil]]
        };
        public static const sign_play_player_function:Object = {
            module:0,
            action:7,
            request:[Utils.IntUtil],
            response:[]
        };
        public static const set_player_camp:Object = {
            module:0,
            action:8,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const receive_player_delay_notify_message:Object = {
            module:0,
            action:9,
            request:[],
            response:[[Utils.StringUtil, Utils.IntUtil]]
        };
        public static const validate_id_card:Object = {
            module:0,
            action:10,
            request:[Utils.StringUtil],
            response:[Utils.ByteUtil]
        };
        public static const against_wallows_notify:Object = {
            module:0,
            action:11,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const get_player_camp_salary:Object = {
            module:0,
            action:20,
            request:[],
            response:[Utils.ByteUtil, Utils.IntUtil]
        };
        public static const server_time:Object = {
            module:0,
            action:22,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const get_buy_power_data:Object = {
            module:0,
            action:23,
            request:[],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]
        };
        public static const get_other_player_info:Object = {
            module:0,
            action:24,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil]
        };
        public static const player_get_online_gift:Object = {
            module:0,
            action:30,
            request:[],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]
        };
        public static const get_player_current_online_gift:Object = {
            module:0,
            action:31,
            request:[],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_affiche_list:Object = {
            module:0,
            action:35,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil]]
        };
        public static const start_practice:Object = {
            module:0,
            action:36,
            request:[],
            response:[]
        };
        public static const get_practice_data:Object = {
            module:0,
            action:37,
            request:[],
            response:[Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil]
        };
        public static const sign_finished_practice:Object = {
            module:0,
            action:38,
            request:[],
            response:[]
        };
        public static const cancel_practice:Object = {
            module:0,
            action:39,
            request:[],
            response:[]
        };
        public static const practice_notify:Object = {
            module:0,
            action:40,
            request:[],
            response:[Utils.ByteUtil, Utils.IntUtil]
        };
        public static const get_player_war_cd_time:Object = {
            module:0,
            action:41,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const get_game_assistant_info:Object = {
            module:0,
            action:42,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const send_ingot_receive_show_vip:Object = {
            module:0,
            action:43,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const against_wallows_info:Object = {
            module:0,
            action:44,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const get_last_player_version:Object = {
            module:0,
            action:45,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const get_warning_affiche:Object = {
            module:0,
            action:46,
            request:[],
            response:[Utils.StringUtil]
        };
        public static const back_times:Object = {
            module:0,
            action:47,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil]
        };
        public static const player_info_contrast:Object = {
            module:0,
            action:48,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_consume_alert_set_info:Object = {
            module:0,
            action:49,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_consume_alert_set:Object = {
            module:0,
            action:50,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["login", "player_first_init", "get_player_info", "update_player_data", "update_player_data_for_town", "buy_power", "get_player_function", "sign_play_player_function", "set_player_camp", "receive_player_delay_notify_message", "validate_id_card", "against_wallows_notify", "get_player_camp_salary", "server_time", "get_buy_power_data", "get_other_player_info", "player_get_online_gift", "get_player_current_online_gift", "get_affiche_list", "start_practice", "get_practice_data", "sign_finished_practice", "cancel_practice", "practice_notify", "get_player_war_cd_time", "get_game_assistant_info", "send_ingot_receive_show_vip", "against_wallows_info", "get_last_player_version", "get_warning_affiche", "back_times", "player_info_contrast", "player_consume_alert_set_info", "player_consume_alert_set"];

    }
}//package com.protocols 
