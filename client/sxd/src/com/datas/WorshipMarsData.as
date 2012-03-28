//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class WorshipMarsData extends Base {

        private var _objMarsInfo:Object;
        private var _aryIncenseLog:Array;
        private var _objIncense:Object;
        private var _objGetBlessingTimesAndExpAdd:Object;
        private var _objGetRemainIncenseTimes:Object;
        private var objIncenseColor:Object;

        public function WorshipMarsData(){
            this._objMarsInfo = {};
            this._aryIncenseLog = [];
            this._objIncense = {};
            this._objGetBlessingTimesAndExpAdd = {};
            this._objGetRemainIncenseTimes = {};
            this.objIncenseColor = {
                1:0xFFFFFF,
                2:44783,
                3:0xFFFF00
            };
            super();
        }
        public function get marsInfo():Object{
            return (this._objMarsInfo);
        }
        public function get incenseLog():Array{
            return (this._aryIncenseLog);
        }
        public function get marsIncense():Object{
            return (this._objIncense);
        }
        public function get getBlessingTimesAndExpAdd():Object{
            return (this._objGetBlessingTimesAndExpAdd);
        }
        public function get getRemainIncenseTimes():Object{
            return (this._objGetRemainIncenseTimes);
        }
        private function sortByTime(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["time"];
            var _local4:int = _arg2["time"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        private function get serverTime():int{
            var _local1:Number = (new Date().getTime() / 1000);
            return ((_local1 - this._data.player.diffServerTime));
        }
        public function mars_info(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this._objMarsInfo = {};
            oObject.list(_arg1, this._objMarsInfo, ["mars_level", "mars_exp", "require_exp", "incense_count", "total_count", "is_cover"]);
            this._aryIncenseLog = [];
            for each (_local3 in _arg1[(_arg1.length - 1)]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["player_id", "player_name", "incense_id", "exp", "time"]);
                _local2["player_name"] = this._data.player.removeNickNameSuffix(_local2["player_name"]);
                _local2["incense_name"] = MarsType.getOfferingName(_local2["incense_id"]);
                _local2["color"] = this.objIncenseColor[_local2["incense_id"]];
                _local2["chinese_time"] = DateTime.formatFromSecond2(_local2["time"], this.serverTime);
                this._aryIncenseLog.push(_local2);
            };
            this._aryIncenseLog.sort(this.sortByTime);
        }
        public function incense(_arg1:Array):void{
            this._objIncense = {result:_arg1[0]};
        }
        public function get_blessing_times_and_exp_add(_arg1:Array):void{
            this._objGetBlessingTimesAndExpAdd = {};
            oObject.list(_arg1, this._objGetBlessingTimesAndExpAdd, ["count", "exp_add"]);
        }
        public function blessing_times_and_exp_add_notify(_arg1:Array):void{
        }
        public function get_remain_incense_times(_arg1:Array):void{
            this._objGetRemainIncenseTimes = {};
            oObject.list(_arg1, this._objGetRemainIncenseTimes, ["remain_incense_times"]);
        }

    }
}//package com.datas 
