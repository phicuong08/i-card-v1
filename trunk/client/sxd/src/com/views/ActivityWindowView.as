//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.controllers.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ActivityWindowView extends com.views.Base implements IView {

        private var _activityWindow:IActivityWindow;
        private var _size:int = 12;
        private var _activtiyList:Array;
        private var _mainShowType:String = "";
        private var _getFactionTime:int = 0;

        public function ActivityWindowView(){
            this._activtiyList = [];
            super();
        }
        public function show():void{
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
            if (_view.zodiac.inStageWithTip){
                return;
            };
            loadAssets("ActivityWindow", this.render, ActivityWindowViewLang.AddActivityWindow);
        }
        public function render():void{
            this._activityWindow = (_view.getAssetsObject("ActivityWindow", "ActivityWindow") as IActivityWindow);
            _popup.addView(this, this._activityWindow.content);
            _view.center(sign, this._activityWindow.content);
            this._activityWindow.content.filters;
            this._activityWindow.buttonEffect = _view.activities.buttonEffect;
            this._activityWindow.tip = _view.tip.iTip;
            this._activityWindow.drag = _view.drag.iDrag;
            this._activityWindow.activityUrl = URI.activityUrl;
            this._activityWindow.activityList = this._activtiyList;
            this._activityWindow.onStartActivity = function (_arg1:String, _arg2:Object):void{
                if (((!((_arg1 == FunctionType.MultiMission))) && (_view.multiMission.inStageWithTip))){
                    return;
                };
                switch (_arg1){
                    case TownType.BossQingTianMu:
                    case TownType.BossChiYanShou:
                        _view.worldBossMap.gotoBossTown(_arg2.townId);
                        break;
                    case FunctionType.CampWar:
                        _view.campWar.switchSelf();
                        break;
                    case ActivityType.HeroesWar:
                        _view.heroesWar.switchSelf();
                        break;
                    case FunctionType.MultiMission:
                        _view.multiMission.switchSelf();
                        break;
                };
            };
            this._activityWindow.onIsCheck = function (_arg1:String, _arg2:Object, _arg3:Boolean):void{
                checkHandler(_arg1, _arg2, _arg3);
            };
            this._activityWindow.onClose = function ():void{
                close();
            };
            this.refreshActivity();
        }
        public function moveFileInfo(_arg1:String, _arg2:String):void{
            if (!this.inStage){
                return;
            };
            this._activityWindow.moveFileInfo(_arg1, _arg2);
        }
        private function checkHandler(_arg1:String, _arg2:Object, _arg3:Boolean):void{
            switch (_arg1){
                case TownType.BossQingTianMu:
                case TownType.BossChiYanShou:
                    if (_arg2.isStart == 1){
                        _view.showTip(ActivityWindowViewLang.InWorldBoss);
                    } else {
                        this.set_robot(_arg2.bossId, ((_arg3)==true) ? 1 : 0);
                    };
                    break;
                case FunctionType.CampWar:
                    if (_arg2.isStart == 1){
                        _view.showTip(ActivityWindowViewLang.InCampWar);
                    } else {
                        _view.campWar.set_robot(_arg3);
                    };
                    break;
                case ActivityType.HeroesWar:
                    if (_arg2.isStart == 1){
                        _view.showTip(ActivityWindowViewLang.InHeroesWar);
                    } else {
                        _view.heroesWar.set_robot(_arg3);
                    };
                    break;
                case FunctionType.MultiMission:
                    break;
            };
        }
        public function getActivityState(_arg1:Object, _arg2:Boolean=false):void{
            var _local4:Object;
            if (_arg1.isStart == 1){
                _view.activities.visibleBtnEffect(TownType.All, _arg1.sign, true);
            } else {
                _view.activities.visibleBtnEffect(TownType.All, _arg1.sign, false);
            };
            if (_arg1.isTimerChange){
                _local4 = TimeChange.timeFormat(_arg1, true, true);
                _arg1.openTime = _local4.openTime;
                _arg1.timer = _local4.time;
            } else {
                _arg1.openTime = ActivityType.getOpenTimerToSign(_arg1.sign);
                _arg1.timer = ActivityType.getTimerToSign(_arg1.sign);
            };
            var _local3:String = ActivityType.getTypeToSign(_arg1.sign);
            _arg1.isOpen = FunctionType.isOpened(_local3);
            _arg1.name = ActivityType.getNameToSign(_arg1.sign);
            _arg1.isBtn = _arg2;
            if (((!((_arg1.sign == TownType.BossChiYanShou))) && (!((_arg1.sign == TownType.BossQingTianMu))))){
                _arg1.textTile = HtmlText.format(ActivityType.getTextTileToSign(_arg1.sign), HtmlText.Orange, 14, "", true);
                _arg1.textInfo = ((HtmlText.white((ActivityWindowViewLang.OpenTime + _arg1.openTime)) + "\n") + HtmlText.format(ActivityType.getInfoToSign(_arg1.sign), 10315052));
            };
            if (_arg1.sign == ActivityType.HeroesWar){
                _arg1.isOpen = true;
            };
            this.renderActivity(_arg1);
        }
        private function renderActivity(_arg1:Object):void{
            if (_arg1.isOpen){
                if ((((_arg1.isStart == 1)) && (_arg1.isShowTimer))){
                    _view.activities.showActivityTitle(TownType.All, _arg1.name);
                    this._mainShowType = _arg1.sign;
                } else {
                    if ((((this._mainShowType == _arg1.sign)) || ((this._mainShowType == "")))){
                        _view.activities.hideActivityTimer(TownType.All, _arg1.name);
                    };
                };
                this.renderActivityList(_arg1);
                if (inStage){
                    this._activityWindow.activityList = this._activtiyList;
                };
            };
        }
        private function renderActivityList(_arg1:Object):void{
            var _local8:Object;
            var _local2:int = this._activtiyList.length;
            var _local3:int = _view.ctrl.player.serverTime;
            var _local4:Date = new Date((_local3 * 1000));
            var _local5:String = TimeChange.hoursFormat(_local4.minutes);
            var _local6:Number = Number(((_local4.hours + ".") + _local5));
            var _local7:int;
            while (_local7 < _local2) {
                _local8 = this._activtiyList[_local7];
                if (_local8.sign == _arg1.sign){
                    _arg1.diffServerTimer = _local6;
                    this._activtiyList[_local7] = _arg1;
                    return;
                };
                _local7++;
            };
            _arg1.diffServerTimer = _local6;
            this._activtiyList.push(_arg1);
        }
        public function deleteActivity(_arg1:String):void{
            var _local4:Object;
            var _local2:int = this._activtiyList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._activtiyList[_local3];
                if (_local4.sign == _arg1){
                    this._activtiyList.splice(_local3, 1);
                    this._activityWindow.activityList = this._activtiyList;
                    return;
                };
                _local3++;
            };
        }
        private function refreshActivity():void{
            _view.activities.refreshMultiMission();
            if (this._ctrl.heroesWar.getWarMode["mode"] == 0){
                _view.activities.refreshCampWarState();
            } else {
                _view.activities.refreshHeroesWarState();
            };
            this.get_world_boss_list();
        }
        public function clear():void{
            this._activityWindow.clear();
        }
        public function close():void{
            Helper.gc();
            this.clear();
            _popup.closeView(this);
        }
        public function get_world_boss_list(_arg1:Boolean=true):void{
            if (FunctionType.isOpened(FunctionType.WorldBoss)){
                _data.call(Mod_WorldBoss_Base.get_world_boss_list, this.get_world_boss_list_back, [0]);
            };
            if ((((_arg1 == true)) && ((this._getFactionTime < getTimer())))){
                this._getFactionTime = (getTimer() + 3000);
                setTimeout(_view.factionWindow.get_world_boss_list, 2000);
            };
        }
        private function get_world_boss_list_back():void{
            var _local5:BossInfo;
            var _local6:Object;
            var _local1:Array = [ActivityWindowViewLang.NoStart, ActivityWindowViewLang.ParticipateIn, ActivityWindowViewLang.TheEnd, ActivityWindowViewLang.KillToday, ActivityWindowViewLang.ParticipateIn];
            var _local2:WorldBossMapController = _ctrl.worldBossMap;
            var _local3:Array = _local2.bossList;
            var _local4:Boolean = (((_ctrl.player.vipLevel >= 5)) && (FunctionType.isOpened(FunctionType.Robot)));
            for each (_local5 in _local3) {
                if (_local5.sign == MonsterType.BossDaoBaTu){
                } else {
                    _local6 = {};
                    _local6.sign = _local5.sign;
                    _local6.level = _local5.lv;
                    _local6.isShowTimer = true;
                    _local6.isTimerChange = false;
                    _local6.townId = _local5.mapId;
                    _local6.bossId = _local5.bossId;
                    _local6.btnInfo = _local1[_local5.state];
                    _local6.btnType = 1;
                    _local6.textTile = _local5.htmlName;
                    _local6.textInfo = _local5.infoMsg;
                    if ((((_local5.state == 1)) || ((_local5.state == 4)))){
                        _local6.isStart = 1;
                        _local6.isShowCheckBtn = false;
                        if (((_local4) && ((_local5.auto == 1)))){
                            _local6.isStart = 0;
                            _local6.btnInfo = HtmlText.yellow(ActivityWindowViewLang.UserDoll);
                        };
                    } else {
                        _local6.btnInfo = htmlFormat(_local6.btnInfo, 12, 0x999999);
                        _local6.isStart = 0;
                        _local6.isShowCheckBtn = _local4;
                        _local6.isCheck = (_local5.auto == 1);
                        _local6.checkFile = ActivityWindowViewLang.Doll;
                        _local6.checkTipInfo = _local5.robotTip;
                    };
                    this.getActivityState(_local6, true);
                };
            };
        }
        public function set_robot(_arg1:int, _arg2:int):void{
            _data.call(Mod_WorldBoss_Base.set_robot, this.set_robot_back, [_arg1, _arg2]);
        }
        private function set_robot_back():void{
            if (_ctrl.worldBossMap.result == Mod_WorldBoss_Base.ACTION_SUCCESS){
                this.get_world_boss_list(false);
            };
        }

    }
}//package com.views 
