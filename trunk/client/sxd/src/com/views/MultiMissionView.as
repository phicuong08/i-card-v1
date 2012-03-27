//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.controllers.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MultiMissionView extends com.views.Base implements IView {

        public var ownCtrl:MultiMissionController;
        private var _multiMission:IMultiMission;
        private var _openType:int = 0;
        private var _tempLimitData:Array;
        private var _isStart:Boolean = false;
        private var _missionId:int = 0;
        private var _limit:int = 5;
        private var _joinTeamBool:Boolean = true;
        private var _tempBool:Boolean = false;
        private var _showMission:int = 0;
        private var _joinTeamLimit:int = 5;
        private var _isPlayerTeam:int = 0;
        private var _isStartMission:Boolean = false;
        public var isAutoStart:Boolean = false;
        public var isMinimum:Boolean = false;
        private var _teamId:int = 0;
        private var _missionLimit:int = 0;
        private var _createLimit:int = 0;
        private var _systemTimerInfo:String = "";
        private var _alert:IAlert;
        private var _isClose:Boolean = false;

        public function MultiMissionView():void{
            _inStageTipTitle = MultiMissionViewLang.inStageTipTitle;
            _inStageTipContent = "";
        }
        private function get_player_cd_time():void{
            _data.call(Mod_MultipleMission_Base.get_player_cd_time, this.playerCdTimeCallback, [], false);
        }
        private function open_mission():void{
            _data.call(Mod_MultipleMission_Base.open_multiple_mission, this.openMissionCallback, [], false);
        }
        private function get_team_list(_arg1:int, _arg2:int):void{
            _data.call(Mod_MultipleMission_Base.get_multiple_mission_team_list, this.getTeamListCallback, [_arg1, _arg2]);
        }
        private function get_team_info():void{
            _data.call(Mod_MultipleMission_Base.get_player_team_info, this.getTeamInfoCallback, []);
        }
        private function create_team(_arg1:int, _arg2:int):void{
            _data.call(Mod_MultipleMission_Base.create_multiple_mission_team, this.createTeamCallback, [_arg1, _arg2]);
        }
        private function dissolve_team():void{
            _data.call(Mod_MultipleMission_Base.dissolve_multiple_mission_team, new Function(), []);
        }
        private function join_team(_arg1:int):void{
            _data.call(Mod_MultipleMission_Base.join_multiple_mission_team, this.joinTeamCallback, [_arg1], false);
        }
        private function exit_team():void{
            _data.call(Mod_MultipleMission_Base.exit_multiple_mission_team, new Function(), []);
        }
        private function close_mission():void{
            _data.call(Mod_MultipleMission_Base.close_multiple_mission, new Function(), []);
        }
        private function kickedOutMember(_arg1:int):void{
            _data.call(Mod_MultipleMission_Base.kicked_out_member, new Function(), [_arg1]);
        }
        private function sortTeam(_arg1:String):void{
            _data.call(Mod_MultipleMission_Base.sort_multiple_mission_team, new Function(), [_arg1]);
        }
        private function fight_multiple_mission():void{
            _data.call(Mod_MultipleMission_Base.fight_multiple_mission, this.fightMultipleMissionCallback, []);
        }
        private function openMissionCallback():void{
            loadAssets("MultiMission", this.render, MultiMissionViewLang.LoadAssets);
        }
        private function playerCdTimeCallback():void{
            var _local1:int = _ctrl.multiMission.playerCdTime;
            if (_local1 <= 0){
                switch (this._openType){
                    case 1:
                        this.join_team(this._teamId);
                        break;
                    case 2:
                        this.create_team(this._missionLimit, this._createLimit);
                        break;
                };
            } else {
                _view.showTip(Lang.sprintf(MultiMissionViewLang.LostTime, _local1));
            };
        }
        private function getTeamListCallback():void{
            var _local1:Array = this._ctrl.multiMission.getTeamList;
            if (this._isClose == false){
                this._multiMission.getJoinTeamList = _local1;
            };
        }
        private function getTeamInfoCallback():void{
            var _local1:Object = this._ctrl.multiMission.getTeamInfo;
            if (this._isClose == false){
                this._multiMission.getTeamListData = _local1;
            };
            var _local2:Object = this._ctrl.multiMission.playerTeamInfo;
            this.toolbarShow(_local2);
        }
        private function createTeamCallback():void{
            var _local1:int = this._ctrl.multiMission.createTeam;
            if (_local1 == Mod_MultipleMission_Base.SUCCESS){
                this.get_team_info();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function newTeamCallBack():void{
            var _local1:Object = this._ctrl.multiMission.newTeam;
            this._multiMission.getJoinTeamData = _local1;
        }
        private function dropTeamCallBack():void{
            var _local1:int = this._ctrl.multiMission.dropTeam;
            this._multiMission.dropTeam = _local1;
        }
        private function updateMemberNumberCallBack():void{
            var _local1:Object = this._ctrl.multiMission.updateMemberNumber;
            this._multiMission.getTeamMemberNum = _local1;
        }
        private function joinTeamCallback():void{
            var _local1:int = _ctrl.multiMission.joinTeam;
            if (_local1 == Mod_MultipleMission_Base.SUCCESS){
                this.get_team_info();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function exitTeamCallback():void{
            var _local1:Object = _ctrl.multiMission.exitTeam;
        }
        private function notifyCallBack():void{
            var data:* = this.ownCtrl.notify;
            if (data[Mod_MultipleMission_Base.UPDATE_TEAM_INFO]){
                this.ownCtrl.removeNotify(Mod_MultipleMission_Base.UPDATE_TEAM_INFO);
                this.get_team_info();
            };
            if (data[Mod_MultipleMission_Base.STOP_MULTIPLE_MISSION]){
                this.ownCtrl.removeNotify(Mod_MultipleMission_Base.STOP_MULTIPLE_MISSION);
                _view.activities.stopMultiMission();
            };
            if (data[Mod_MultipleMission_Base.HAVE_WAR_RESULT]){
                this._isStart = true;
                this.ownCtrl.removeNotify(Mod_MultipleMission_Base.HAVE_WAR_RESULT);
                _view.multiWar.onClose = function ():void{
                    close();
                    _view.activities.refreshMissionStatus();
                };
                _view.multiWar.show();
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_MultipleMission_Base.INVALID_MULTIPLE_MISSION_ID:
                    _view.showTip(MultiMissionViewLang.InvalidMultipleId);
                    break;
                case Mod_MultipleMission_Base.FULL_TEAM_NUMBER:
                    _view.showTip(MultiMissionViewLang.FullTeamNumber);
                    break;
                case Mod_MultipleMission_Base.INVALID_TEAM_ID:
                    _view.showTip(MultiMissionViewLang.InvalidTeamId);
                    break;
                case Mod_MultipleMission_Base.FULL_MEMBER:
                    _view.showTip(MultiMissionViewLang.FullMember);
                    return;
                case Mod_MultipleMission_Base.NOT_SAME_CANO:
                    _view.showTip(MultiMissionViewLang.NotSameCano);
                    break;
                case Mod_MultipleMission_Base.NOT_SAME_GANG:
                    _view.showTip(MultiMissionViewLang.NotSameCang);
                    break;
                case Mod_MultipleMission_Base.LIMIT_MEMBER_NUMBER:
                    _view.showTip(MultiMissionViewLang.LimitMemberNumber);
                    break;
                case Mod_MultipleMission_Base.NOT_SAME_GANG:
                    _view.showTip(MultiMissionViewLang.NotSameGang);
                    break;
            };
        }
        private function fightMultipleMissionCallback():void{
            var _local1:int = this._ctrl.multiMission.startWar;
            this.renderMsg(_local1);
        }
        public function show():void{
            if (_view.tower.inStageWithTip){
                return;
            };
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.getPeach.inStageWithTip){
                return;
            };
            if (FunctionType.isOpened(FunctionType.MultiMission) == false){
                _view.alert.confirm(MultiMissionViewLang.IsOpen);
                return;
            };
            this.open_mission();
        }
        private function render():void{
            this._isClose = false;
            this._multiMission = (_view.getAssetsObject("MultiMission", "MultiMission") as IMultiMission);
            _popup.addView(this, this._multiMission.content);
            _view.center(sign, this._multiMission.content);
            this._multiMission.tip = _view.tip.iTip;
            this._multiMission.drag = _view.drag.iDrag;
            this._multiMission.openFastJoin = FunctionType.isOpened(FunctionType.TravelEvent);
            var data:* = this._ctrl.multiMission.limitCondition;
            var list:* = this._ctrl.multiMission.openTeam;
            this._multiMission.getCreateLimit = data.createLimit;
            this._multiMission.getJoinTeamList = list;
            this._multiMission.renderSystemInfo = this._systemTimerInfo;
            this._multiMission.getJoinLimit = data.joinLimit;
            if (data.createLimit <= 0){
                _view.activities.hideActivityTimer(FunctionType.MultiMission, MultiMissionViewLang.MultiMission);
            };
            this.get_team_info();
            _data.patch(Mod_MultipleMission_Base.notify, this.notifyCallBack);
            _data.patch(Mod_MultipleMission_Base.notify_new_team, this.newTeamCallBack);
            _data.patch(Mod_MultipleMission_Base.notify_drop_team, this.dropTeamCallBack);
            _data.patch(Mod_MultipleMission_Base.notify_update_member_number, this.updateMemberNumberCallBack);
            this._multiMission.isAutoStart = this.isAutoStart;
            this._multiMission.onShowJoinTeamLimity = function (_arg1:int):void{
                _joinTeamLimit = _arg1;
                get_team_list(_showMission, _joinTeamLimit);
            };
            this._multiMission.onJoin = function (_arg1:int):void{
                if (_isStart){
                    return;
                };
                _openType = 1;
                _teamId = _arg1;
                get_player_cd_time();
            };
            this._multiMission.onJoinTeamLimit = function (_arg1:Object):void{
                _showMission = _arg1.id;
                get_team_list(_showMission, _joinTeamLimit);
            };
            this._multiMission.onCreateTeam = function (_arg1:int, _arg2:int):void{
                _openType = 2;
                _missionLimit = _arg1;
                _createLimit = _arg2;
                get_player_cd_time();
            };
            this._multiMission.onAutoStart = function (_arg1:Boolean):void{
                isAutoStart = _arg1;
            };
            this._multiMission.onKickedOutMember = function (_arg1:int):void{
                kickedOutMember(_arg1);
            };
            this._multiMission.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case "joinFastTeam":
                        _view.showTip(MultiMissionViewLang.JoinFastTeam);
                        break;
                    case "teamList":
                        _view.showTip(MultiMissionViewLang.TeamList);
                        break;
                };
            };
            this._multiMission.onLeftTeam = function ():void{
                exit_team();
            };
            this._multiMission.onStart = function ():void{
                fight_multiple_mission();
            };
            this._multiMission.onTeamLabel = function (_arg1:String):void{
                sortTeam(_arg1);
            };
            this._multiMission.onMinTarget = function ():void{
                if (_isPlayerTeam == 1){
                    clear();
                    isMinimum = true;
                } else {
                    close();
                };
            };
            this._multiMission.onClear = function ():void{
                close();
            };
        }
        private function toolbarShow(_arg1:Object):void{
            this._isPlayerTeam = _arg1.isPlayerTeam;
            if (_arg1.isPlayerTeam == 1){
                if (((((_arg1.isStart) && (this.isAutoStart))) && (_arg1.isLeader))){
                    this.fight_multiple_mission();
                };
                _view.toolbar.renderMultMissionLink(_arg1.info);
            } else {
                _view.toolbar.renderMultMissionLink("");
                if (this.isMinimum){
                    this.close();
                };
            };
        }
        public function get isMinimumWithTip():Boolean{
            var handler:* = null;
            if (this.isMinimum){
                handler = function (_arg1:uint):void{
                    if (AlertButtonType.Yes == _arg1){
                        close();
                    };
                };
                _view.alert.showYesNoMsg(MultiMissionViewLang.ShowYesNoMsg, MultiMissionViewLang.Yes, MultiMissionViewLang.No, handler);
                return (true);
            };
            return (false);
        }
        override public function get inStageWithTip():Boolean{
            if (((((inStage) || (this.isMinimum))) && (_inStageTipTitle))){
                _view.showTip(_inStageTipTitle, _inStageTipContent);
            };
            return (((inStage) || (this.isMinimum)));
        }
        public function set systemTimerInfo(_arg1:String):void{
            this._systemTimerInfo = _arg1;
            if (this.inStage){
                this._multiMission.renderSystemInfo = this._systemTimerInfo;
            };
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        public function startMultiMission():void{
            this.fight_multiple_mission();
        }
        public function getTeamList():void{
            this.get_team_list(0, Mod_MultipleMission_Base.ALL_RECORD);
        }
        public function clear():void{
            if (this._isClose){
                return;
            };
            Helper.gc();
            this._isClose = true;
            this.allClose();
            _popup.closeView(this);
            _view.removeFromTimerProcessList(sign);
            _data.cancelPatch(Mod_MultipleMission_Base.notify_new_team);
            _data.cancelPatch(Mod_MultipleMission_Base.notify_drop_team);
            _data.cancelPatch(Mod_MultipleMission_Base.notify_update_member_number);
        }
        public function close():void{
            this._isStart = false;
            this.isMinimum = false;
            this.isAutoStart = false;
            _view.toolbar.renderMultMissionLink("");
            _data.cancelPatch(Mod_MultipleMission_Base.notify);
            _view.activities.openActivity(TownType.MultiMission);
            this.clear();
            this.close_mission();
        }
        public function allClose():void{
            this._multiMission.clear();
        }

    }
}//package com.views 
