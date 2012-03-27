//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Farm {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Farm_Base.get_farmlandinfo_list, _arg1.farm.get_farmlandinfo_list);
            _arg1.registerDataCallback(Mod_Farm_Base.get_player_roleinfo_list, _arg1.farm.get_player_roleinfo_list);
            _arg1.registerDataCallback(Mod_Farm_Base.get_herbs_seed, _arg1.farm.get_herbs_seed);
            _arg1.registerDataCallback(Mod_Farm_Base.refresh_herbs_seed, _arg1.farm.refresh_herbs_seed);
            _arg1.registerDataCallback(Mod_Farm_Base.get_top_herbs_seed, _arg1.farm.get_top_herbs_seed);
            _arg1.registerDataCallback(Mod_Farm_Base.plant_herbs, _arg1.farm.plant_herbs);
            _arg1.registerDataCallback(Mod_Farm_Base.reclamation, _arg1.farm.reclamation);
            _arg1.registerDataCallback(Mod_Farm_Base.harvest, _arg1.farm.harvest);
            _arg1.registerDataCallback(Mod_Farm_Base.check_role_state, _arg1.farm.check_role_state);
            _arg1.registerDataCallback(Mod_Farm_Base.get_simple_farmlandinfo, _arg1.farm.get_simple_farmlandinfo);
            _arg1.registerDataCallback(Mod_Farm_Base.clear_farmland_cd, _arg1.farm.clear_farmland_cd);
            _arg1.registerDataCallback(Mod_Farm_Base.buy_coin_tree_count_info, _arg1.farm.buy_coin_tree_count_info);
            _arg1.registerDataCallback(Mod_Farm_Base.buy_coin_tree_count, _arg1.farm.buy_coin_tree_count);
            _arg1.registerDataCallback(Mod_Farm_Base.coin_tree_count_notify, _arg1.farm.coin_tree_count_notify);
            _arg1.registerDataCallback(Mod_Farm_Base.ingot_for_farmland, _arg1.farm.ingot_for_farmland);
            _arg1.registerDataCallback(Mod_Farm_Base.up_farmland_level, _arg1.farm.up_farmland_level);
        }

    }
}//package com.protocols 
