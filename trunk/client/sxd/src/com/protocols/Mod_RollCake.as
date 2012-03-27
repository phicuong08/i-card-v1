//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_RollCake {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_RollCake_Base.roll, _arg1.rollCake.roll);
            _arg1.registerDataCallback(Mod_RollCake_Base.get_count, _arg1.rollCake.get_count);
            _arg1.registerDataCallback(Mod_RollCake_Base.reroll, _arg1.rollCake.reroll);
            _arg1.registerDataCallback(Mod_RollCake_Base.get_award, _arg1.rollCake.get_award);
            _arg1.registerDataCallback(Mod_RollCake_Base.get_state, _arg1.rollCake.get_state);
        }

    }
}//package com.protocols 
