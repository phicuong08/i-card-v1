//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.protocols {
    import ICard.haloer.utils.*;

    public class Mod_Town_Base {

        public static const SUCCESS:int = 0;
        public static const FAILED:int = 1;
        public static const FULL:int = 2;
        public static const NOT_ENOUGH_INGOT:int = 3;
        public static const ON_PRACTICE:int = 4;
        public static const OFF_PRACTICE:int = 5;
        public static const FINISHED_PRACTICE:int = 6;
        public static const enter_town:Object = {
            module:1,
            action:0,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const leave_town:Object = {
            module:1,
            action:1,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const move_to:Object = {
            module:1,
            action:2,
            request:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]
        };
        public static const get_players:Object = {
            module:1,
            action:3,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]]
        };
        public static const player_follow_role_change:Object = {
            module:1,
            action:4,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil]
        };
        public static const player_count:Object = {
            module:1,
            action:5,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const Actions:Array = ["enter_town", "leave_town", "move_to", "get_players", "player_follow_role_change", "player_count"];

    }
}//package com.protocols 
