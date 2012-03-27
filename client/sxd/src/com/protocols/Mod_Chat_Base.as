//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Chat_Base {

        public static const ACTIVITY:int = 0;
        public static const WORLD:int = 1;
        public static const FACTION:int = 2;
        public static const FACTION_WAR:int = 3;
        public static const TIME_DIFF:int = 4;
        public static const DISABLE:int = 5;
        public static const SUCCESS:int = 6;
        public static const NORIGHT:int = 7;
        public static const ISTESTER:int = 8;
        public static const DISABLED:int = 9;
        public static const EXIT_IN_LIST:int = 10;
        public static const chat_with_players:Object = {
            module:6,
            action:0,
            request:[Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil],
            response:[Utils.IntUtil, Utils.ByteUtil]
        };
        public static const bro_to_players:Object = {
            module:6,
            action:1,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const disable_player_talk:Object = {
            module:6,
            action:2,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const shield_player_talk:Object = {
            module:6,
            action:3,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const shield_player_list:Object = {
            module:6,
            action:4,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil]]
        };
        public static const Actions:Array = ["chat_with_players", "bro_to_players", "disable_player_talk", "shield_player_talk", "shield_player_list"];

    }
}//package com.protocols 
