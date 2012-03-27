//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Item {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Item_Base.dismount_transport, _arg1.item.dismount_transport);
            _arg1.registerDataCallback(Mod_Item_Base.avatar_card_off, _arg1.item.avatar_card_off);
            _arg1.registerDataCallback(Mod_Item_Base.classify_pack, _arg1.item.classify_pack);
            _arg1.registerDataCallback(Mod_Item_Base.classify_warehouse, _arg1.item.classify_warehouse);
            _arg1.registerDataCallback(Mod_Item_Base.add_pack_grid, _arg1.item.add_pack_grid);
            _arg1.registerDataCallback(Mod_Item_Base.add_warehouse_grid, _arg1.item.add_warehouse_grid);
            _arg1.registerDataCallback(Mod_Item_Base.get_empty_grid_number, _arg1.item.get_empty_grid_number);
            _arg1.registerDataCallback(Mod_Item_Base.get_item_basical_infos, _arg1.item.get_item_basical_infos);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_warehouse_grids, _arg1.item.get_player_warehouse_grids);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_pack_item_list, _arg1.item.get_player_pack_item_list);
            _arg1.registerDataCallback(Mod_Item_Base.get_role_equip_list, _arg1.item.get_role_equip_list);
            _arg1.registerDataCallback(Mod_Item_Base.get_npc_item_list, _arg1.item.get_npc_item_list);
            _arg1.registerDataCallback(Mod_Item_Base.get_npc_recycle_item_list, _arg1.item.get_npc_recycle_item_list);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_role_equip_list, _arg1.item.get_player_role_equip_list);
            _arg1.registerDataCallback(Mod_Item_Base.change_pack_item_grid, _arg1.item.change_pack_item_grid);
            _arg1.registerDataCallback(Mod_Item_Base.change_warehouse_item_grid, _arg1.item.change_warehouse_item_grid);
            _arg1.registerDataCallback(Mod_Item_Base.move_pack_grid_item_to_warehouse, _arg1.item.move_pack_grid_item_to_warehouse);
            _arg1.registerDataCallback(Mod_Item_Base.move_warehouse_grid_item_to_pack, _arg1.item.move_warehouse_grid_item_to_pack);
            _arg1.registerDataCallback(Mod_Item_Base.drop_pack_grid_item, _arg1.item.drop_pack_grid_item);
            _arg1.registerDataCallback(Mod_Item_Base.drop_warehouse_grid_item, _arg1.item.drop_warehouse_grid_item);
            _arg1.registerDataCallback(Mod_Item_Base.remove_player_role_equipment, _arg1.item.remove_player_role_equipment);
            _arg1.registerDataCallback(Mod_Item_Base.equip_player_role_item, _arg1.item.equip_player_role_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_buy_npc_item, _arg1.item.player_buy_npc_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_sell_item, _arg1.item.player_sell_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_buy_back_item, _arg1.item.player_buy_back_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_use_grid_item, _arg1.item.player_use_grid_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_use_grid_reel, _arg1.item.player_use_grid_reel);
            _arg1.registerDataCallback(Mod_Item_Base.player_use_grid_elixir, _arg1.item.player_use_grid_elixir);
            _arg1.registerDataCallback(Mod_Item_Base.get_facture_reel_data, _arg1.item.get_facture_reel_data);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_role_elixir_data, _arg1.item.get_player_role_elixir_data);
            _arg1.registerDataCallback(Mod_Item_Base.has_level_gift_item, _arg1.item.has_level_gift_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_get_super_gift, _arg1.item.player_get_super_gift);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_role_elixir_record, _arg1.item.get_player_role_elixir_record);
            _arg1.registerDataCallback(Mod_Item_Base.player_use_ingot_elixir, _arg1.item.player_use_ingot_elixir);
            _arg1.registerDataCallback(Mod_Item_Base.player_reel_need_item, _arg1.item.player_reel_need_item);
            _arg1.registerDataCallback(Mod_Item_Base.player_equip_use_reel, _arg1.item.player_equip_use_reel);
            _arg1.registerDataCallback(Mod_Item_Base.get_player_item_facture_reel_data, _arg1.item.get_player_item_facture_reel_data);
            _arg1.registerDataCallback(Mod_Item_Base.notify_super_gift_items, _arg1.item.notify_super_gift_items);
            _arg1.registerDataCallback(Mod_Item_Base.change_attack_info, _arg1.item.change_attack_info);
            _arg1.registerDataCallback(Mod_Item_Base.change_attack_item, _arg1.item.change_attack_item);
            _arg1.registerDataCallback(Mod_Item_Base.can_change_list, _arg1.item.can_change_list);
            _arg1.registerDataCallback(Mod_Item_Base.can_use_gold_info, _arg1.item.can_use_gold_info);
            _arg1.registerDataCallback(Mod_Item_Base.use_gold_oil, _arg1.item.use_gold_oil);
            _arg1.registerDataCallback(Mod_Item_Base.get_equipment_list, _arg1.upgrade.get_equipment_list);
            _arg1.registerDataCallback(Mod_Item_Base.equip_upgrade_stat, _arg1.upgrade.equip_upgrade_stat);
            _arg1.registerDataCallback(Mod_Item_Base.upgrade_equip, _arg1.upgrade.upgrade_equip);
            _arg1.registerDataCallback(Mod_Item_Base.clear_upgrade_cd_time, _arg1.upgrade.clear_upgrade_cd_time);
            _arg1.registerDataCallback(Mod_Item_Base.open_upgrade_opportunity, _arg1.upgrade.open_upgrade_opportunity);
            _arg1.registerDataCallback(Mod_Item_Base.equip_upgrade_stat_list, _arg1.upgrade.equip_upgrade_stat_list);
            _arg1.registerDataCallback(Mod_Item_Base.permanent_clean_item_update_cd, _arg1.upgrade.permanent_clean_item_update_cd);
            _arg1.registerDataCallback(Mod_Item_Base.get_permanent_clean_item_update_cd, _arg1.upgrade.get_permanent_clean_item_update_cd);
            _arg1.registerDataCallback(Mod_Item_Base.lucky_shop_item_list, _arg1.luckyShop.lucky_shop_item_list);
            _arg1.registerDataCallback(Mod_Item_Base.lucky_shop_record_list, _arg1.luckyShop.lucky_shop_record_list);
            _arg1.registerDataCallback(Mod_Item_Base.buy_lucky_shop_item, _arg1.luckyShop.buy_lucky_shop_item);
            _arg1.registerDataCallback(Mod_Item_Base.refresh_lucky_shop, _arg1.luckyShop.refresh_lucky_shop);
            _arg1.registerDataCallback(Mod_Item_Base.get_soul, _arg1.item.get_soul);
            _arg1.registerDataCallback(Mod_Item_Base.get_the_item_num, _arg1.item.get_the_item_num);
            _arg1.registerDataCallback(Mod_Item_Base.get_gold_oil, _arg1.item.get_gold_oil);
        }

    }
}//package com.protocols 
