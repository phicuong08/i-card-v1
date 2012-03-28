//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Friend {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Friend_Base.add_friend, _arg1.friend.add_friend);
            _arg1.registerDataCallback(Mod_Friend_Base.add_to_black, _arg1.friend.add_to_black);
            _arg1.registerDataCallback(Mod_Friend_Base.get_group, _arg1.friend.get_group);
            _arg1.registerDataCallback(Mod_Friend_Base.delete_friend, _arg1.friend.delete_friend);
            _arg1.registerDataCallback(Mod_Friend_Base.get_friend_list, _arg1.friend.get_friend_list);
            _arg1.registerDataCallback(Mod_Friend_Base.get_friend_details_info, _arg1.friend.get_friend_details_info);
            _arg1.registerDataCallback(Mod_Friend_Base.get_playerinfo, _arg1.friend.get_Playerinfo);
            _arg1.registerDataCallback(Mod_Friend_Base.get_friendinfo_chatrecord_list, _arg1.friend.get_friendinfo_chatrecord_list);
            _arg1.registerDataCallback(Mod_Friend_Base.notify_message_count, _arg1.friend.notify_message_count);
            _arg1.registerDataCallback(Mod_Friend_Base.notify_online_state, _arg1.friend.notify_online_state);
            _arg1.registerDataCallback(Mod_Friend_Base.send_message_to_friend, _arg1.friend.send_message_to_friend);
            _arg1.registerDataCallback(Mod_Friend_Base.receive_message_from_friend, _arg1.friend.receive_message_from_friend);
            _arg1.registerDataCallback(Mod_Friend_Base.check_receive_message, _arg1.friend.receive_message_from_friend);
            _arg1.registerDataCallback(Mod_Friend_Base.get_unreceive_friend_list, _arg1.friend.get_unreceive_friend_list);
            _arg1.registerDataCallback(Mod_Friend_Base.get_listeners, _arg1.friend.get_listeners);
            _arg1.registerDataCallback(Mod_Friend_Base.message_box_list, _arg1.friend.message_box_list);
            _arg1.registerDataCallback(Mod_Friend_Base.notify_enter_state, _arg1.friend.notify_enter_state);
            _arg1.registerDataCallback(Mod_Friend_Base.receive_friend_enter_state, _arg1.friend.receive_friend_enter_state);
            _arg1.registerDataCallback(Mod_Friend_Base.vip_player_list, _arg1.friend.vip_player_list);
        }

    }
}//package com.protocols 
