//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.protocols.*;
    import com.lang.client.com.controllers.*;

    public class TravelEventController extends Base {

        private var _activityInfo:Array;
        private var _eventAndAnswer:Array;
        private var _travelEvent:Array;

        public function get activityInfo():Object{
            var _local1:Array = _data.travelEvent.activityInfo;
            var _local2:Object = this.renderActivityInfo(_local1);
            return (_local2);
        }
        public function get eventAndAnswer():Object{
            var _local1:Array = _data.travelEvent.eventAndAnswer;
            var _local2:Object = {};
            _local2.eventId = _local1[0];
            _local2.event = _local1[1];
            _local2.answerList = this.renderAnswer(_local1[2]);
            _local2.msg = _local1[3];
            return (_local2);
        }
        public function get cancelCd():Object{
            var _local1:Object = {};
            var _local2:Array = _data.travelEvent.cancelCd;
            _local1.msg = _local2[0];
            return (_local1);
        }
        private function renderAnswer(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.answerId = _arg1[_local4][0];
                _local5.answerSign = _arg1[_local4][1];
                _local5.eventAnswer = _arg1[_local4][2];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get answer():Object{
            var _local1:Array = _data.travelEvent.travelEvent;
            var _local2:String = _local1[0];
            var _local3:Object = {};
            _local3.answer = TravelEventControllerLang.AnswerInfo;
            _local3.answerValue = this.renderAward(_local1[1], _local3);
            var _local4:Array = [];
            _local4[0] = _local1[2];
            _local4[1] = _local1[3];
            _local4[2] = _local1[4];
            _local4[3] = _local1[5];
            _local3.activityInfo = this.renderActivityInfo(_local4);
            return (_local3);
        }
        private function renderActivityInfo(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.joinCount = _arg1[0];
            _local2.totalCount = _arg1[1];
            _local2.cdTimer = _arg1[2];
            _local2.cdIngot = _arg1[3];
            _local2.info = (((((TravelEventControllerLang.TravelEvent + "（") + _local2.joinCount) + "/") + _local2.totalCount) + "）");
            if (_local2.cdTimer <= 0){
                _local2.cdIngotInfo = TravelEventControllerLang.TravelEventOpen;
                _local2.isShow = false;
            } else {
                _local2.cdIngotInfo = (("<font color=\"#ff9900\">" + Lang.sprintf(TravelEventControllerLang.ClearCd, _local2.cdIngot)) + "</font>");
                _local2.isShow = true;
            };
            if (_local2.joinCount >= _local2.totalCount){
                _local2.isEnd = true;
            } else {
                _local2.isEnd = false;
            };
            return (_local2);
        }
        private function renderAward(_arg1:Array, _arg2:Object):Array{
            var _local6:Object;
            var _local7:int;
            var _local3:Array = [];
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = {};
                _local7 = _arg1[_local5][1];
                switch (_arg1[_local5][0]){
                    case Mod_TravelEvent_Base.COIN:
                        _local6.type = TravelEventControllerLang.Coin;
                        break;
                    case Mod_TravelEvent_Base.EXP:
                        _local6.type = TravelEventControllerLang.Exp;
                        break;
                    case Mod_TravelEvent_Base.FAME:
                        _local6.type = TravelEventControllerLang.Fame;
                        break;
                    case Mod_TravelEvent_Base.POWER:
                        _local6.type = TravelEventControllerLang.Power;
                        break;
                    case Mod_TravelEvent_Base.SKILL:
                        _local6.type = TravelEventControllerLang.Skill;
                        break;
                };
                if (_arg1[_local5][1] > 0){
                    _local6.color = 0xFFF200;
                    _local6.info = (((TravelEventControllerLang.Get + _local6.type) + " ") + _local7);
                    _arg2.answer = (_arg2.answer + ((" " + _local7) + _local6.type));
                };
                if (_arg1[_local5][1] < 0){
                    _local6.color = 0xFF0000;
                    _local6.info = (((TravelEventControllerLang.Loss + _local6.type) + " ") + _local7);
                    _arg2.answer = (_arg2.answer + ((" " + _local7) + _local6.type));
                };
                _local6.baseType = ((_local6.type + " ") + _local7);
                if (_arg1[_local5][1] != 0){
                    _local3.push(_local6);
                };
                _local5++;
            };
            return (_local3);
        }

    }
}//package com.controllers 
