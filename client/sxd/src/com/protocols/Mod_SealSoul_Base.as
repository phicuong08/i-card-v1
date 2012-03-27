//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_SealSoul_Base {

        public static const SUCCEED:int = 0;
        public static const FAILED:int = 1;
        public static const NO_ENOUGH_INGOT:int = 2;
        public static const LOCK:int = 3;
        public static const NO_ENOUGH_COIN:int = 4;
        public static const NO_RECORD:int = 5;
        public static const NO_LOCK:int = 6;
        public static const INVALID_LOCATION:int = 7;
        public static const soul_info_by_location:Object = {
            module:34,
            action:1,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const swap_soul:Object = {
            module:34,
            action:2,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const move_soul:Object = {
            module:34,
            action:3,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_item_info_by_role_id:Object = {
            module:34,
            action:4,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const open_player_soul_key:Object = {
            module:34,
            action:5,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const soul_attribute_reset:Object = {
            module:34,
            action:6,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_tower_key:Object = {
            module:34,
            action:7,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const sell_player_soul:Object = {
            module:34,
            action:8,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_ten_times_reset_value:Object = {
            module:34,
            action:9,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const set_player_soul_value:Object = {
            module:34,
            action:10,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_item_info_by_player_item_id:Object = {
            module:34,
            action:11,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_reset_count:Object = {
            module:34,
            action:12,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const get_stone_count:Object = {
            module:34,
            action:13,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const lock:Object = {
            module:34,
            action:14,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const will_to_unlock:Object = {
            module:34,
            action:16,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const notify_get:Object = {
            module:34,
            action:17,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const get_day_stone:Object = {
            module:34,
            action:18,
            request:[Utils.ByteUtil],
            response:[Utils.ByteUtil, Utils.IntUtil]
        };
        public static const swap_seal_soul:Object = {
            module:34,
            action:19,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const day_stone_count:Object = {
            module:34,
            action:20,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const save_lock:Object = {
            module:34,
            action:21,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const Actions:Array = ["soul_info_by_location", "swap_soul", "move_soul", "get_item_info_by_role_id", "open_player_soul_key", "soul_attribute_reset", "get_tower_key", "sell_player_soul", "get_ten_times_reset_value", "set_player_soul_value", "get_item_info_by_player_item_id", "get_reset_count", "get_stone_count", "lock", "will_to_unlock", "notify_get", "get_day_stone", "swap_seal_soul", "day_stone_count", "save_lock"];

    }
}//package com.protocols 
