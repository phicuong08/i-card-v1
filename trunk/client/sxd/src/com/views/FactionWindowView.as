//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.controllers.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionWindowView extends com.views.Base implements IView {

        private var _factionWindow:IFactionWindow;
        private var _size:int = 12;
        private var _activtiyList:Array;
        private var _mainShowType:String = "";
        private var _mainShowEffic:String = "";
        private var _intoActivity:Object;
        private var _noticeTime:int = 0;
        private var _popupInto:Boolean = false;

        public function FactionWindowView(){
            this._activtiyList = [];
            this._intoActivity = {};
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
            this.openFactionWindow();
        }
        private function renderShow():void{
            loadAssets("FactionWindow", this.render, FactionWindowViewLang.LoadAssets);
        }
        public function render():void{
            this._factionWindow = (_view.getAssetsObject("FactionWindow", "FactionWindow") as IFactionWindow);
            _popup.addView(this, this._factionWindow.content);
            _view.center(sign, this._factionWindow.content);
            this._factionWindow.buttonEffect = _view.activities.buttonEffect;
            this._factionWindow.tip = _view.tip.iTip;
            this._factionWindow.drag = _view.drag.iDrag;
            this._factionWindow.activityUrl = URI.activityUrl;
            if (this._activtiyList.length > 0){
                this._factionWindow.activityList = this._activtiyList;
            };
            this._factionWindow.onStartActivity = function (_arg1:String, _arg2:Object):void{
                if (((!((_arg1 == FunctionType.MultiMission))) && (_view.multiMission.inStageWithTip))){
                    return;
                };
                switch (_arg1){
                    case ActivityType.FactionRollCake:
                        _view.factionRollCake.gotoJiHueiSuo();
                        break;
                    case ActivityType.FactionBlessing:
                        _view.factionBlessing.gotoFactionBlessing();
                        break;
                    case ActivityType.FactionSeal:
                        if (_ctrl.faction.isCanJoinActivity["result"] == Mod_Faction_Base.YES){
                            _view.factionSeal.show();
                        };
                        break;
                    case ActivityType.FactionEat:
                        if (_ctrl.faction.isCanJoinActivity["result"] == Mod_Faction_Base.YES){
                            if (_arg2.state == 2){
                                _view.factionEat.callEat();
                            } else {
                                if (_arg2.state == 1){
                                    _view.factionEat.gotoEat();
                                };
                            };
                        };
                        break;
                    case ActivityType.BossDaoBaTu:
                        if (_arg2.btnInfo == FactionWindowViewLang.ParticipateIn){
                            _view.worldBossMap.gotoBossTown(_arg2.TownId);
                        } else {
                            if (_arg2.btnInfo == FactionWindowViewLang.Setting){
                                _view.factionBossSelect.isSee = false;
                                _view.factionBossSelect.show();
                            } else {
                                if (_arg2.btnInfo == FactionWindowViewLang.See){
                                    _view.factionBossSelect.isSee = true;
                                    _view.factionBossSelect.show();
                                };
                            };
                        };
                        break;
                    case ActivityType.FactionWar:
                        if ((((_ctrl.factionWarMap.signupState == 1)) || ((_ctrl.factionWarMap.signupState == 2)))){
                            _view.factionWarSignUp.show();
                        } else {
                            _view.factionTable.show();
                        };
                        break;
                };
            };
            this._factionWindow.onIsCheck = function (_arg1:String, _arg2:Object, _arg3:Boolean):void{
                switch (_arg1){
                    case ActivityType.FactionBlessing:
                        break;
                    case ActivityType.FactionSeal:
                        break;
                    case ActivityType.FactionEat:
                        break;
                    case ActivityType.BossDaoBaTu:
                        break;
                };
            };
            this._factionWindow.onClose = function ():void{
                close();
            };
            this._factionWindow.defaultFction();
        }
        private function openFactionWindow():void{
            var _local1:Object = {};
            _local1.isStart = 0;
            var _local2:int = ActivityType.FactionLevel;
            if (ActivityType.getOpenLevelToSign(ActivityType.BossDaoBaTu) <= _local2){
                this.get_world_boss_list();
            } else {
                _local1.sign = ActivityType.BossDaoBaTu;
                this.getActivityState(_local1);
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionBlessing) <= _local2){
                _view.factionBlessing.getFactionBlessingCount();
            } else {
                _local1.sign = ActivityType.FactionBlessing;
                this.getActivityState(_local1);
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionSeal) <= _local2){
                _view.factionSeal.seal_satan_info();
            } else {
                _local1.sign = ActivityType.FactionSeal;
                this.getActivityState(_local1);
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionEat) <= _local2){
                _view.factionEat.call_eat_info();
            } else {
                _local1.sign = ActivityType.FactionEat;
                this.getActivityState(_local1);
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionRollCake) <= _local2){
                _view.factionRollCake.faction_roll_cake_remain_times();
            } else {
                _local1.sign = ActivityType.FactionRollCake;
                this.getActivityState(_local1);
            };
            if (FunctionType.isOpened(FunctionType.Faction)){
                this.factionWarInit();
            } else {
                _local1.sign = ActivityType.FactionWar;
                this.getActivityState(_local1);
            };
        }
        private function closeFactionWindow():void{
            _view.factionEat.closeEat();
        }
        public function getActivityState(_arg1:Object):void{
            this._intoActivity[_arg1.sign] = _arg1.sign;
            var _local2:Boolean = this.isAllFactivity();
            if (_local2){
                this.renderShow();
            };
            if (_arg1.sign != TownType.BossDaoBaTu){
                _arg1.name = ActivityType.getNameToSign(_arg1.sign);
            };
            _arg1.isOpen = (ActivityType.getOpenLevelToSign(_arg1.sign) <= ActivityType.FactionLevel);
            this.renderActivity(_arg1);
        }
        private function isAllFactivity():Boolean{
            var _local4:String;
            var _local1:Array = ActivityType.factionWindowList;
            var _local2:int = ActivityType.factionWindowList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _local1[_local3];
                if (this._intoActivity[_local4] == null){
                    return (false);
                };
                _local3++;
            };
            return (true);
        }
        private function renderActivity(_arg1:Object):void{
            if (_arg1.isOpen){
                if (_arg1.isStart == 1){
                    if (_arg1.isShowTimer){
                        _view.activities.showActivityTitle(ActivityType.FactionAll, _arg1.name);
                        this._mainShowType = _arg1.sign;
                    } else {
                        this.hideActivityTimer(_arg1);
                    };
                    if (_arg1.isShowActivityEffic){
                        _view.activities.visibleBtnEffect(ActivityType.FactionAll, _arg1.name, _arg1.isShowActivityEffic);
                        this._mainShowEffic = _arg1.sign;
                    } else {
                        this.visibleBtnEffect(_arg1);
                    };
                } else {
                    this.hideActivityTimer(_arg1);
                    this.visibleBtnEffect(_arg1);
                };
            };
            if (inStage){
                this._factionWindow.activityList = [_arg1];
            } else {
                this.renderActivityList(_arg1);
            };
        }
        private function hideActivityTimer(_arg1:Object):void{
            if ((((this._mainShowType == _arg1.sign)) || ((this._mainShowType == "")))){
                _view.activities.hideActivityTimer(ActivityType.FactionAll, _arg1.name);
            };
        }
        private function visibleBtnEffect(_arg1:Object):void{
            if ((((this._mainShowEffic == _arg1.sign)) || ((this._mainShowEffic == "")))){
                _view.activities.visibleBtnEffect(ActivityType.FactionAll, _arg1.name, _arg1.isShowActivityEffic);
            };
        }
        private function renderActivityList(_arg1:Object):void{
            var _local4:Object;
            var _local2:int = this._activtiyList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._activtiyList[_local3];
                if (_local4.sign == _arg1.sign){
                    this._activtiyList[_local3] = _arg1;
                    return;
                };
                _local3++;
            };
            this._activtiyList.push(_arg1);
        }
        public function clear():void{
            this._factionWindow.clear();
        }
        public function close():void{
            this._intoActivity = {};
            this._activtiyList = [];
            this.closeFactionWindow();
            Helper.gc();
            this.clear();
            _popup.closeView(this);
        }
        public function get_world_boss_list():void{
            if (FunctionType.isOpened(FunctionType.Faction)){
                _data.call(Mod_WorldBoss_Base.get_world_boss_list, this.get_world_boss_list_back, [1]);
            };
        }
        private function get_world_boss_list_back():void{
            var _local1:BossInfo = _ctrl.worldBossMap.bossList[BossInfo.BossDaoBaTu];
            if (_local1.state == -1){
                return;
            };
            var _local2:Object = {};
            _local2.sign = ActivityType.BossDaoBaTu;
            _local2.name = _local1.name;
            _local2.textTile = _local1.htmlName;
            _local2.TownId = _local1.mapId;
            _local2.explain = _local1.infoMsg;
            if ((((_local1.state == 1)) || ((_local1.state == 4)))){
                _local2.isStart = 1;
                _local2.isShowTimer = true;
                _local2.isShowBtnEffic = true;
                _local2.isShowActivityEffic = true;
                _local2.btnInfo = FactionWindowViewLang.ParticipateIn;
                _local2.btnType = 1;
            } else {
                if (_local1.canSet){
                    _local2.isStart = 1;
                    _local2.isShowTimer = false;
                    _local2.isShowBtnEffic = false;
                    _local2.isShowActivityEffic = false;
                    _local2.btnInfo = FactionWindowViewLang.Setting;
                    _local2.btnType = 1;
                } else {
                    _local2.isStart = 1;
                    _local2.isShowTimer = false;
                    _local2.isShowBtnEffic = false;
                    _local2.isShowActivityEffic = false;
                    _local2.btnInfo = FactionWindowViewLang.See;
                    _local2.btnType = 1;
                };
            };
            this.getActivityState(_local2);
        }
        private function get factionWar():FactionWarMapController{
            return (this._ctrl.factionWarMap);
        }
        public function factionWarInit():void{
            this._data.patch(Mod_FactionWar_Base.notify_status, this.notify_status_back);
            this._data.patch(Mod_FactionWar_Base.notify_open_faction_war, this.notify_open_faction_war_back);
            this._data.patch(Mod_FactionWar_Base.notify_begin_faction_war, this.notify_begin_faction_war_back);
            this._data.call(Mod_FactionWar_Base.get_faction_war_list, null, []);
            this.notify_status_back();
        }
        private function notify_status_back():void{
            var _local3:int;
            var _local1:Object = {};
            _local1.sign = ActivityType.FactionWar;
            _local1.explain = FactionWindowViewLang.FactionWarPlayerAdd;
            _local1.isStart = 1;
            _local1.btnType = 1;
            _local1.isShowTimer = false;
            _local1.isShowBtnEffic = false;
            _local1.isShowActivityEffic = false;
            var _local2:int = this.factionWar.intoTime;
            if (_local2 > 3){
                this._popupInto = false;
                this._view.addToTimerProcessList("checkFactionWarInToTime", this.checkFactionWarInToTime);
                if ((((_local2 > 60)) && ((this._noticeTime < getTimer())))){
                    this._noticeTime = (getTimer() + 10000);
                    _local3 = int((_local2 / 60));
                    setTimeout(this._view.worldNotice.showMessage, 3000, Lang.sprintf(FactionWindowViewLang.FactionWarTime, _local3));
                };
            };
            if (this.factionWar.signupState == 4){
                _local1.btnInfo = FactionWindowViewLang.WarReady;
                _local1.isShowTimer = true;
                _local1.isShowBtnEffic = true;
                _local1.isShowActivityEffic = true;
            } else {
                if (this.factionWar.signupState == 1){
                    _local1.btnInfo = FactionWindowViewLang.SignUp;
                } else {
                    _local1.btnInfo = FactionWindowViewLang.See;
                };
            };
            this.getActivityState(_local1);
            this._view.factionTable.update();
        }
        private function notify_open_faction_war_back():void{
            this._data.call(Mod_FactionWar_Base.get_my_faction_war, this.notify_status_back, []);
        }
        private function checkFactionWarInToTime():void{
            var _local1:int = getTimer();
            if (_local1 < 5000){
                return;
            };
            _local1 = this.factionWar.intoTime;
            if ((((((_local1 > 3)) && ((_local1 < 30)))) && (this.canPopupFactionWarAutoInto))){
                this._popupInto = true;
                this._view.alert.showYesNoMsg(Lang.sprintf(FactionWindowViewLang.AskFactionWarInto, _local1), FactionWindowViewLang.InTo, FactionWindowViewLang.Cancel, this.intoSelect);
            };
            if (_local1 < 3){
                this._view.removeFromTimerProcessList("checkFactionWarInToTime");
                if (this._popupInto == true){
                    this._popupInto = false;
                    this._view.factionWarMap.gotoFactionWar();
                    this._view.alert.hide();
                };
            } else {
                if (this._popupInto == true){
                    this._view.alert.iAlert.yesLabel = FactionWindowViewLang.InTo;
                    this._view.alert.iAlert.updateContent(Lang.sprintf(FactionWindowViewLang.AskFactionWarInto, _local1));
                };
            };
        }
        private function intoSelect(_arg1:int):void{
            var _local2:Array;
            var _local3:IView;
            if ((((_arg1 == AlertButtonType.Yes)) && ((this._popupInto == true)))){
                this._popup.closeAll();
                _local2 = [_view.takeBibleRoad, _view.serverWarCup, _view.missionPractice, _view.heroPractice, _view.tower, _view.getPeach, _view.zodiac];
                for each (_local3 in _local2) {
                    if (_local3.inStage){
                        _local3.close();
                    };
                };
                this._view.factionWarMap.gotoFactionWar();
            };
            this._popupInto = false;
            this._view.removeFromTimerProcessList("checkFactionWarInToTime");
        }
        private function get canPopupFactionWarAutoInto():Boolean{
            if (this._popupInto == true){
                return (false);
            };
            if (this._view.factionWarMap.inStage == true){
                return (false);
            };
            if (this._view.inWar == true){
                return (false);
            };
            if (this._view.drama.inStage == true){
                return (false);
            };
            return (true);
        }
        private function notify_begin_faction_war_back():void{
            var _local1:Object = {};
            _local1.sign = ActivityType.FactionWar;
            _local1.explain = FactionWindowViewLang.FactionWarPlayerAdd;
            _local1.isStart = 1;
            _local1.btnType = 1;
            _local1.isShowTimer = false;
            _local1.isShowBtnEffic = false;
            _local1.isShowActivityEffic = false;
            _local1.btnInfo = FactionWindowViewLang.See;
            this.getActivityState(_local1);
            this._view.factionWarMap.updateWarTipMsg();
            this._view.factionTable.update();
        }

    }
}//package com.views 
