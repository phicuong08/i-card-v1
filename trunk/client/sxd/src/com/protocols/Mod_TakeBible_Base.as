//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_TakeBible_Base {

        public static const BAI_LONG_MA:int = 0;
        public static const SHA_WU_JING:int = 1;
        public static const ZHU_BA_JIE:int = 2;
        public static const SUN_WU_KONG:int = 3;
        public static const TANG_SENG:int = 4;
        public static const CLOSE:int = 5;
        public static const OPEN_FOR_CALL:int = 6;
        public static const OPEN:int = 7;
        public static const SUCCESS:int = 8;
        public static const INVALID_PLAYER_ID:int = 9;
        public static const FULL_PROTECT_TIMES:int = 10;
        public static const NOT_ONLINE:int = 11;
        public static const TAKE_BIBLE_STATUS:int = 12;
        public static const CANCEL_APPLY:int = 13;
        public static const PROTECT_STATUS:int = 14;
        public static const NOT_ENOUGH_INGOT:int = 15;
        public static const REQUEST_VIP:int = 16;
        public static const FULL_TAKE_BIBLE_TIMES:int = 17;
        public static const REROB:int = 18;
        public static const FULL_ROB_TIMES:int = 19;
        public static const HAVE_CD_TIME:int = 20;
        public static const BE_ROB_ALL:int = 21;
        public static const ROB:int = 22;
        public static const TAKE_BIBLE:int = 23;
        public static const NEW_TAKE_BIBLE:int = 24;
        public static const QUICKLY:int = 25;
        public static const ARRIVAL:int = 26;
        public static const FRIEND_APPROVE_APPLY:int = 27;
        public static const FRIEND_REJECT_APPLY:int = 28;
        public static const BEROB:int = 29;
        public static const PROTECT_BEROB:int = 30;
        public static const APPLY_PROTECT:int = 31;
        public static const INVALID_TYPE:int = 32;
        public static const CALLED:int = 33;
        public static const TIMEUSED:int = 34;
        public static const open_take_bible:Object = {
            module:30,
            action:0,
            request:[],
            response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil]
        };
        public static const close_take_bible:Object = {
            module:30,
            action:1,
            request:[],
            response:[]
        };
        public static const get_take_bible_info:Object = {
            module:30,
            action:2,
            request:[],
            response:[[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.ByteUtil]
        };
        public static const apply_friend:Object = {
            module:30,
            action:3,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const cancel_apply_friend:Object = {
            module:30,
            action:4,
            request:[],
            response:[]
        };
        public static const approve_apply:Object = {
            module:30,
            action:5,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const reject_apply:Object = {
            module:30,
            action:6,
            request:[Utils.IntUtil],
            response:[]
        };
        public static const buy_protection:Object = {
            module:30,
            action:7,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const refresh:Object = {
            module:30,
            action:8,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]
        };
        public static const get_player_take_bible:Object = {
            module:30,
            action:9,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.StringUtil]
        };
        public static const start_take_bible:Object = {
            module:30,
            action:10,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const rob:Object = {
            module:30,
            action:11,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], [[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.StringUtil]]]], Utils.ByteUtil]
        };
        public static const notify:Object = {
            module:30,
            action:12,
            request:[],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil]]
        };
        public static const notify_global:Object = {
            module:30,
            action:13,
            request:[],
            response:[Utils.ByteUtil, [Utils.StringUtil, Utils.IntUtil], [Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ShortUtil]]
        };
        public static const quickly:Object = {
            module:30,
            action:14,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_take_bible_updata_data:Object = {
            module:30,
            action:15,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]
        };
        public static const get_rob_take_bible_cd_time:Object = {
            module:30,
            action:16,
            request:[],
            response:[Utils.ShortUtil, Utils.ShortUtil]
        };
        public static const clear_rob_take_bible_cd_time:Object = {
            module:30,
            action:17,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const buy_bless:Object = {
            module:30,
            action:18,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const call_rulai:Object = {
            module:30,
            action:19,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const get_rulai_open_time:Object = {
            module:30,
            action:20,
            request:[],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        };
        public static const take_bible_info:Object = {
            module:30,
            action:21,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const Actions:Array = ["open_take_bible", "close_take_bible", "get_take_bible_info", "apply_friend", "cancel_apply_friend", "approve_apply", "reject_apply", "buy_protection", "refresh", "get_player_take_bible", "start_take_bible", "rob", "notify", "notify_global", "quickly", "get_take_bible_updata_data", "get_rob_take_bible_cd_time", "clear_rob_take_bible_cd_time", "buy_bless", "call_rulai", "get_rulai_open_time", "take_bible_info"];

    }
}//package com.protocols 
