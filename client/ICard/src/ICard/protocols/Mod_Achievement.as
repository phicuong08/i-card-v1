//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.protocols {
    import ICard.*;

    public class Mod_Achievement {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Achievement_Base.get_player_achievement_list, _arg1.achievement.get_player_achievement_list);
            _arg1.registerDataCallback(Mod_Achievement_Base.notify_complete_achievement, _arg1.achievement.notify_complete_achievement);
        }

    }
}//package ICard.protocols 
