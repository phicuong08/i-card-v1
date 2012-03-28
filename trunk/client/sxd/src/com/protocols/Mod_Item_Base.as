//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.haloer.utils.*;

    public class Mod_Item_Base {

        public static const ACTION_SUCCESS:int = 0;
        public static const NO_TRANSPORT:int = 1;
        public static const NO_USE_AVATAR_CARD:int = 2;
        public static const MATERIAL_NOT_ENOUGH:int = 3;
        public static const PACK_FULL:int = 4;
        public static const INSUFFICIENT_INGOT:int = 5;
        public static const FUN_NOT_OPEN:int = 6;
        public static const NOT_ELIXIR_ITEM:int = 7;
        public static const NOT_ELIXIR_VALUE:int = 8;
        public static const NOT_ENOUGH_LEVEL:int = 9;
        public static const PLAYER_GRID_NO_EXIST:int = 10;
        public static const SOURCE_GRID_EMPTY:int = 11;
        public static const HAVE_SOUL:int = 12;
        public static const WAREHOUSE_FULL:int = 13;
        public static const PLAYER_ROLE_NOT_EXIST:int = 14;
        public static const NO_SUITE_EQUIP_TYPE:int = 15;
        public static const NO_SUITE_ROLE_LEVEL:int = 16;
        public static const NO_SUITE_ROLE_JOB:int = 17;
        public static const UN_AVALIABLE_GRID:int = 18;
        public static const ROLE_POS_EQUI_EMPTY:int = 19;
        public static const UNUSABLE_ITEM:int = 20;
        public static const NOT_ENOUGH_GRID:int = 21;
        public static const JOB_NOT_MATCH:int = 22;
        public static const IN_CAMP_WAR:int = 23;
        public static const IN_FACTION_WAR:int = 24;
        public static const IN_HEROES_WAR:int = 25;
        public static const NOT_ENOUGH_FATE_GRID:int = 26;
        public static const NOT_ENOUGH_SOUL_GRID:int = 27;
        public static const ACTION_FAILED:int = 28;
        public static const ITEM_LOCK:int = 29;
        public static const RECYCLE_ITEM_NO_EXIST:int = 30;
        public static const RECYCLE_ITEM_EXPIRED:int = 31;
        public static const INSUFFICIENT_COIN:int = 32;
        public static const UNSUITED:int = 33;
        public static const NPC_ITEM_NO_EXIST:int = 34;
        public static const INSUFFICIENT_CARD:int = 35;
        public static const ITEM_LIST_REFRESHED:int = 36;
        public static const RAISING:int = 37;
        public static const FALLING:int = 38;
        public static const HOLDING:int = 39;
        public static const PLAYER_ITEM_NO_EXIST:int = 40;
        public static const LEVEL_LIMIT:int = 41;
        public static const INSUFFICIENT_COINS:int = 42;
        public static const PROBABILITY_CHANGE:int = 43;
        public static const COOLDOWN_TIME:int = 44;
        public static const LOW_SUCCESS_RATE:int = 45;
        public static const ZERO_CD_TIME:int = 46;
        public static const NOT_ENOUGH_VIP_LEVEL:int = 47;
        public static const EQUIPMENT_NOT_IN_BODY:int = 48;
        public static const NOSUITEROLELEVEL:int = 49;
        public static const SUCCESS:int = 50;
        public static const ALREADY_HAVE:int = 51;
        public static const NOUPGRADEQUEUE:int = 52;
        public static const NOVIPLEVEL:int = 53;
        public static const NOT_ENOUGH_ITEM:int = 54;
        public static const NOT_GRID:int = 55;
        public static const TOWN_NPC_ERROR:int = 56;
        public static const NOT_ENOUGH_STATE_POINT:int = 57;
        public static const NOT_ENOUGH_DAY_COUNT:int = 58;
        public static const FAILED:int = 59;
        public static const NOT_ENOUGH_COIN:int = 60;
        public static const get_item_basical_infos:Object = {
            module:2,
            action:1,
            request:[[Utils.IntUtil]],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil]]
        };
        public static const get_empty_grid_number:Object = {
            module:2,
            action:2,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil]
        };
        public static const get_facture_reel_data:Object = {
            module:2,
            action:21,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_player_role_elixir_data:Object = {
            module:2,
            action:22,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil]
        };
        public static const dismount_transport:Object = {
            module:2,
            action:24,
            request:[],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const avatar_card_off:Object = {
            module:2,
            action:25,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const player_use_grid_reel:Object = {
            module:2,
            action:27,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_use_grid_elixir:Object = {
            module:2,
            action:28,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_get_super_gift:Object = {
            module:2,
            action:29,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_player_role_elixir_record:Object = {
            module:2,
            action:30,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_use_ingot_elixir:Object = {
            module:2,
            action:31,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_player_pack_item_list:Object = {
            module:2,
            action:41,
            request:[],
            response:[Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_player_warehouse_grids:Object = {
            module:2,
            action:42,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_role_equip_list:Object = {
            module:2,
            action:43,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const change_pack_item_grid:Object = {
            module:2,
            action:44,
            request:[Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const change_warehouse_item_grid:Object = {
            module:2,
            action:45,
            request:[Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const drop_pack_grid_item:Object = {
            module:2,
            action:46,
            request:[Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const drop_warehouse_grid_item:Object = {
            module:2,
            action:47,
            request:[Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const move_warehouse_grid_item_to_pack:Object = {
            module:2,
            action:48,
            request:[Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const move_pack_grid_item_to_warehouse:Object = {
            module:2,
            action:49,
            request:[Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const equip_player_role_item:Object = {
            module:2,
            action:50,
            request:[Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const remove_player_role_equipment:Object = {
            module:2,
            action:51,
            request:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_player_role_equip_list:Object = {
            module:2,
            action:52,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_use_grid_item:Object = {
            module:2,
            action:53,
            request:[Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const classify_pack:Object = {
            module:2,
            action:54,
            request:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]],
            response:[Utils.ByteUtil]
        };
        public static const classify_warehouse:Object = {
            module:2,
            action:55,
            request:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]],
            response:[Utils.ByteUtil]
        };
        public static const add_pack_grid:Object = {
            module:2,
            action:56,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]
        };
        public static const add_warehouse_grid:Object = {
            module:2,
            action:57,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]
        };
        public static const has_level_gift_item:Object = {
            module:2,
            action:58,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil]
        };
        public static const has_medical_item:Object = {
            module:2,
            action:59,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const get_npc_item_list:Object = {
            module:2,
            action:71,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil]]
        };
        public static const get_npc_recycle_item_list:Object = {
            module:2,
            action:72,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_sell_item:Object = {
            module:2,
            action:73,
            request:[Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_buy_back_item:Object = {
            module:2,
            action:74,
            request:[Utils.IntUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_buy_npc_item:Object = {
            module:2,
            action:75,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const lucky_shop_item_list:Object = {
            module:2,
            action:76,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const lucky_shop_record_list:Object = {
            module:2,
            action:77,
            request:[],
            response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const buy_lucky_shop_item:Object = {
            module:2,
            action:78,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const refresh_lucky_shop:Object = {
            module:2,
            action:79,
            request:[],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_equipment_list:Object = {
            module:2,
            action:91,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const equip_upgrade_stat:Object = {
            module:2,
            action:92,
            request:[],
            response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        };
        public static const upgrade_equip:Object = {
            module:2,
            action:93,
            request:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const clear_upgrade_cd_time:Object = {
            module:2,
            action:94,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const open_upgrade_opportunity:Object = {
            module:2,
            action:95,
            request:[],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]
        };
        public static const equip_upgrade_stat_list:Object = {
            module:2,
            action:96,
            request:[],
            response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_reel_need_item:Object = {
            module:2,
            action:97,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil]]
        };
        public static const player_equip_use_reel:Object = {
            module:2,
            action:98,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_player_item_facture_reel_data:Object = {
            module:2,
            action:100,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil], Utils.IntUtil]
        };
        public static const permanent_clean_item_update_cd:Object = {
            module:2,
            action:101,
            request:[],
            response:[Utils.ByteUtil]
        };
        public static const get_permanent_clean_item_update_cd:Object = {
            module:2,
            action:102,
            request:[],
            response:[Utils.IntUtil]
        };
        public static const notify_super_gift_items:Object = {
            module:2,
            action:103,
            request:[],
            response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.ByteUtil]
        };
        public static const change_attack_item:Object = {
            module:2,
            action:104,
            request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const change_attack_info:Object = {
            module:2,
            action:105,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_soul:Object = {
            module:2,
            action:106,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const get_the_item_num:Object = {
            module:2,
            action:107,
            request:[Utils.IntUtil],
            response:[Utils.IntUtil]
        };
        public static const can_change_list:Object = {
            module:2,
            action:108,
            request:[],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const get_gold_oil:Object = {
            module:2,
            action:109,
            request:[Utils.IntUtil],
            response:[Utils.ByteUtil]
        };
        public static const can_use_gold_info:Object = {
            module:2,
            action:110,
            request:[Utils.IntUtil],
            response:[[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const use_gold_oil:Object = {
            module:2,
            action:111,
            request:[Utils.IntUtil, Utils.IntUtil],
            response:[Utils.ByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        };
        public static const Actions:Array = ["get_item_basical_infos", "get_empty_grid_number", "get_facture_reel_data", "get_player_role_elixir_data", "dismount_transport", "avatar_card_off", "player_use_grid_reel", "player_use_grid_elixir", "player_get_super_gift", "get_player_role_elixir_record", "player_use_ingot_elixir", "get_player_pack_item_list", "get_player_warehouse_grids", "get_role_equip_list", "change_pack_item_grid", "change_warehouse_item_grid", "drop_pack_grid_item", "drop_warehouse_grid_item", "move_warehouse_grid_item_to_pack", "move_pack_grid_item_to_warehouse", "equip_player_role_item", "remove_player_role_equipment", "get_player_role_equip_list", "player_use_grid_item", "classify_pack", "classify_warehouse", "add_pack_grid", "add_warehouse_grid", "has_level_gift_item", "has_medical_item", "get_npc_item_list", "get_npc_recycle_item_list", "player_sell_item", "player_buy_back_item", "player_buy_npc_item", "lucky_shop_item_list", "lucky_shop_record_list", "buy_lucky_shop_item", "refresh_lucky_shop", "get_equipment_list", "equip_upgrade_stat", "upgrade_equip", "clear_upgrade_cd_time", "open_upgrade_opportunity", "equip_upgrade_stat_list", "player_reel_need_item", "player_equip_use_reel", "get_player_item_facture_reel_data", "permanent_clean_item_update_cd", "get_permanent_clean_item_update_cd", "notify_super_gift_items", "change_attack_item", "change_attack_info", "get_soul", "get_the_item_num", "can_change_list", "get_gold_oil", "can_use_gold_info", "use_gold_oil"];

    }
}//package com.protocols 
