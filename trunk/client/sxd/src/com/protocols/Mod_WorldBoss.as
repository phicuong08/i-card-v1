//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_WorldBoss {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_WorldBoss_Base.get_world_boss_list, _arg1.worldBoss.get_world_boss_list);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.get_world_boss_data, _arg1.worldBoss.get_world_boss_data);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.get_defeat_record_list, _arg1.worldBoss.get_defeat_record_list);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.fight_world_boss, _arg1.worldBoss.fight_world_boss);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.clear_death_cd, _arg1.worldBoss.clear_death_cd);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.reset_death_cd, _arg1.worldBoss.reset_death_cd);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.super_reborn, _arg1.worldBoss.super_reborn);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.strengthen_combat, _arg1.worldBoss.strengthen_combat);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.hurt_world_boss, _arg1.worldBoss.hurt_world_boss);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.player_death_cd, _arg1.worldBoss.player_death_cd);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.open_world_boss, _arg1.worldBoss.open_world_boss);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.close_world_boss, _arg1.worldBoss.close_world_boss);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.defeat_world_boss, _arg1.worldBoss.defeat_world_boss);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.update_world_boss_position, _arg1.worldBoss.update_world_boss_position);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.player_world_boss_buff, _arg1.worldBoss.player_world_boss_buff);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.select_faction_boss_time, _arg1.worldBoss.select_faction_boss_time);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.faction_boss_time_list, _arg1.worldBoss.faction_boss_time_list);
            _arg1.registerDataCallback(Mod_WorldBoss_Base.set_robot, _arg1.worldBoss.set_robot);
        }

    }
}//package com.protocols 
