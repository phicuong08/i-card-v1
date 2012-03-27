//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Tower_Base {

        public static const SUCCESS:int = 0;
        public static const INVALID_LAYER:int = 1;
        public static const NO_LV:int = 2;
        public static const NOT_ENOUGH_INGOT:int = 3;
        public static const FULL_TIMES:int = 4;
        public static const FULL_BAG:int = 5;
        public static const get_tower_info:Object = {
            module:32,
            action:0,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]
        };
        public static const start_challenge:Object = {
            module:32,
            action:2,
            request:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], [[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.StringUtil]]]], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        };
        public static const reset_layer:Object = {
            module:32,
            action:3,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil]
        };
        public static const start_auto_challenge:Object = {
            module:32,
            action:4,
            request:[Utils.ByteUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const stop_auto_challenge:Object = {
            module:32,
            action:5,
            request:[],
            response:[]
        };
        public static const notify_auto_challenge_report:Object = {
            module:32,
            action:6,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        };
        public static const quickly_auto_challenge:Object = {
            module:32,
            action:7,
            request:[Utils.ByteUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["get_tower_info", "start_challenge", "reset_layer", "start_auto_challenge", "stop_auto_challenge", "notify_auto_challenge_report", "quickly_auto_challenge"];

    }
}//package com.protocols 
