//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Achievement_Base {

        public static const get_player_achievement_list:Object = {
            module:39,
            action:0,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const notify_complete_achievement:Object = {
            module:39,
            action:1,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]
        };
        public static const Actions:Array = ["get_player_achievement_list", "notify_complete_achievement"];

    }
}//package com.protocols 
