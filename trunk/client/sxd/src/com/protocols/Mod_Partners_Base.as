//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Partners_Base {

        public static const YES:int = 0;
        public static const NO:int = 1;
        public static const SUCCEED:int = 2;
        public static const FAILED:int = 3;
        public static const NOENOUGHFEES:int = 4;
        public static const NOENOUGHFAME:int = 5;
        public static const COUNTLIMIT:int = 6;
        public static const partners_list:Object = {
            module:8,
            action:0,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const partners_invite:Object = {
            module:8,
            action:1,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const now_and_next_Recommend_role_list:Object = {
            module:8,
            action:2,
            request:[],
            response:[[Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil]
        };
        public static const Actions:Array = ["partners_list", "partners_invite", "now_and_next_Recommend_role_list"];

    }
}//package com.protocols 
