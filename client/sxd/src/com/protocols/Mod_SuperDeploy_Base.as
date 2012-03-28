//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_SuperDeploy_Base {

        public static const SUCCEED:int = 0;
        public static const NOT_MY_ROLE:int = 1;
        public static const LEAVE_TEAM:int = 2;
        public static const NOT_ENOUGTH_LEVEL:int = 3;
        public static const CAN_NOT_DOWN_MAIN_ROLE:int = 4;
        public static const FULL_DEPLOY:int = 5;
        public static const super_deploy_list:Object = {
            module:46,
            action:0,
            request:[],
            response:[[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.ByteUtil, Utils.IntUtil]]
        };
        public static const up_deploy:Object = {
            module:46,
            action:1,
            request:[Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const down_deploy:Object = {
            module:46,
            action:2,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const deploy_research_and_first_attack:Object = {
            module:46,
            action:3,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const new_deploy_grid_open_notify:Object = {
            module:46,
            action:4,
            request:[],
            response:[[Utils.ByteUtil]]
        };
        public static const Actions:Array = ["super_deploy_list", "up_deploy", "down_deploy", "deploy_research_and_first_attack", "new_deploy_grid_open_notify"];

    }
}//package com.protocols 
