//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Fate {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Fate_Base.get_fate_npc, _arg1.fate.get_fate_npc);
            _arg1.registerDataCallback(Mod_Fate_Base.get_temp_fate, _arg1.fate.get_temp_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.pickup_fate, _arg1.fate.pickup_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.sale_temp_fate, _arg1.fate.sale_temp_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.get_bag_list, _arg1.fate.get_bag_list);
            _arg1.registerDataCallback(Mod_Fate_Base.buy_bag_grid, _arg1.fate.buy_bag_grid);
            _arg1.registerDataCallback(Mod_Fate_Base.get_role_fate_list, _arg1.fate.get_role_fate_list);
            _arg1.registerDataCallback(Mod_Fate_Base.wear_on, _arg1.fate.wear_on);
            _arg1.registerDataCallback(Mod_Fate_Base.wear_off_fate, _arg1.fate.wear_off_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.discard_fate, _arg1.fate.discard_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.appoint_fate_npc, _arg1.fate.appoint_fate_npc);
            _arg1.registerDataCallback(Mod_Fate_Base.change_fate_grid, _arg1.fate.change_fate_grid);
            _arg1.registerDataCallback(Mod_Fate_Base.merge, _arg1.fate.merge_fate);
            _arg1.registerDataCallback(Mod_Fate_Base.change_position, _arg1.fate.change_position);
            _arg1.registerDataCallback(Mod_Fate_Base.get_player_role_fate_power, _arg1.fate.get_player_role_fate_power);
            _arg1.registerDataCallback(Mod_Fate_Base.get_merge_data, _arg1.fate.get_merge_data);
            _arg1.registerDataCallback(Mod_Fate_Base.merge_all_in_bag, _arg1.fate.merge_all_in_bag);
            _arg1.registerDataCallback(Mod_Fate_Base.buy_fate_npc, _arg1.fate.buy_fate_npc);
            _arg1.registerDataCallback(Mod_Fate_Base.exchange_fate, _arg1.fate.exchange_fate);
        }

    }
}//package com.protocols 
