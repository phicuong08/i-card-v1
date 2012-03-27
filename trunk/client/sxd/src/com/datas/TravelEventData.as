//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class TravelEventData extends Base {

        private var _activityInfo:Array;
        private var _eventAndAnswer:Array;
        private var _travelEvent:Array;
        private var _cancelCd:Array;

        public function get activityInfo():Array{
            return (this._activityInfo);
        }
        public function get eventAndAnswer():Array{
            return (this._eventAndAnswer);
        }
        public function get travelEvent():Array{
            return (this._travelEvent);
        }
        public function get cancelCd():Array{
            return (this._cancelCd);
        }
        public function get_activity_info(_arg1:Array):void{
            this._activityInfo = _arg1;
        }
        public function get_event_and_answer(_arg1:Array):void{
            this._eventAndAnswer = _arg1;
        }
        public function answer_travel_event(_arg1:Array):void{
            this._travelEvent = _arg1;
        }
        public function cancel_cd(_arg1:Array):void{
            this._cancelCd = _arg1;
        }

    }
}//package com.datas 
