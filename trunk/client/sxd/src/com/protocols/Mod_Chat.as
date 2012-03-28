//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Chat {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Chat_Base.chat_with_players, _arg1.chat.chat_with_players);
            _arg1.registerDataCallback(Mod_Chat_Base.bro_to_players, _arg1.chat.bro_to_player);
            _arg1.registerDataCallback(Mod_Chat_Base.disable_player_talk, _arg1.chat.disable_player_talk);
            _arg1.registerDataCallback(Mod_Chat_Base.shield_player_talk, _arg1.chat.shield_player_talk);
            _arg1.registerDataCallback(Mod_Chat_Base.shield_player_list, _arg1.chat.shield_player_list);
        }

    }
}//package com.protocols 
