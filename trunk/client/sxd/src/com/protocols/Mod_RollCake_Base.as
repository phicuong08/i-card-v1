//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_RollCake_Base {

        public static const SUCCESS:int = 0;
        public static const FAILURE:int = 1;
        public static const NOT_ENOUGH_INGOT:int = 2;
        public static const NO_CHANG_LUCK_TIMES:int = 3;
        public static const NO_RECORD:int = 4;
        public static const HAVE_RECORD:int = 5;
        public static const roll:Object = {
            module:38,
            action:0,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const get_count:Object = {
            module:38,
            action:2,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const reroll:Object = {
            module:38,
            action:3,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const get_award:Object = {
            module:38,
            action:4,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const get_state:Object = {
            module:38,
            action:5,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const Actions:Array = ["roll", "get_count", "reroll", "get_award", "get_state"];

    }
}//package com.protocols 
