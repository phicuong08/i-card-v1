//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.haloer.data.*;

    public class CampWarController extends Base {

        public function openCampWar():Object{
            return (this._data.campWar.openCampWar());
        }
        public function getCurrentCampOpenTime():Object{
            var _local1:Array = this._data.campWar.getCampOpenTime();
            var _local2:Object = {
                start_time:0,
                end_time:0
            };
            var _local3:int = _ctrl.player.serverTime;
            var _local4:Boolean;
            var _local5:Object = {};
            for each (_local5 in _local1) {
                if ((((_local5["start_time"] <= _local3)) && ((_local5["end_time"] >= _local3)))){
                    _local2["start_time"] = (_local5["start_time"] - _local3);
                    _local2["end_time"] = (_local5["end_time"] - _local3);
                    _local4 = true;
                    break;
                };
            };
            if (!_local4){
                for each (_local5 in _local1) {
                    if (_local3 <= _local5["start_time"]){
                        _local2["start_time"] = (_local5["start_time"] - _local3);
                        _local2["end_time"] = (_local5["end_time"] - _local3);
                        _local4 = true;
                        break;
                    };
                };
            };
            if (((!(_local4)) && ((_local1.length > 0)))){
                _local5 = (_local1[0] as Object);
                _local2["start_time"] = (_local5["start_time"] - _local3);
                _local2["end_time"] = (_local5["end_time"] - _local3);
            };
            return (_local2);
        }
        public function getCampOpenTime():Array{
            var _local3:Object;
            var _local1:Array = this._data.campWar.getCampOpenTime();
            var _local2:int = this._ctrl.player.serverTime;
            for each (_local3 in _local1) {
                _local3["start_time"] = (_local3["start_time"] - _local2);
                _local3["end_time"] = (_local3["end_time"] - _local2);
            };
            Helper.output(_local2);
            Helper.output(Dumper(_local1));
            return (_local1);
        }
        public function getIsOpenCampWar():int{
            var _local6:Object;
            var _local1:int = this._data.campWar.getIsOpenCampWar();
            if (_local1 == 1){
                return (_local1);
            };
            var _local2:Array = this._data.campWar.getCampOpenTime();
            var _local3:Boolean;
            var _local4:Boolean;
            var _local5:int = this._ctrl.player.serverTime;
            for each (_local6 in _local2) {
                if (_local6["start_time"] < _local5){
                    _local3 = false;
                };
                if (_local6["end_time"] > _local5){
                    _local4 = false;
                };
            };
            if (_local3){
                _local1 = 0;
                return (_local1);
            };
            if (_local4){
                _local1 = 2;
                return (_local1);
            };
            return (_local1);
        }
        public function getCampPlayer():Array{
            return (this._data.campWar.getCampPlayer());
        }
        public function getCampLevelArea():Array{
            return (this._data.campWar.getCampLevelArea());
        }
        public function getJoinCampWar():Object{
            return (this._data.campWar.getJoinCampWar());
        }
        public function get warResult():WarData{
            return (this._data.campWar.getWarResult());
        }
        public function get warDetail():Object{
            return (_data.campWar.getWarDetail());
        }
        public function get awardFame():int{
            return (_data.campWar.getAwardFame());
        }
        public function get awardCoin():int{
            return (_data.campWar.getAwardCoin());
        }
        public function getNotifyType():Object{
            return (this._data.campWar.getNotifyType());
        }
        public function getWarReport():Array{
            return (this._data.campWar.getWarReport());
        }
        public function getNotifyTopWinner():Array{
            return (this._data.campWar.getNotifyTopWinner());
        }
        public function getNotifyIntegral():Object{
            return (this._data.campWar.getNotifyIntegral());
        }
        public function getNotifyPlayerCampInfo():Object{
            return (this._data.campWar.getNotifyPlayerCampInfo());
        }
        public function get getWarReportLength():int{
            return (this._data.campWar.getWarReportLength);
        }
        public function get getPlayerStatusDataLength():int{
            return (this._data.campWar.getPlayerStatusDataLength);
        }
        public function getPlayerStatusData():Array{
            return (this._data.campWar.getPlayerStatusData());
        }
        public function buyBuff():Object{
            return (this._data.campWar.buyBuff());
        }
        public function getBuff():Object{
            return (this._data.campWar.getBuff());
        }
        public function setRobot():Object{
            return (this._data.campWar.setRobot());
        }
        public function getRobotStatus():Object{
            return (this._data.campWar.getRobotStatus());
        }

    }
}//package com.controllers 
