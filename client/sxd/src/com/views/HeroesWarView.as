//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class HeroesWarView extends Base implements IView {

        private var _heroesWar:IHeroesWar;
        private var _intEndTime:int;
        private var _intWarCdTime:int;
        private var _intCanOpenUI:int = 10;
        private var _intSeverCount:int = 3;
        private var _aryWarReport:Array;
        private var _aryPlayerWarReport:Array;
        private var _aryShuShanPlayerList:Array;
        private var _aryKunLunPlayerList:Array;
        private var _dialog:IAlert = null;
        public var _blnIsInWar:Boolean = false;
        private var _blnInBuyBuff:Boolean = false;
        private var _blnCanJoin:Boolean = false;
        private var _aryCachePlayer:Array;
        private var _aryCacheWarReport:Array;
        private var _intRenderRecordCount:int = 0;

        public function HeroesWarView(){
            this._aryWarReport = [];
            this._aryPlayerWarReport = [];
            this._aryShuShanPlayerList = [];
            this._aryKunLunPlayerList = [];
            this._aryCachePlayer = [];
            this._aryCacheWarReport = [];
            super();
            _inStageTipTitle = HeroesWarViewLang.InHeroesWar;
            _inStageTipContent = "";
        }
        public function show():void{
            if (_view.multiMission.isMinimumWithTip){
                return;
            };
            if (_view.getPeach.inStageWithTip){
                return;
            };
            if (_view.rollCake.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            _view.toolbar.unblockHealthInCampWar();
            _popup.closeView(this);
            this._heroesWar = null;
            _view.inCampWar.opened = false;
        }
        public function clear():void{
            this._view.removeFromTimerProcessList(this.sign);
            this._heroesWar.clear();
            this._data.cancelPatch(Mod_HeroesWar_Base.notify_report);
            this._ctrl.heroesWar.getPlayerStatusData();
            this._ctrl.heroesWar.getWarReport();
            this._aryCachePlayer = [];
            this._aryCacheWarReport = [];
            this.close_heroes_war();
            _view.townMap.otherCount = 999;
        }
        public function updateSkill(_arg1:int):void{
            if (((this.inStage) || (!((this._heroesWar == null))))){
                this._heroesWar.updateSkill(_arg1);
            };
        }
        public function getBuff():void{
            this.get_buff();
        }
        private function loadData():void{
            _data.call(Mod_HeroesWar_Base.get_heroes_open_time, this.loadDataCallBack, []);
        }
        private function loadDataCallBack():void{
            var callBack:* = function ():void{
                var _local1:Object = _ctrl.heroesWar.getCurrentHeroesOpenTime();
                var _local2:int = _ctrl.heroesWar.getIsOpenHeroesWar();
                _view.activities.activityShowHeroesWar(_local2, _local1["start_time"], _local1["end_time"]);
                if ((((_local2 == 0)) || ((_local2 == 2)))){
                    _view.showTip(HeroesWarViewLang.HeroesWar, HeroesWarViewLang.NoToOpenTime);
                    return;
                };
                render();
                _intEndTime = _local1["end_time"];
                open_heroes_war();
                getHeroesPlayerByShuShan();
                notify_report();
                get_buff();
                timer();
                _view.addToTimerProcessList(sign, timer);
            };
            loadAssets("HeroesWar", callBack, HeroesWarViewLang.LoadInfo);
        }
        private function render():void{
            this._heroesWar = (_view.getAssetsObject("HeroesWar", "HeroesWar") as IHeroesWar);
            this.init();
            this._heroesWar.render();
            this._heroesWar.updateSkill(this._ctrl.player.skill);
            if (this._aryWarReport.length > 0){
                this._heroesWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
            };
        }
        private function showUI():void{
            if (this._heroesWar == null){
                return;
            };
            _popup.addView(this, this._heroesWar.content);
            _view.center(sign, this._heroesWar.content);
        }
        private function hideUI():void{
            _popup.closeView(this);
        }
        private function init():void{
            this._intCanOpenUI = 0;
            this._blnIsInWar = false;
            this._blnCanJoin = false;
            this._blnInBuyBuff = false;
            this._heroesWar.loadBtnCartoon([(URI.addonsUrl + "button_effect.swf")]);
            this._heroesWar.drag = this._view.drag.iDrag;
            this._heroesWar.tip = _view.tip.iTip;
            if (this._dialog == null){
                this._dialog = _view.alert.iAlert;
            };
            this._heroesWar.playerLevel = this._ctrl.player.level;
            this._heroesWar.playerID = this._ctrl.player.playerId;
            this._heroesWar.onClose = this.close;
            this._heroesWar.onJoinWar = this.joinHeroesWar;
            this._heroesWar.onExitWar = this.exit_heroes_war;
            this._heroesWar.onIngotInspire = this.buyBuff;
            this._heroesWar.onSkillInspire = this.buyBuff;
            this._heroesWar.onTextLink = this._view.toolbar.onTextLink;
            _view.townMap.otherCount = 0;
        }
        private function timer():void{
            if (this._intEndTime > 0){
                this._intEndTime--;
                this._heroesWar.renderHeroesWarEndTime(DateTime.formatFromSecond(this._intEndTime));
                if (((((this._intEndTime % 600) == 0)) || ((this._intEndTime == 60)))){
                    this.syncEndTime();
                };
            };
            this.renderPlayerAndWarReport();
        }
        private function renderPlayerAndWarReport():void{
            if (this._blnIsInWar){
                return;
            };
            if (this._aryCachePlayer.length > this._intRenderRecordCount){
                this.updatePlayerStatus(this._aryCachePlayer.splice(0, 20));
            } else {
                if (this._ctrl.heroesWar.getPlayerStatusDataLength > 0){
                    this._aryCachePlayer = this._ctrl.heroesWar.getPlayerStatusData();
                };
            };
            if (this._aryCacheWarReport.length > this._intRenderRecordCount){
                this.updateWarReport(this._aryCacheWarReport.splice(0, 15));
            } else {
                if (this._ctrl.heroesWar.getWarReportLength > 0){
                    this._aryCacheWarReport = this._ctrl.heroesWar.getWarReport();
                };
            };
        }
        private function toatlPlayerCount(_arg1:Array):Object{
            var _local3:Object;
            var _local2:Object = {};
            for each (_local3 in _arg1) {
                if (_local2.hasOwnProperty(_local3["min_level"])){
                    _local2[_local3["min_level"]] = (_local2[_local3["min_level"]] + 1);
                } else {
                    _local2[_local3["min_level"]] = 1;
                };
            };
            return (_local2);
        }
        private function isShowUI():void{
            this._intCanOpenUI++;
            if (this._intCanOpenUI == this._intSeverCount){
                this._structure.popup.closeAll();
                this.showUI();
            };
        }
        private function buyBuff(_arg1:int):void{
            var callBack:* = null;
            var intType:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    buy_buff(intType);
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.CampWarIngotBuyBuff, true);
                };
            };
            if ((((intType == Mod_HeroesWar_Base.PAY_INGOT)) && (!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.CampWarIngotBuyBuff))))){
                this._dialog.yesLabel = HeroesWarViewLang.DialogYes;
                this._dialog.cancelLabel = HeroesWarViewLang.DialogCancel;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(HeroesWarViewLang.BuyBuff, HtmlText.yellow(HeroesWarViewLang.BuyBuffIngot)), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.buy_buff(intType);
            };
        }
        private function joinHeroesWar():void{
            this._view.toolbar.checkWarCdTime(this.join_heroes_war);
        }
        private function updatePlayerStatus(_arg1:Array):void{
            var _local4:Object;
            var _local2:Boolean;
            var _local3:Boolean;
            for each (_local4 in _arg1) {
                if (_local4["team_id"] == FactionType.campId(FactionType.ShuShanCheng)){
                    this.updateShuShanPlayerStatus(_local4);
                    _local2 = true;
                } else {
                    this.updateKunLunPlayerStatus(_local4);
                    _local3 = true;
                };
            };
            if (_local2){
                this._heroesWar.setShuShanPlayerList();
                this._heroesWar.renderShuShanInfo(this.toatlPlayerCount(this._aryShuShanPlayerList));
            };
            if (_local3){
                this._heroesWar.setKunLunPlayerList();
                this._heroesWar.renderKunLunInfo(this.toatlPlayerCount(this._aryKunLunPlayerList));
            };
        }
        private function updateShuShanPlayerStatus(_arg1:Object):void{
            var _local3:int;
            var _local2:Object = {};
            if (_arg1["status"] == Mod_HeroesWar_Base.PLAYER_JOIN_HEROES_WAR){
                for each (_local2 in this._aryShuShanPlayerList) {
                    if (_arg1["player_id"] == _local2["player_id"]){
                        return;
                    };
                };
                this._aryShuShanPlayerList.push(_arg1);
            } else {
                if (_arg1["status"] == Mod_HeroesWar_Base.PLAYER_EXIT_HEROES_WAR){
                    _local3 = (this._aryShuShanPlayerList.length - 1);
                    while (_local3 >= 0) {
                        _local2 = (this._aryShuShanPlayerList[_local3] as Object);
                        if (_arg1["player_id"] == _local2["player_id"]){
                            this._aryShuShanPlayerList.splice(_local3, 1);
                            break;
                        };
                        _local3--;
                    };
                } else {
                    for each (_local2 in this._aryShuShanPlayerList) {
                        if (_arg1["player_id"] == _local2["player_id"]){
                            _local2["status"] = _arg1["status"];
                            _arg1["player_nick_name"] = _local2["player_nick_name"];
                            break;
                        };
                    };
                };
            };
            this._heroesWar.renderPlayer(_arg1, FactionType.ShuShanCheng);
        }
        private function updateKunLunPlayerStatus(_arg1:Object):void{
            var _local3:int;
            var _local2:Object = {};
            if (_arg1["status"] == Mod_HeroesWar_Base.PLAYER_JOIN_HEROES_WAR){
                for each (_local2 in this._aryKunLunPlayerList) {
                    if (_arg1["player_id"] == _local2["player_id"]){
                        return;
                    };
                };
                this._aryKunLunPlayerList.push(_arg1);
            } else {
                if (_arg1["status"] == Mod_HeroesWar_Base.PLAYER_EXIT_HEROES_WAR){
                    _local3 = (this._aryKunLunPlayerList.length - 1);
                    while (_local3 >= 0) {
                        _local2 = (this._aryKunLunPlayerList[_local3] as Object);
                        if (_arg1["player_id"] == _local2["player_id"]){
                            this._aryKunLunPlayerList.splice(_local3, 1);
                            break;
                        };
                        _local3--;
                    };
                } else {
                    for each (_local2 in this._aryKunLunPlayerList) {
                        if (_arg1["player_id"] == _local2["player_id"]){
                            _local2["status"] = _arg1["status"];
                            _arg1["player_nick_name"] = _local2["player_nick_name"];
                            break;
                        };
                    };
                };
            };
            this._heroesWar.renderPlayer(_arg1, FactionType.KunLunCheng);
        }
        private function updateWarReport(_arg1:Array):void{
            var _local2:Object;
            for each (_local2 in _arg1) {
                this._aryWarReport.push(_local2);
                if ((((_local2["winner_player_id"] == this._ctrl.player.playerId)) || ((_local2["loser_player_id"] == this._ctrl.player.playerId)))){
                    this._aryPlayerWarReport.push(_local2);
                };
            };
            if (this._aryPlayerWarReport.length > 20){
                this._aryPlayerWarReport.splice(0, (this._aryPlayerWarReport.length - 15));
                if (this._heroesWar.WarReportType == 1){
                    this._heroesWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
                };
            } else {
                if (this._heroesWar.WarReportType == 1){
                    this._heroesWar.renderWarReport(this._aryWarReport, this._aryPlayerWarReport, _arg1);
                };
            };
            if (this._aryWarReport.length > 30){
                this._aryWarReport.splice(0, (this._aryWarReport.length - 15));
                if (this._heroesWar.WarReportType == 0){
                    this._heroesWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
                };
            } else {
                if (this._heroesWar.WarReportType == 0){
                    this._heroesWar.renderWarReport(this._aryWarReport, this._aryPlayerWarReport, _arg1);
                };
            };
        }
        private function renderAutoJoin():void{
            if (((this._blnCanJoin) && (!(this._blnIsInWar)))){
                this._heroesWar.renderAutoJoin();
                this._blnCanJoin = false;
            };
        }
        public function get_heroes_open_time():void{
            this._data.call(Mod_HeroesWar_Base.get_heroes_open_time, this.getHeroesOpenTimeCallBack, []);
        }
        private function getHeroesOpenTimeCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.getCurrentHeroesOpenTime();
            var _local2:int = this._ctrl.heroesWar.getIsOpenHeroesWar();
            this._view.activities.get_robot_status_heroes();
        }
        private function open_heroes_war():void{
            this._data.call(Mod_HeroesWar_Base.open_heroes_war, this.openHeroesWarCallBack, []);
        }
        private function openHeroesWarCallBack():void{
            this.isShowUI();
            var _local1:Object = this._ctrl.heroesWar.openHeroesWar();
            this._heroesWar.renderWinningList(_local1["top_player_list"]);
            this._heroesWar.renderIntegral(_local1);
            this._heroesWar.renderPlayerHeroesWarInfo(_local1);
        }
        private function close_heroes_war():void{
            this._data.call(Mod_HeroesWar_Base.close_heroes_war, null, []);
        }
        private function getHeroesPlayerByShuShan():void{
            this._data.call(Mod_HeroesWar_Base.get_heroes_player, this.getHeroesPlayerByShuShanCallBack, [FactionType.campId(FactionType.ShuShanCheng)]);
        }
        private function getHeroesPlayerByShuShanCallBack():void{
            this.isShowUI();
            var _local1:Array = this._ctrl.heroesWar.getHeroesLevelArea();
            this._heroesWar.renderHeroesLevelArea(_local1);
            this._aryShuShanPlayerList = this._ctrl.heroesWar.getHeroesPlayer();
            this._heroesWar.renderPlayerList(this._aryShuShanPlayerList, FactionType.ShuShanCheng);
            this.getHeroesPlayerByKunLun();
        }
        private function getHeroesPlayerByKunLun():void{
            this._data.call(Mod_HeroesWar_Base.get_heroes_player, this.getHeroesPlayerByKunLunCallBack, [FactionType.campId(FactionType.KunLunCheng)]);
        }
        private function getHeroesPlayerByKunLunCallBack():void{
            this.isShowUI();
            var _local1:Array = this._ctrl.heroesWar.getHeroesLevelArea();
            this._heroesWar.renderHeroesLevelArea(_local1);
            this._aryKunLunPlayerList = this._ctrl.heroesWar.getHeroesPlayer();
            this._heroesWar.renderPlayerList(this._aryKunLunPlayerList, FactionType.KunLunCheng);
        }
        private function join_heroes_war(_arg1:Boolean):void{
            if (_arg1){
                this._heroesWar.renderJoinWar(-1);
            } else {
                _view.toolbar.blockHealthInCampWar();
                _view.inCampWar.opened = true;
                this._data.call(Mod_HeroesWar_Base.join_heroes_war, this.joinHeroesWarCallBack, []);
            };
        }
        private function joinHeroesWarCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.getJoinHeroesWar();
            if (_local1["result"] == Mod_HeroesWar_Base.SUCCESS){
                this._heroesWar.renderJoinWar(_local1["result"]);
                this._view.showTip(HeroesWarViewLang.JoinHeroesWar, HeroesWarViewLang.JoinBlessing, TipType.Success);
            } else {
                _view.inCampWar.opened = false;
                this._view.showTip(this.message(_local1["result"]));
            };
            this._heroesWar.renderJoinWar(_local1["result"]);
        }
        private function exit_heroes_war():void{
            this._data.call(Mod_HeroesWar_Base.exit_heroes_war, null, []);
        }
        public function notifyCallBack(_arg1:Object):void{
            var objPlayerHeroesInfo:* = null;
            var obj:* = _arg1;
            switch (obj["notify_type"]){
                case Mod_HeroesWar_Base.OPEN_HEROES_WAR:
                    break;
                case Mod_HeroesWar_Base.END_HEROES_WAR:
                    if (this._heroesWar != null){
                        this._dialog.yesLabel = HeroesWarViewLang.DialogYes;
                        this._dialog.show(HeroesWarViewLang.HeroesWarFinish, AlertButtonType.Yes, null);
                        this._aryWarReport = [];
                        this._aryPlayerWarReport = [];
                        this.close();
                    };
                    this.get_heroes_open_time();
                    this._view.toolbar.updateCampWarInspire(0);
                    break;
                case Mod_HeroesWar_Base.UPDATE_TOP_WINNER:
                    if (this._heroesWar != null){
                        this._heroesWar.renderWinningList(this._ctrl.heroesWar.getNotifyTopWinner());
                    };
                    break;
                case Mod_HeroesWar_Base.UPDATE_PLAYER_HEROES_WAR_INFO:
                    if (this._heroesWar != null){
                        objPlayerHeroesInfo = this._ctrl.heroesWar.getNotifyPlayerHeroesInfo();
                        this._heroesWar.renderPlayerHeroesWarInfo(objPlayerHeroesInfo);
                    };
                    break;
                case Mod_HeroesWar_Base.START_WAR:
                    if (this._heroesWar != null){
                        _view.inCampWar.auto = this._heroesWar.autoJoin;
                        _view.inCampWar.onClose = function (_arg1:Boolean):void{
                            finish_war();
                            showUI();
                            renderAutoJoin();
                            _view.inCampWar.opened = _arg1;
                        };
                        _view.inCampWar.show();
                        this._blnIsInWar = true;
                        this.hideUI();
                    };
                    break;
                case Mod_HeroesWar_Base.CAN_JOIN_HEROES_WAR:
                    if (this._heroesWar != null){
                        this._heroesWar.renderCanJoinWar();
                        this._blnCanJoin = true;
                        this.renderAutoJoin();
                    };
                    break;
            };
        }
        private function notify_report():void{
            this._data.patch(Mod_HeroesWar_Base.notify_report, this.notifyReportCallBack);
        }
        private function notifyReportCallBack():void{
        }
        public function finish_war():void{
            this._blnIsInWar = false;
            this._data.call(Mod_HeroesWar_Base.finish_war, null, []);
        }
        private function buy_buff(_arg1:int):void{
            if (this._blnInBuyBuff){
                return;
            };
            this._blnInBuyBuff = true;
            this._data.call(Mod_HeroesWar_Base.buy_buff, this.buyBuffCallBack, [_arg1]);
        }
        private function buyBuffCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.buyBuff();
            if (_local1["result"] == Mod_HeroesWar_Base.SUCCESS){
                if (_local1["add_buff_value"] == 0){
                    this._heroesWar.renderBuyBuffFail(HeroesWarViewLang.InspireFial);
                } else {
                    this._heroesWar.renderBuyBuffSuccess(Lang.sprintf(HeroesWarViewLang.InspireSuccess, _local1["add_buff_value"]));
                    this._heroesWar.renderBuff(_local1);
                    this._view.toolbar.updateCampWarInspire(_local1["buff_value"]);
                };
            } else {
                if (_local1["result"] == Mod_HeroesWar_Base.NOT_ENOUGH_INGOT){
                    _view.showTip(this.message(_local1.result));
                } else {
                    this._heroesWar.renderBuyBuffFail(this.message(_local1["result"]));
                };
            };
            this._blnInBuyBuff = false;
        }
        private function get_buff():void{
            this._data.call(Mod_HeroesWar_Base.get_buff, this.getBuffCallBack, []);
        }
        private function getBuffCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.getBuff();
            this._view.toolbar.updateCampWarInspire(_local1["buff_value"]);
            if (this._heroesWar != null){
                this._heroesWar.renderBuff(_local1);
            };
        }
        private function syncEndTime():void{
            this._data.call(Mod_HeroesWar_Base.get_heroes_open_time, this.syncEndTimeCallBack, []);
        }
        private function syncEndTimeCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.getCurrentHeroesOpenTime();
            this._intEndTime = _local1["end_time"];
        }
        public function set_robot(_arg1:Boolean):void{
            this._data.call(Mod_HeroesWar_Base.set_robot, this.setRobotCallBack, [((_arg1 == true)) ? Mod_HeroesWar_Base.ON : Mod_HeroesWar_Base.OFF]);
        }
        private function setRobotCallBack():void{
            var _local1:Object = this._ctrl.heroesWar.setRobot();
            if (_local1["result"] != Mod_HeroesWar_Base.SUCCESS){
                this.message(_local1["result"]);
            };
            this._view.activities.get_robot_status_heroes();
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_HeroesWar_Base.SUCCESS:
                    _local2 = HeroesWarViewLang.Success;
                    break;
                case Mod_HeroesWar_Base.CD_TIME:
                    _local2 = HeroesWarViewLang.CdTime;
                    break;
                case Mod_HeroesWar_Base.NOT_ENOUGH_INGOT:
                    _local2 = HeroesWarViewLang.NotEnoughIngot;
                    break;
                case Mod_HeroesWar_Base.NOT_ENOUGH_SKILL:
                    _local2 = HeroesWarViewLang.NotEnoughSkill;
                    break;
                case Mod_HeroesWar_Base.MAX_BUFF:
                    _local2 = HeroesWarViewLang.MaxBuff;
                    break;
                case Mod_HeroesWar_Base.REQUEST_VIP_LEVEL:
                    _local2 = HeroesWarViewLang.RequestVipLevel;
                    break;
                case Mod_HeroesWar_Base.IN_ACTION:
                    _local2 = HeroesWarViewLang.InAction;
                    break;
                default:
                    _local2 = (HeroesWarViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
