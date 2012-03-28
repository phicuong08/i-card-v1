//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Practice_Base {

        public static const SUCCESS:int = 0;
        public static const NOT_ENOUGH_INGOT:int = 1;
        public static const NOT_ENOUGH_TIMES:int = 2;
        public static const quickly:Object = {
            module:45,
            action:0,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const quickly_all:Object = {
            module:45,
            action:1,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["quickly", "quickly_all"];

    }
}//package com.protocols 
