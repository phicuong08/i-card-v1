﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Friend_Base {

        public static const ADD_SUCCESS:int = 0;
        public static const FRIEND_NOT_FOUND:int = 1;
        public static const ADD_SELF:int = 2;
        public static const FUNCTION_NO_OPEN:int = 3;
        public static const EXIST_IN_FRIENDGROUP:int = 4;
        public static const FRIENDGROUP_GT_UPPER_LIMIT:int = 5;
        public static const EXIST_IN_BLACKLISTGROUP:int = 6;
        public static const DELETE_SUCCESS:int = 7;
        public static const DELETE_ERROR:int = 8;
        public static const SEND_SUCCESS:int = 9;
        public static const IN_BLCAKLIST:int = 10;
        public static const SEND_ERROR:int = 11;
        public static const FRIEND:int = 12;
        public static const LAST_CONTACT:int = 13;
        public static const BLACKLIST:int = 14;
        public static const ONLINE:int = 15;
        public static const NOT_ONLINE:int = 16;
        public static const ENTRY:int = 17;
        public static const LEAVE:int = 18;
        public static const STRANGER:int = 19;
        public static const add_friend:Object = {
            module:9,
            action:0,
            request:[Utils.IntUtil, Utils.StringUtil],
            response:[Utils.ByteUtil]
        };
        public static const add_to_black:Object = {
            module:9,
            action:1,
            request:[Utils.StringUtil],
            response:[Utils.ByteUtil]
        };
        public static const delete_friend:Object = {
            module:9,
            action:2,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const send_message_to_friend:Object = {
            module:9,
            action:3,
            request:[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]
        };
        public static const receive_message_from_friend:Object = {
            module:9,
            action:4,
            request:[],
            response:[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]
        };
        public static const get_friend_list:Object = {
            module:9,
            action:5,
            request:[Utils.ByteUtil],
            response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_friend_details_info:Object = {
            module:9,
            action:6,
            request:[Utils.IntUtil],
            response:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_playerinfo:Object = {
            module:9,
            action:7,
            request:[],
            response:[Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_friendinfo_chatrecord_list:Object = {
            module:9,
            action:8,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]
        };
        public static const check_receive_message:Object = {
            module:9,
            action:9,
            request:[Utils.IntUtil],
            response:[Utils.StringUtil]
        };
        public static const notify_online_state:Object = {
            module:9,
            action:10,
            request:[],
            response:[Utils.IntUtil, Utils.ByteUtil]
        };
        public static const notify_message_count:Object = {
            module:9,
            action:11,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_unreceive_friend_list:Object = {
            module:9,
            action:12,
            request:[],
            response:[[Utils.IntUtil]]
        };
        public static const get_group:Object = {
            module:9,
            action:13,
            request:[Utils.IntUtil, Utils.StringUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_listeners:Object = {
            module:9,
            action:14,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const vip_player_list:Object = {
            module:9,
            action:15,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const message_box_list:Object = {
            module:9,
            action:16,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil]]
        };
        public static const notify_enter_state:Object = {
            module:9,
            action:17,
            request:[Utils.IntUtil, Utils.ByteUtil],
            response:[]
        };
        public static const receive_friend_enter_state:Object = {
            module:9,
            action:18,
            request:[],
            response:[Utils.IntUtil, Utils.ByteUtil]
        };
        public static const Actions:Array = ["add_friend", "add_to_black", "delete_friend", "send_message_to_friend", "receive_message_from_friend", "get_friend_list", "get_friend_details_info", "get_playerinfo", "get_friendinfo_chatrecord_list", "check_receive_message", "notify_online_state", "notify_message_count", "get_unreceive_friend_list", "get_group", "get_listeners", "vip_player_list", "message_box_list", "notify_enter_state", "receive_friend_enter_state"];

    }
}//package com.protocols 
