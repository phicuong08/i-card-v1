//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_TravelEvent {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_TravelEvent_Base.get_activity_info, _arg1.travelEvent.get_activity_info);
            _arg1.registerDataCallback(Mod_TravelEvent_Base.get_event_and_answer, _arg1.travelEvent.get_event_and_answer);
            _arg1.registerDataCallback(Mod_TravelEvent_Base.answer_travel_event, _arg1.travelEvent.answer_travel_event);
            _arg1.registerDataCallback(Mod_TravelEvent_Base.cancel_cd, _arg1.travelEvent.cancel_cd);
        }

    }
}//package com.protocols 
