//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.data.mission.*;

    public class MultiMissionData extends Base {

        private var _openMission:Array;
        private var _getTeamList:Array;
        private var _getTeamInfo:Array;
        private var _createTeam:int;
        private var _dissolveTeam:Array;
        private var _joinTeam:int;
        private var _exitTeam:Array;
        private var _sortTeam:String;
        private var _kickedOutMember:int;
        private var _closeMission:Object;
        private var _startWar:Array;
        public var notifyHash:Object;
        private var _multiWarData:MultiWarData;
        private var _getStatus:Array;
        private var _newTeam:Array;
        private var _dropTeam:Array;
        private var _updateMemberNumber:Array;
        private var _checkIsCanChallenge:Array;
        private var _playerCdTime:Array;

        public function MultiMissionData(){
            this.notifyHash = {};
            super();
        }
        public function get openMission():Array{
            return (this._openMission);
        }
        public function get getTeamList():Array{
            return (this._getTeamList);
        }
        public function get getTeamInfo():Array{
            return (this._getTeamInfo);
        }
        public function get createTeam():int{
            return (this._createTeam);
        }
        public function get dissolveTeam():Array{
            return (this._dissolveTeam);
        }
        public function get joinTeam():int{
            return (this._joinTeam);
        }
        public function get exitTeam():Array{
            return (this._exitTeam);
        }
        public function get sortTeam():String{
            return (this._sortTeam);
        }
        public function get kickedOutMember():int{
            return (this._kickedOutMember);
        }
        public function get closeMission():Object{
            return (this._closeMission);
        }
        public function get startWar():Array{
            return (this._startWar);
        }
        public function get multiWarData():MultiWarData{
            return (this._multiWarData);
        }
        public function get getStatus():Array{
            return (this._getStatus);
        }
        public function get newTeam():Array{
            return (this._newTeam);
        }
        public function get dropTeam():Array{
            return (this._dropTeam);
        }
        public function get updateMemberNumber():Array{
            return (this._updateMemberNumber);
        }
        public function get checkIsCanChallenge():Array{
            return (this._checkIsCanChallenge);
        }
        public function get playerCdTime():Array{
            return (this._playerCdTime);
        }
        public function open_multiple_mission(_arg1:Array):void{
            this._openMission = _arg1;
        }
        public function get_multiple_mission_team_list(_arg1:Array):void{
            this._getTeamList = _arg1;
        }
        public function get_player_team_info(_arg1:Array):void{
            this._getTeamInfo = _arg1;
        }
        public function create_multiple_mission_team(_arg1:int):void{
            this._createTeam = _arg1;
        }
        public function dissolve_multiple_mission_team(_arg1:Array):void{
            this._dissolveTeam = _arg1;
        }
        public function join_multiple_mission_team(_arg1:int):void{
            this._joinTeam = _arg1;
        }
        public function exit_multiple_mission_team(_arg1:Array):void{
            this._exitTeam = _arg1;
        }
        public function kicked_out_member(_arg1:int):void{
            this._kickedOutMember = _arg1;
        }
        public function sort_multiple_mission_team(_arg1:String):void{
            this._sortTeam = _arg1;
        }
        public function close_multiple_mission(_arg1:Object):void{
            this._closeMission = _arg1;
        }
        public function fight_multiple_mission(_arg1:Array):void{
            this._startWar = _arg1;
        }
        public function get_war_result(_arg1:Array):void{
            this._multiWarData = new MultiWarData();
            this._multiWarData.format(_arg1);
        }
        public function notify(_arg1:Array):void{
            var _local2:int = _arg1[0].length;
            var _local3:int;
            while (_local3 < _local2) {
                this.notifyHash[_arg1[0][_local3]] = 1;
                _local3++;
            };
        }
        public function get_multiple_mission_status(_arg1:Array):void{
            this._getStatus = _arg1;
        }
        public function notify_new_team(_arg1:Array):void{
            this._newTeam = _arg1;
        }
        public function notify_drop_team(_arg1:Array):void{
            this._dropTeam = _arg1;
        }
        public function notify_update_member_number(_arg1:Array):void{
            this._updateMemberNumber = _arg1;
        }
        public function check_is_can_challenge(_arg1:Array):void{
            this._checkIsCanChallenge = _arg1;
        }
        public function get_player_cd_time(_arg1:Array):void{
            this._playerCdTime = _arg1;
        }

    }
}//package com.datas 
