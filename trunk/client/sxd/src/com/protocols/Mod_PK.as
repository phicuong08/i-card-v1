//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_PK {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Pk_Base.start_war, _arg1.pkWar.start_war);
        }

    }
}//package com.protocols 
