//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Practice {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Practice_Base.quickly, _arg1.practice.quickly);
            _arg1.registerDataCallback(Mod_Practice_Base.quickly_all, _arg1.practice.quickly_all);
        }

    }
}//package com.protocols 
