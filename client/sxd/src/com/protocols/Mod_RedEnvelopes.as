//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_RedEnvelopes {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_RedEnvelopes_Base.get_envelopes_info, _arg1.redEnvelopes.get_envelopes_info);
            _arg1.registerDataCallback(Mod_RedEnvelopes_Base.get_envelope, _arg1.redEnvelopes.get_envelope);
            _arg1.registerDataCallback(Mod_RedEnvelopes_Base.get_date, _arg1.redEnvelopes.get_date);
        }

    }
}//package com.protocols 
