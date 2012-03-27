//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.haloer.data.*;

    public class HeroesWarController extends Base {

        public function openHeroesWar():Object{
            return (this._data.heroesWar.openHeroesWar());
        }
        public function getCurrentHeroesOpenTime():Object{
            var _local1:Array = this._data.heroesWar.getHeroesOpenTime();
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
        public function getHeroesOpenTime():Array{
            var _local3:Object;
            var _local1:Array = this._data.heroesWar.getHeroesOpenTime();
            var _local2:int = this._ctrl.player.serverTime;
            for each (_local3 in _local1) {
                _local3["start_time"] = (_local3["start_time"] - _local2);
                _local3["end_time"] = (_local3["end_time"] - _local2);
            };
            Helper.output(_local2);
            Helper.output(Dumper(_local1));
            return (_local1);
        }
        public function getIsOpenHeroesWar():int{
            var _local6:Object;
            var _local1:int = this._data.heroesWar.getIsOpenHeroesWar();
            if (_local1 == 1){
                return (_local1);
            };
            var _local2:Array = this._data.heroesWar.getHeroesOpenTime();
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
        public function getHeroesPlayer():Array{
            return (this._data.heroesWar.getHeroesPlayer());
        }
        public function getHeroesLevelArea():Array{
            return (this._data.heroesWar.getHeroesLevelArea());
        }
        public function getJoinHeroesWar():Object{
            return (this._data.heroesWar.getJoinHeroesWar());
        }
        public function get warResult():WarData{
            return (this._data.heroesWar.getWarResult());
        }
        public function get warDetail():Object{
            return (_data.heroesWar.getWarDetail());
        }
        public function get awardFame():int{
            return (_data.heroesWar.getAwardFame());
        }
        public function get awardCoin():int{
            return (_data.heroesWar.getAwardCoin());
        }
        public function getNotifyType():Object{
            return (this._data.heroesWar.getNotifyType());
        }
        public function getWarReport():Array{
            return (this._data.heroesWar.getWarReport());
        }
        public function getNotifyTopWinner():Array{
            return (this._data.heroesWar.getNotifyTopWinner());
        }
        public function getNotifyIntegral():Object{
            return (this._data.campWar.getNotifyIntegral());
        }
        public function getNotifyPlayerHeroesInfo():Object{
            return (this._data.heroesWar.getNotifyPlayerHeroesInfo());
        }
        public function get getWarReportLength():int{
            return (this._data.heroesWar.getWarReportLength);
        }
        public function get getPlayerStatusDataLength():int{
            return (this._data.heroesWar.getPlayerStatusDataLength);
        }
        public function getPlayerStatusData():Array{
            return (this._data.heroesWar.getPlayerStatusData());
        }
        public function buyBuff():Object{
            return (this._data.heroesWar.buyBuff());
        }
        public function getBuff():Object{
            return (this._data.heroesWar.getBuff());
        }
        public function setRobot():Object{
            return (this._data.heroesWar.setRobot());
        }
        public function getRobotStatus():Object{
            return (this._data.heroesWar.getRobotStatus());
        }
        public function get getWarMode():Object{
            return (this._data.heroesWar.getWarMode());
        }
        public function get notifyFirstOpenHeroesWar():Object{
            return (this._data.heroesWar.notifyFirstOpenHeroesWar());
        }

    }
}//package com.controllers 
