//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Role_Base {

        public static const DEPLOY:int = 0;
        public static const NODEPLOY:int = 1;
        public static const SUCCEED:int = 2;
        public static const FAILED:int = 3;
        public static const SUCCESS:int = 4;
        public static const ROLE_NO_EXIT:int = 5;
        public static const NO_PLAYER_ROLE:int = 6;
        public static const IS_DOWN:int = 7;
        public static const IS_MAIN_ROLE:int = 8;
        public static const IS_FOLLOW_ROLE:int = 9;
        public static const get_town_player_info:Object = {
            module:5,
            action:1,
            request:[],
            response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_role_list:Object = {
            module:5,
            action:2,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil]]
        };
        public static const down_partners:Object = {
            module:5,
            action:3,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_role_list_simpe:Object = {
            module:5,
            action:4,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_role_id_list:Object = {
            module:5,
            action:5,
            request:[],
            response:[[Utils.IntUtil]]
        };
        public static const set_follow_role:Object = {
            module:5,
            action:6,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil]
        };
        public static const exp_change_notify:Object = {
            module:5,
            action:7,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_simple_role_list:Object = {
            module:5,
            action:8,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]]
        };
        public static const get_role_war_attribute:Object = {
            module:5,
            action:9,
            request:[Utils.IntUtil],
            response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_default_deploy_first_attack:Object = {
            module:5,
            action:10,
            request:[Utils.IntUtil],
            response:[Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const Actions:Array = ["get_town_player_info", "get_role_list", "down_partners", "get_role_list_simpe", "get_role_id_list", "set_follow_role", "exp_change_notify", "get_simple_role_list", "get_role_war_attribute", "get_default_deploy_first_attack"];

    }
}//package com.protocols 
