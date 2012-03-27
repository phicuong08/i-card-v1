//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Zodiac {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Zodiac_Base.zodiac_info, _arg1.zodiac.zodiac_info);
            _arg1.registerDataCallback(Mod_Zodiac_Base.challenge, _arg1.zodiac.challenge);
        }

    }
}//package com.protocols 
