//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_ServerWar {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_race_step, _arg1.serverWar.get_race_step);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_standings, _arg1.serverWar.get_standings);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_race_list, _arg1.serverWar.get_race_list);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_war_result_list, _arg1.serverWar.get_war_result_list);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_race_standings, _arg1.serverWar.get_race_standings);
            _arg1.registerDataCallback(Mod_ServerWar_Base.apply, _arg1.serverWar.apply);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_player_bet, _arg1.serverWar.get_player_bet);
            _arg1.registerDataCallback(Mod_ServerWar_Base.bet, _arg1.serverWar.bet);
            _arg1.registerDataCallback(Mod_ServerWar_Base.get_bet_coin_rank, _arg1.serverWar.get_bet_coin_rank);
        }

    }
}//package com.protocols 
