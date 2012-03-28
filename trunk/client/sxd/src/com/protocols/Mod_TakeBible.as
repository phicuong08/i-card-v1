//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_TakeBible {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_TakeBible_Base.open_take_bible, _arg1.takeBible.open_take_bible);
            _arg1.registerDataCallback(Mod_TakeBible_Base.close_take_bible, _arg1.takeBible.close_take_bible);
            _arg1.registerDataCallback(Mod_TakeBible_Base.get_take_bible_info, _arg1.takeBible.get_take_bible_info);
            _arg1.registerDataCallback(Mod_TakeBible_Base.apply_friend, _arg1.takeBible.apply_friend);
            _arg1.registerDataCallback(Mod_TakeBible_Base.cancel_apply_friend, _arg1.takeBible.cancel_apply_friend);
            _arg1.registerDataCallback(Mod_TakeBible_Base.approve_apply, _arg1.takeBible.approve_apply);
            _arg1.registerDataCallback(Mod_TakeBible_Base.reject_apply, _arg1.takeBible.reject_apply);
            _arg1.registerDataCallback(Mod_TakeBible_Base.buy_protection, _arg1.takeBible.buy_protection);
            _arg1.registerDataCallback(Mod_TakeBible_Base.refresh, _arg1.takeBible.refresh);
            _arg1.registerDataCallback(Mod_TakeBible_Base.get_player_take_bible, _arg1.takeBible.get_player_take_bible);
            _arg1.registerDataCallback(Mod_TakeBible_Base.start_take_bible, _arg1.takeBible.start_take_bible);
            _arg1.registerDataCallback(Mod_TakeBible_Base.rob, _arg1.takeBible.rob);
            _arg1.registerDataCallback(Mod_TakeBible_Base.notify, _arg1.takeBible.notify);
            _arg1.registerDataCallback(Mod_TakeBible_Base.notify_global, _arg1.takeBible.notify_global);
            _arg1.registerDataCallback(Mod_TakeBible_Base.quickly, _arg1.takeBible.quickly);
            _arg1.registerDataCallback(Mod_TakeBible_Base.get_take_bible_updata_data, _arg1.takeBible.get_take_bible_updata_data);
            _arg1.registerDataCallback(Mod_TakeBible_Base.get_rob_take_bible_cd_time, _arg1.takeBible.get_rob_take_bible_cd_time);
            _arg1.registerDataCallback(Mod_TakeBible_Base.clear_rob_take_bible_cd_time, _arg1.takeBible.clear_rob_take_bible_cd_time);
            _arg1.registerDataCallback(Mod_TakeBible_Base.buy_bless, _arg1.takeBible.buy_bless);
            _arg1.registerDataCallback(Mod_TakeBible_Base.call_rulai, _arg1.takeBible.call_rulai);
            _arg1.registerDataCallback(Mod_TakeBible_Base.get_rulai_open_time, _arg1.takeBible.get_rulai_open_time);
            _arg1.registerDataCallback(Mod_TakeBible_Base.take_bible_info, _arg1.takeBible.take_bible_info);
        }

    }
}//package com.protocols 
