//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_WarReport {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_WarReport_Base.record_war_report, new Function());
        }

    }
}//package com.protocols 
