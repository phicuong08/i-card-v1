//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Fate_Base {

        public static const SUCCESS:int = 0;
        public static const BAG_FULL:int = 1;
        public static const INVALID_GRID:int = 2;
        public static const FATE_CAN_PICK_UP:int = 3;
        public static const NOT_ENOUGH_INGOT:int = 4;
        public static const MAX_BAG_NUMBER:int = 5;
        public static const HAVE_SAME_TYPE_FATE:int = 6;
        public static const HAVE_WEAR_ON:int = 7;
        public static const INVALID_POSITION:int = 8;
        public static const INVALID_FATE_NPC_ID:int = 9;
        public static const FULL_TEMP_BAG:int = 10;
        public static const NOT_ENOUGH_COIN:int = 11;
        public static const IN_BAG:int = 12;
        public static const ON_ROLE:int = 13;
        public static const BAG_TO_ROLE:int = 14;
        public static const ROLE_TO_BAG:int = 15;
        public static const MAX_LEVEL:int = 16;
        public static const INVALID_NPC_ID:int = 17;
        public static const FULL_BUY_TIMES:int = 18;
        public static const FATE_CAN_EXCHANGE:int = 19;
        public static const NOT_ENOUGH_LEVEL:int = 20;
        public static const NOT_ENOUGH_COUNT:int = 21;
        public static const get_fate_npc:Object = {
            module:22,
            action:0,
            request:[],
            response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]]
        };
        public static const get_temp_fate:Object = {
            module:22,
            action:1,
            request:[],
            response:[[Utils.IntUtil, Utils.ShortUtil]]
        };
        public static const pickup_fate:Object = {
            module:22,
            action:2,
            request:[[Utils.IntUtil]],
            response:[Utils.ByteUtil, [Utils.IntUtil]]
        };
        public static const sale_temp_fate:Object = {
            module:22,
            action:3,
            request:[[Utils.IntUtil]],
            response:[]
        };
        public static const get_bag_list:Object = {
            module:22,
            action:4,
            request:[],
            response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.IntUtil]
        };
        public static const buy_bag_grid:Object = {
            module:22,
            action:5,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_role_fate_list:Object = {
            module:22,
            action:6,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ByteUtil]
        };
        public static const wear_on:Object = {
            module:22,
            action:7,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil, Utils.ShortUtil]
        };
        public static const discard_fate:Object = {
            module:22,
            action:8,
            request:[Utils.IntUtil],
            response:[]
        };
        public static const appoint_fate_npc:Object = {
            module:22,
            action:9,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil]
        };
        public static const wear_off_fate:Object = {
            module:22,
            action:10,
            request:[Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const change_fate_grid:Object = {
            module:22,
            action:12,
            request:[Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const merge:Object = {
            module:22,
            action:13,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil]
        };
        public static const change_position:Object = {
            module:22,
            action:14,
            request:[Utils.IntUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_player_role_fate_power:Object = {
            module:22,
            action:15,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil]
        };
        public static const get_merge_data:Object = {
            module:22,
            action:16,
            request:[Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ShortUtil]
        };
        public static const merge_all_in_bag:Object = {
            module:22,
            action:17,
            request:[],
            response:[]
        };
        public static const buy_fate_npc:Object = {
            module:22,
            action:18,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil]
        };
        public static const exchange_fate:Object = {
            module:22,
            action:19,
            request:[Utils.ShortUtil],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["get_fate_npc", "get_temp_fate", "pickup_fate", "sale_temp_fate", "get_bag_list", "buy_bag_grid", "get_role_fate_list", "wear_on", "discard_fate", "appoint_fate_npc", "wear_off_fate", "change_fate_grid", "merge", "change_position", "get_player_role_fate_power", "get_merge_data", "merge_all_in_bag", "buy_fate_npc", "exchange_fate"];

    }
}//package com.protocols 
