//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_SealSoul {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_SealSoul_Base.soul_info_by_location, _arg1.sealSoul.soul_info_by_location);
            _arg1.registerDataCallback(Mod_SealSoul_Base.move_soul, _arg1.sealSoul.move_soul);
            _arg1.registerDataCallback(Mod_SealSoul_Base.swap_soul, _arg1.sealSoul.swap_soul);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_item_info_by_role_id, _arg1.sealSoul.get_item_info_by_role_id);
            _arg1.registerDataCallback(Mod_SealSoul_Base.open_player_soul_key, _arg1.sealSoul.open_player_soul_key);
            _arg1.registerDataCallback(Mod_SealSoul_Base.soul_attribute_reset, _arg1.sealSoul.soul_attribute_reset);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_tower_key, _arg1.sealSoul.get_tower_key);
            _arg1.registerDataCallback(Mod_SealSoul_Base.sell_player_soul, _arg1.sealSoul.sell_player_soul);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_item_info_by_player_item_id, _arg1.sealSoul.get_item_info_by_player_item_id);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_ten_times_reset_value, _arg1.sealSoul.get_ten_times_reset_value);
            _arg1.registerDataCallback(Mod_SealSoul_Base.set_player_soul_value, _arg1.sealSoul.set_player_soul_value);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_reset_count, _arg1.sealSoul.get_reset_count);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_stone_count, _arg1.sealSoul.get_stone_count);
            _arg1.registerDataCallback(Mod_SealSoul_Base.lock, _arg1.sealSoul.lock);
            _arg1.registerDataCallback(Mod_SealSoul_Base.will_to_unlock, _arg1.sealSoul.will_to_unlock);
            _arg1.registerDataCallback(Mod_SealSoul_Base.notify_get, _arg1.sealSoul.notify_get);
            _arg1.registerDataCallback(Mod_SealSoul_Base.get_day_stone, _arg1.sealSoul.get_day_stone);
            _arg1.registerDataCallback(Mod_SealSoul_Base.day_stone_count, _arg1.sealSoul.day_stone_count);
            _arg1.registerDataCallback(Mod_SealSoul_Base.swap_seal_soul, _arg1.sealSoul.swap_seal_soul);
            _arg1.registerDataCallback(Mod_SealSoul_Base.save_lock, _arg1.sealSoul.save_lock);
        }

    }
}//package com.protocols 
