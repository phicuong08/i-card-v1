//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_SendFlower {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_SendFlower_Base.player_send_flower_info, _arg1.sendFlower.player_send_flower_info);
            _arg1.registerDataCallback(Mod_SendFlower_Base.send_player_flower, _arg1.sendFlower.send_player_flower);
            _arg1.registerDataCallback(Mod_SendFlower_Base.send_flower_ranking, _arg1.sendFlower.send_flower_ranking);
        }

    }
}//package com.protocols 
