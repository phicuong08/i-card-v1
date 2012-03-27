//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ChooseMissionView extends Base implements IView {

        private var _chooseMission:IMission;
        private var missionType:int = 0;
        private var _oldType:int = 99;
        private var _showTownId:int = 0;
        private var _alert:IAlert;
        private var _missionId:int = 0;
        private var _autoMissionId:int = 0;
        private var _autoMissionLock:int = 0;
        private var _autoMissionInfo:String = "";
        public var mainMissionInfo:String = "MainMissionInfo";
        private var _autoType:int = 0;

        public function ChooseMissionView():void{
            _inStageTipTitle = ChooseMissionViewLang.MissionOpen;
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
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
            if (_view.zodiac.inStageWithTip){
                return;
            };
            if ((((this._oldType == this.missionType)) && (inStage))){
                return;
            };
            this._oldType = this.missionType;
            this._showTownId = _ctrl.player.mapId;
            this.close();
            _data.call(Mod_Mission_Base.get_sections, this.getSectionsCallback, [this._showTownId]);
        }
        public function set showTownMission(_arg1:int):void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            this._showTownId = _arg1;
            _data.call(Mod_Mission_Base.get_sections, this.getSectionsCallback, [_arg1]);
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        public function checkCampAndLoad():void{
            var _local1:String;
            var _local2:String;
            var _local3:String;
            if (_ctrl.player.inSelfTown){
                _data.call(Mod_Mission_Base.get_sections, this.getSectionsCallback, [_ctrl.player.mapId]);
            } else {
                _local1 = FactionType.campName(_ctrl.player.campId);
                _local2 = TownType.getName(_ctrl.player.mapId);
                _local3 = Lang.sprintf(ChooseMissionViewLang.UnderTheRest, _local1, _local2);
                _view.alert.confirm(_local3);
            };
        }
        private function getSectionsCallback():void{
            loadAssets("ChooseMission", this.render, ChooseMissionViewLang.LoadAssets);
        }
        private function render():void{
            this._chooseMission = (_view.getAssetsObject("ChooseMission", "ChooseMission") as IMission);
            _popup.addView(this, this._chooseMission.content);
            _view.center(sign, this._chooseMission.content);
            this._chooseMission.tip = _view.tip.iTip;
            this._chooseMission.drag = _view.drag.iDrag;
            this.alert = _view.alert.iAlert;
            this._chooseMission.isOpenPractice = FunctionType.isOpened(FunctionType.MissionPractice);
            var townMainMission:* = _ctrl.mission.renderTownMission(this._showTownId);
            var openMainList:* = _ctrl.mission.openMission;
            this._chooseMission.mainMissionList = townMainMission;
            this._chooseMission.openMainMission = openMainList;
            this._chooseMission.openMissionType = this.missionType;
            if (this._autoMissionLock != 0){
                this._chooseMission.autoMissionId(this._autoMissionLock, this._autoMissionInfo, this._autoType);
            };
            this._chooseMission.onClose = function ():void{
                close();
            };
            this._chooseMission.onStartMission = function (_arg1:Object):void{
                if (_view.missionPractice.inStage){
                    _view.showTip(ChooseMissionViewLang.MissionPracticeOpen);
                } else {
                    _view.missionMap.gotoMissionAtId(_arg1.id);
                    close();
                };
            };
            this._chooseMission.onStartPractice = function (_arg1:Object):void{
                if (_view.missionPractice.inStage){
                    _view.showTip(ChooseMissionViewLang.MissionPracticeStart);
                } else {
                    _view.missionPractice.missionId = _arg1.id;
                    _view.missionPractice.monsterLen = _arg1.monsterLen;
                    _view.missionPractice.switchSelf();
                };
            };
            this._chooseMission.onFcousList = function (_arg1:Array):void{
            };
            this._chooseMission.onRefreshHeroMission = function (_arg1:Object):void{
                _missionId = _arg1.id;
            };
        }
        public function autoMissionId(_arg1:int, _arg2:String="MainMissionInfo"):void{
            this._autoMissionId = _arg1;
            if (_arg2 == this.mainMissionInfo){
                this._autoMissionInfo = ChooseMissionViewLang.QuestMission;
                this._autoType = 0;
            } else {
                this._autoMissionInfo = _arg2;
                this._autoType = 1;
            };
            this._autoMissionLock = MissionType.getMissionLock(this._autoMissionId);
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            if (this._chooseMission != null){
                this._chooseMission.clear();
                this._autoMissionId = 0;
                this._autoMissionLock = 0;
                this._chooseMission = null;
            };
        }

    }
}//package com.views 
