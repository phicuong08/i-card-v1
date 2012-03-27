//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_HeroesWar {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_heroes_open_time, _arg1.heroesWar.get_heroes_open_time);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.open_heroes_war, _arg1.heroesWar.open_heroes_war);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.close_heroes_war, _arg1.heroesWar.close_heroes_war);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_heroes_player, _arg1.heroesWar.get_heroes_player);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.join_heroes_war, _arg1.heroesWar.join_heroes_war);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.exit_heroes_war, _arg1.heroesWar.exit_heroes_war);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_war_result, _arg1.heroesWar.get_war_result);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.notify, _arg1.heroesWar.notify);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.notify_report, _arg1.heroesWar.notify_report);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.finish_war, _arg1.heroesWar.finish_war);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.buy_buff, _arg1.heroesWar.buy_buff);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_buff, _arg1.heroesWar.get_buff);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.set_robot, _arg1.heroesWar.set_robot);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_robot_status, _arg1.heroesWar.get_robot_status);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.get_war_mode, _arg1.heroesWar.get_war_mode);
            _arg1.registerDataCallback(Mod_HeroesWar_Base.notify_first_open_heroes_war, _arg1.heroesWar.notify_first_open_heroes_war);
        }

    }
}//package com.protocols 
