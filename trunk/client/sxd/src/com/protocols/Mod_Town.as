//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Town {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Town_Base.enter_town, _arg1.town.enter_town);
            _arg1.registerDataCallback(Mod_Town_Base.leave_town, _arg1.town.leave_town);
            _arg1.registerDataCallback(Mod_Town_Base.move_to, _arg1.town.move_to);
            _arg1.registerDataCallback(Mod_Town_Base.get_players, _arg1.town.get_players);
            _arg1.registerDataCallback(Mod_Town_Base.player_follow_role_change, _arg1.town.player_follow_role_change);
            _arg1.registerDataCallback(Mod_Town_Base.player_count, _arg1.town.player_count);
        }

    }
}//package com.protocols 
