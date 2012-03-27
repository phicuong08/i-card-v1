//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class MultiMissionController extends com.controllers.Base {

        public var ownData:MultiMissionData;
        private var _colorObj:Object;
        private var _limitData:Object;
        public var teamId:int = 0;
        public var playerTeamInfo:Object;
        private var _maxTeamSize:int = 3;
        private var _notifyObject:Object;
        private var _dropTeam:Array;
        private var _updateMemberNumber:Array;

        public function MultiMissionController():void{
            this._colorObj = {
                1:0xFFFFFF,
                2:2272312,
                3:44783,
                4:0xFF00FF,
                5:0xFFF100
            };
            this._limitData = {};
            this.playerTeamInfo = {};
            super();
            this._limitData[Mod_MultipleMission_Base.NOT_LIMIT] = MultiMissionControllerLang.NotLimit;
            this._limitData[Mod_MultipleMission_Base.SAME_CANO] = MultiMissionControllerLang.SameCano;
            this._limitData[Mod_MultipleMission_Base.SAME_GANG] = MultiMissionControllerLang.SameGaon;
        }
        public function get openTeam():Array{
            var _local1:Array = [];
            var _local2:Array = this._data.multiMission.openMission;
            _local1 = this.renderTeam(_local2[0]);
            return (_local1);
        }
        public function get limitCondition():Object{
            var _local1:Object = {};
            var _local2:Array = this._data.multiMission.openMission;
            _local1.createLimit = this.renderLimit(_local2[1]);
            _local1.joinLimit = this.renderLimit(_local2[2], true);
            return (_local1);
        }
        public function get getTeamList():Array{
            var _local1:Array = [];
            var _local2:Array = this._data.multiMission.getTeamList;
            _local1 = this.renderTeam(_local2[0]);
            return (_local1);
        }
        public function get getTeamInfo():Object{
            var _local1:Array = this._data.multiMission.getTeamInfo;
            var _local2:Object = {};
            if (_local1[1].length <= 0){
                _local2.isTeam = false;
                _local2.isTeamLeader = false;
                _local2.teamId = 0;
                this.playerTeamInfo.isPlayerTeam = 0;
            } else {
                _local2.isTeam = true;
                _local2.teamId = _local1[0];
                this.playerTeamInfo.isPlayerTeam = 1;
                this.playerTeamInfo.maxTeamSize = this._maxTeamSize;
                this.playerTeamInfo.teamMemberNumber = _local1[1].length;
                this.renderPlayerTeam(this.playerTeamInfo);
                if (_local1[0] == _data.player.playerId){
                    this.playerTeamInfo.isLeader = true;
                    _local2.isTeamLeader = true;
                } else {
                    this.playerTeamInfo.isLieader = false;
                };
                _local2.teamMemberInfo = this.renderTeamInfo(_local1[1], _local1[0]);
            };
            return (_local2);
        }
        private function renderTeamInfo(_arg1:Array, _arg2:int):Array{
            var _local6:Object;
            var _local7:Array;
            var _local3:int = _arg1.length;
            var _local4:Array = [];
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = {};
                _local7 = _arg1[_local5];
                _local6.id = _local7[0];
                if (_local5 == (_local3 - 1)){
                    _local6.isLastNum = true;
                } else {
                    _local6.isLastNum = false;
                };
                _local6.teamNum = _local5;
                _local6.sign = _local7[2];
                _local6.level = _local7[3];
                _local6.url = URI.getRoleIconUrl(_local6.sign);
                if (_arg2 == _local6.id){
                    _local6.name = ((((((_ctrl.player.removeNickNameSuffix(_local7[1]) + " ") + _local6.level) + MultiMissionControllerLang.Ji) + "[") + MultiMissionControllerLang.Leader) + "]");
                    _local6.isLeader = true;
                } else {
                    _local6.name = (((_ctrl.player.removeNickNameSuffix(_local7[1]) + " ") + _local6.level) + MultiMissionControllerLang.Ji);
                    _local6.isLeader = false;
                };
                _local4.push(_local6);
                _local5++;
            };
            return (_local4);
        }
        public function get createTeam():int{
            var _local1:int = this._data.multiMission.createTeam;
            return (_local1);
        }
        public function get dissolveTeam():Array{
            var _local1:Array = [];
            return (_local1);
        }
        public function get joinTeam():int{
            var _local1:int = this._data.multiMission.joinTeam;
            return (_local1);
        }
        public function get exitTeam():Array{
            var _local1:Array = [];
            return (_local1);
        }
        public function get scotTeam():String{
            var _local1:String = this._data.multiMission.sortTeam;
            return (_local1);
        }
        public function get startWar():int{
            var _local1:Array = this.ownData.startWar;
            var _local2:int = _local1[0];
            return (_local2);
        }
        public function get notify():Object{
            this._notifyObject = this._data.multiMission.notifyHash;
            return (this._notifyObject);
        }
        public function removeNotify(_arg1:int):void{
            delete this._notifyObject[_arg1];
        }
        public function get status():Object{
            var _local5:Array;
            var _local1:Array = this._data.multiMission.getStatus;
            var _local2:Object = {};
            _local2.status = parseInt(_local1[0]);
            _local2.isRemainMission = _local1[2];
            _local2.timer = [];
            var _local3:int = _local1[1].length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _local1[1][_local4];
                _local2.timer[_local4] = {};
                _local2.timer[_local4].startTime = _local5[0];
                _local2.timer[_local4].endTime = _local5[1];
                _local4++;
            };
            return (_local2);
        }
        public function get newTeam():Object{
            var _local1:Array = _data.multiMission.newTeam;
            var _local2:Array = this.renderTeam([_local1]);
            var _local3:Object = _local2[0];
            return (_local3);
        }
        public function get dropTeam():int{
            var _local1:Array = _data.multiMission.dropTeam;
            var _local2:int = _local1[0];
            return (_local2);
        }
        public function get updateMemberNumber():Object{
            var _local1:Array = _data.multiMission.updateMemberNumber;
            var _local2:Object = {};
            _local2.teamId = _local1[0];
            _local2.memberNum = _local1[1];
            return (_local2);
        }
        private function renderTeam(_arg1:Array):Array{
            var _local5:Object;
            var _local6:Object;
            var _local7:int;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                _local6 = {};
                _local6.teamId = _local5[0];
                _local6.multiMissionId = _local5[1];
                _local6.leaderName = _local5[2];
                _local6.masterName = ((MultiMissionControllerLang.Leader + " ") + _ctrl.player.removeNickNameSuffix(_local6.leaderName));
                _local6.teamMemberNumber = _local5[3];
                _local6.maxTeamSize = this._maxTeamSize;
                _local6.missionName = MultipleMissionType.getMissionName(_local6.multiMissionId);
                _local6.awardExperience = MultipleMissionType.getAwardExp(_local6.multiMissionId);
                _local6.awardSkill = MultipleMissionType.getAwardSkill(_local6.multiMissionId);
                _local7 = MultipleMissionType.getAwardItemId(_local6.multiMissionId);
                _local6.awardItemName = ItemType.getName(_local7);
                _local6.quality = ItemType.getItemQualityById(_local7);
                _local6.color = ItemType.getItemColor(_local7);
                _local6.awardInfo = ((((((((((((("<font color=\"#666666\">" + MultiMissionControllerLang.Drop) + "</font>") + "<font color=\"#") + _local6.color.toString(16)) + "\">") + _local6.awardItemName) + "</font>") + "<font color=\"#FF9900\"> ") + MultiMissionControllerLang.Skill) + "</font>") + "<font color=\"#FF9900\">") + _local6.awardSkill) + "</font>");
                _local6.personNumber = (((MultiMissionControllerLang.PersonNum + _local6.teamMemberNumber) + "/") + _local6.maxTeamSize);
                _local6.limitCondition = this._limitData[_local5[4]];
                _local6.conditionName = _local5[5];
                if (_local6.conditionName != ""){
                    _local6.missionInfo = ((((_local6.missionName + "【 ") + MultiMissionControllerLang.Camp) + _local6.conditionName) + "】");
                } else {
                    _local6.missionInfo = _local6.missionName;
                };
                _local6.isCanJoin = _local5[6];
                _local6.playerCamp = this._ctrl.player.campId;
                _local6.leaderCamp = _local5[7];
                _local6.factionName = _local5[8];
                _local6.createTime = _local5[9];
                _local2.push(_local6);
                _local4++;
            };
            return (_local2);
        }
        public function renderPlayerTeam(_arg1:Object):void{
            if (_arg1.teamMemberNumber >= _arg1.maxTeamSize){
                _arg1.txtColor = 0xFFFFFF;
                _arg1.isStart = true;
            } else {
                _arg1.txtColor = 0x33FF00;
                _arg1.isStart = false;
            };
            _arg1.info = (((((((((((((((("<font color=\"#" + _arg1.txtColor.toString(16)) + "\">") + "<u>") + MultiMissionControllerLang.TeamNum) + "(</u>") + "</font>") + "<font color=\"#") + _arg1.txtColor.toString(16)) + "\">") + "<u>") + _arg1.teamMemberNumber) + "/") + _arg1.maxTeamSize) + ")") + "</u>") + "</font>");
        }
        private function colorRender(_arg1:uint):uint{
            var _local2:uint = this._colorObj[_arg1];
            return (_local2);
        }
        private function renderLimit(_arg1:Array, _arg2:Boolean=false):Array{
            var _local6:Array;
            var _local7:Object;
            var _local3:Array = [];
            if (_arg2){
                _local3 = [{
                    id:0,
                    name:MultiMissionControllerLang.ShowAll
                }];
            };
            if (_arg1.length <= 0){
                return (_local3);
            };
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = _arg1[_local5];
                _local7 = {};
                _local7.id = _local6[0];
                _local7.name = _local6[1];
                _local3.push(_local7);
                _local5++;
            };
            return (_local3);
        }
        public function get checkIsCanChallenge():Object{
            var _local1:Array = _data.multiMission.checkIsCanChallenge;
            var _local2:Object = {};
            _local2.isCanChallenge = _local1[0];
            return (_local2);
        }
        public function get multiWarData():MultiWarData{
            return (this.ownData.multiWarData);
        }
        public function get playerCdTime():int{
            var _local1:Array = _data.multiMission.playerCdTime;
            var _local2:int = _local1[0];
            return (_local2);
        }

    }
}//package com.controllers 
