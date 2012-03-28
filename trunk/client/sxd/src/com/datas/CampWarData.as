//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.data.mission.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;

    public class CampWarData extends Base {

        private var _aryGetCampOpenTime:Array;
        private var _intIsOpenCampWar:int;
        private var _aryGetPlayerCampWarInfo:Array;
        private var _aryJoinCampWar:Array;
        private var _warData:WarData;
        private var _warDetail:Object;
        private var _awardFame:int;
        private var _awardCoin:int;
        private var _aryNotify:Array;
        private var _aryGetIntegral:Array;
        private var _aryGetCampPlayer:Array;
        private var _aryNotifyReport:Array;
        private var _aryOpenCampWar:Array;
        private var _aryCampLevelArea:Array;
        private var _aryCampPlayerList:Array;
        private var _objBuyBuff:Object;
        private var _objGetBuff:Object;
        private var _objSetRobot:Object;
        private var _objGetRobotStatus:Object;
        private var _objNotifyType:Object;
        private var _aryNotifyTopWinner:Array;
        private var _aryNotifyIntegral:Array;
        public var _aryPlayStatusData:Array;

        public function CampWarData(){
            this._aryGetCampOpenTime = [];
            this._aryGetPlayerCampWarInfo = [];
            this._aryJoinCampWar = [];
            this._aryNotify = [];
            this._aryGetIntegral = [];
            this._aryGetCampPlayer = [];
            this._aryNotifyReport = [];
            this._aryOpenCampWar = [];
            this._aryCampLevelArea = [];
            this._aryCampPlayerList = [];
            this._objBuyBuff = {};
            this._objGetBuff = {};
            this._objSetRobot = {};
            this._objGetRobotStatus = {};
            this._objNotifyType = {};
            this._aryNotifyTopWinner = [];
            this._aryNotifyIntegral = [];
            this._aryPlayStatusData = [];
            super();
        }
        public function openCampWar():Object{
            var _local1:Object = {};
            oObject.list(this._aryOpenCampWar, _local1, ["top_player_id", "top_player_nick_name", "top_win_times", "camp_id", "shushan_integral", "kunlun_integral", "max_win_times", "win_times", "current_win_times", "lose_times", "get_fame", "get_coin", "status"]);
            _local1["top_player_nick_name"] = this._data.player.removeNickNameSuffix(_local1["top_player_nick_name"]);
            return (_local1);
        }
        public function getCampOpenTime():Array{
            return (this._aryGetCampOpenTime);
        }
        public function getIsOpenCampWar():int{
            return (this._intIsOpenCampWar);
        }
        public function getCampPlayer():Array{
            return (this._aryCampPlayerList);
        }
        public function getCampLevelArea():Array{
            return (this._aryCampLevelArea);
        }
        public function getJoinCampWar():Object{
            var _local1:Object = {result:this._aryJoinCampWar[0]};
            return (_local1);
        }
        public function getWarResult():WarData{
            return (this._warData);
        }
        public function getWarDetail():Object{
            return (this._warDetail);
        }
        public function getAwardFame():int{
            return (this._awardFame);
        }
        public function getAwardCoin():int{
            return (this._awardCoin);
        }
        public function getNotifyType():Object{
            return (this._objNotifyType);
        }
        public function getNotifyTopWinner():Array{
            var _local1:Object;
            var _local3:Array;
            var _local2:Array = [];
            for each (_local3 in this._aryNotifyTopWinner) {
                _local1 = {};
                oObject.list(_local3, _local1, ["min_level", "max_level", "top_player_id", "top_player_nick_name", "top_win_times", "camp_id"]);
                _local1["top_player_nick_name"] = this._data.player.removeNickNameSuffix(_local1["top_player_nick_name"]);
                _local2.push(_local1);
            };
            return (_local2);
        }
        public function getNotifyIntegral():Object{
            var _local1:Object = {};
            oObject.list(this._aryNotifyIntegral, _local1, ["shushan_integral", "kunlun_integral", "win_camp_id"]);
            return (_local1);
        }
        public function getNotifyPlayerCampInfo():Object{
            var _local1:Object = {};
            oObject.list(this._aryNotify[4][0], _local1, ["max_win_times", "win_times", "current_win_times", "lose_times", "get_fame", "get_coin", "status"]);
            return (_local1);
        }
        public function getWarReport():Array{
            var _local1:Array = this._aryNotifyReport.slice(0);
            this._aryNotifyReport = [];
            return (_local1);
        }
        public function get getWarReportLength():int{
            return (this._aryNotifyReport.length);
        }
        public function get getPlayerStatusDataLength():int{
            return (this._aryPlayStatusData.length);
        }
        public function getPlayerStatusData():Array{
            var _local1:Array = this._aryPlayStatusData.slice(0);
            this._aryPlayStatusData = [];
            return (_local1);
        }
        public function buyBuff():Object{
            return (this._objBuyBuff);
        }
        public function getBuff():Object{
            return (this._objGetBuff);
        }
        public function setRobot():Object{
            return (this._objSetRobot);
        }
        public function getRobotStatus():Object{
            return (this._objGetRobotStatus);
        }
        private function testPlayerData():Array{
            var _local1:Array = [{
                min_level:40,
                max_level:80,
                player_id:Math.ceil((Math.random() * 1000)),
                player_nick_name:"t11",
                status:Mod_CampWar_Base.JOIN_CAMP_WAR,
                camp_id:FactionType.ShuShanCheng
            }];
            return (_local1);
        }
        private function testReportData():Array{
            var _local1:Array = [{
                winner_player_id:41,
                loser_player_id:60,
                winner_nick_name:"no me",
                loser_nick_name:"no you",
                winner_camp_id:3,
                loser_camp_id:4,
                win_times:3,
                winner_get_fame:20,
                winner_get_coin:1000,
                loser_get_fame:10,
                loser_get_coin:500,
                loser_win_times:2
            }];
            return (_local1);
        }
        public function get_camp_open_time(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this._aryGetCampOpenTime = [];
            for each (_local3 in _arg1[1]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["start_time", "end_time"]);
                this._aryGetCampOpenTime.push(_local2);
            };
            this._aryGetCampOpenTime.sortOn("start_time", Array.NUMERIC);
            this._intIsOpenCampWar = (_arg1[0] as int);
        }
        public function open_camp_war(_arg1:Array):void{
            this._aryOpenCampWar = _arg1;
        }
        public function close_camp_war():void{
        }
        public function get_camp_player(_arg1:Array):void{
            var _local2:Object;
            var _local3:Object;
            var _local4:Array;
            var _local5:Array;
            this._aryCampLevelArea = [];
            this._aryCampPlayerList = [];
            for each (_local4 in _arg1[1]) {
                _local2 = {};
                _local2["camp_id"] = _arg1[0];
                _local2["min_level"] = _local4[0];
                _local2["max_level"] = _local4[1];
                _local2["length"] = (_local4[2] as Array).length;
                this._aryCampLevelArea.push(_local2);
                for each (_local5 in _local4[2]) {
                    _local3 = {};
                    _local3["min_level"] = _local4[0];
                    _local3["max_level"] = _local4[1];
                    oObject.list(_local5, _local3, ["player_id", "player_nick_name", "status"]);
                    _local3["player_nick_name"] = this._data.player.removeNickNameSuffix(_local3["player_nick_name"]);
                    this._aryCampPlayerList.push(_local3);
                };
            };
            this._aryCampLevelArea.sortOn("min_level", Array.DESCENDING);
        }
        public function join_camp_war(_arg1:Array):void{
            this._aryJoinCampWar = _arg1;
        }
        public function exit_camp_war():void{
        }
        public function get_war_result(_arg1:Array):void{
            var _local2:Array = [0, 0, 0, _arg1[0]];
            this._warData = new WarData();
            this._warData.format(_local2);
            this._awardFame = _arg1[1];
            this._awardCoin = _arg1[2];
            this._warDetail = {
                attackerCurWinTop:_arg1[3],
                attackerWinTop:_arg1[4],
                defenderCurWinTop:_arg1[5],
                defenderWinTop:_arg1[6],
                attackerInspire:_arg1[7],
                defenderInspire:_arg1[8]
            };
        }
        public function notify(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this._objNotifyType = {notify_type:_arg1[0]};
            if ((((((_arg1[0] == Mod_CampWar_Base.PLAYER_JOIN_CAMP_WAR)) || ((_arg1[0] == Mod_CampWar_Base.PLAYER_EXIT_CAMP_WAR)))) || ((_arg1[0] == Mod_CampWar_Base.UPDATE_PLAYER_CAMP_STATUS)))){
                if (this._aryPlayStatusData.length > 1500){
                    this._aryPlayStatusData = [];
                };
                _local2 = {};
                for each (_local3 in _arg1[1]) {
                    _local2 = {};
                    oObject.list(_local3, _local2, ["player_id", "player_nick_name", "camp_id", "min_level", "max_level", "status"]);
                    _local2["player_nick_name"] = this._data.player.removeNickNameSuffix(_local2["player_nick_name"]);
                    if (_arg1[0] != Mod_CampWar_Base.UPDATE_PLAYER_CAMP_STATUS){
                        _local2["status"] = _arg1[0];
                    };
                    this._aryPlayStatusData.push(_local2);
                };
                if (this._aryNotify.length > 0){
                    this._aryNotify = [];
                };
            } else {
                if ((((_arg1[0] == Mod_CampWar_Base.UPDATE_INTEGRAL)) || ((_arg1[0] == Mod_CampWar_Base.END_CAMP_WAR)))){
                    this._aryNotifyIntegral = _arg1[3][0];
                } else {
                    if (_arg1[0] == Mod_CampWar_Base.UPDATE_TOP_WINNER){
                        this._aryNotifyTopWinner = _arg1[2];
                    } else {
                        this._aryNotify = _arg1;
                    };
                };
            };
        }
        public function get_integral(_arg1:Array):void{
            this._aryGetIntegral = _arg1;
        }
        public function notify_report(_arg1:Array):void{
            var _local3:Array;
            if (this._aryNotifyReport.length > 1000){
                this._aryNotifyReport = [];
            };
            var _local2:Object = {};
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["winner_player_id", "loser_player_id", "winner_nick_name", "loser_nick_name", "winner_camp_id", "loser_camp_id", "win_times", "winner_get_fame", "winner_get_coin", "loser_get_fame", "loser_get_coin", "loser_win_times", "stop_loser_win_fame"]);
                _local2["winner_nick_name"] = this._data.player.removeNickNameSuffix(_local2["winner_nick_name"]);
                _local2["loser_nick_name"] = this._data.player.removeNickNameSuffix(_local2["loser_nick_name"]);
                this._aryNotifyReport.push(_local2);
            };
        }
        public function finish_war(_arg1:Array):void{
        }
        public function buy_buff(_arg1:Array):void{
            oObject.list(_arg1, this._objBuyBuff, ["result", "add_buff_value", "buff_value"]);
        }
        public function get_buff(_arg1:Array):void{
            this._objGetBuff["buff_value"] = _arg1[0];
        }
        public function set_robot(_arg1:Array):void{
            this._objSetRobot["result"] = _arg1[0];
        }
        public function get_robot_status(_arg1:Array):void{
            oObject.list(_arg1, this._objGetRobotStatus, ["result", "last_award_coin", "last_award_fame"]);
        }

    }
}//package com.datas 
