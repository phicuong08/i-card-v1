//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_TravelEvent_Base {

        public static const CD_TIME:int = 0;
        public static const REACH_MAX_COUNT:int = 1;
        public static const SUCCESS:int = 2;
        public static const COIN:int = 3;
        public static const EXP:int = 4;
        public static const FAME:int = 5;
        public static const POWER:int = 6;
        public static const SKILL:int = 7;
        public static const NO_INGOT:int = 8;
        public static const get_activity_info:Object = {
            module:21,
            action:0,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_event_and_answer:Object = {
            module:21,
            action:1,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil], Utils.ByteUtil]
        };
        public static const answer_travel_event:Object = {
            module:21,
            action:2,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.StringUtil, [Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const cancel_cd:Object = {
            module:21,
            action:3,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["get_activity_info", "get_event_and_answer", "answer_travel_event", "cancel_cd"];

    }
}//package com.protocols 
