//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Dujie_Base {

        public static const SUCCESS:int = 0;
        public static const ENOUGTH_PLAYER_ROLE_STATE_POINT:int = 1;
        public static const NOT_ENOGUTH_PLAYER_STATE_POINT:int = 2;
        public static const FAIL:int = 3;
        public static const TOP_STATE:int = 4;
        public static const NOT_ENOUGTH_PLAYER_ROLE_STATE_POINT:int = 5;
        public static const NOT_ENOUGTH_PLAYER_ROLE_LEVEL:int = 6;
        public static const dujie_info:Object = {
            module:37,
            action:0,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        };
        public static const add_player_role_state_point:Object = {
            module:37,
            action:1,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.ByteUtil]
        };
        public static const role_list:Object = {
            module:37,
            action:2,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const go_dujie:Object = {
            module:37,
            action:3,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], [[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.ShortUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.StringUtil]]]], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        };
        public static const Actions:Array = ["dujie_info", "add_player_role_state_point", "role_list", "go_dujie"];

    }
}//package com.protocols 
