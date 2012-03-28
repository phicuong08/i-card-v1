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

    public class CampWarView extends Base implements IView {

        private var _campWar:ICampWar;
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

        public function CampWarView(){
            this._aryWarReport = [];
            this._aryPlayerWarReport = [];
            this._aryShuShanPlayerList = [];
            this._aryKunLunPlayerList = [];
            this._aryCachePlayer = [];
            this._aryCacheWarReport = [];
            super();
            _inStageTipTitle = CampWarViewLang.InCampWar;
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
            this._campWar = null;
            _view.inCampWar.opened = false;
        }
        public function clear():void{
            this._view.removeFromTimerProcessList(this.sign);
            this._campWar.clear();
            this._data.cancelPatch(Mod_CampWar_Base.notify_report);
            this._ctrl.campWar.getPlayerStatusData();
            this._ctrl.campWar.getWarReport();
            this._aryCachePlayer = [];
            this._aryCacheWarReport = [];
            this.close_camp_war();
            _view.townMap.otherCount = 999;
        }
        public function updateSkill(_arg1:int):void{
            if (((this.inStage) || (!((this._campWar == null))))){
                this._campWar.updateSkill(_arg1);
            };
        }
        public function getBuff():void{
            this.get_buff();
        }
        private function loadData():void{
            _data.call(Mod_CampWar_Base.get_camp_open_time, this.loadDataCallBack, []);
        }
        private function loadDataCallBack():void{
            var callBack:* = function ():void{
                var _local1:Object = _ctrl.campWar.getCurrentCampOpenTime();
                var _local2:int = _ctrl.campWar.getIsOpenCampWar();
                _view.activities.activityShowCampWar(_local2, _local1["start_time"], _local1["end_time"]);
                if ((((_local2 == 0)) || ((_local2 == 2)))){
                    _view.showTip(CampWarViewLang.CampWar, CampWarViewLang.NoToOpenTime);
                    return;
                };
                render();
                _intEndTime = _local1["end_time"];
                open_camp_war();
                getCampPlayerByShuShan();
                notify_report();
                get_buff();
                timer();
                _view.addToTimerProcessList(sign, timer);
            };
            loadAssets("CampWar", callBack, CampWarViewLang.LoadInfo);
        }
        private function render():void{
            this._campWar = (_view.getAssetsObject("CampWar", "CampWar") as ICampWar);
            this.init();
            this._campWar.render();
            this._campWar.updateSkill(this._ctrl.player.skill);
            if (this._aryWarReport.length > 0){
                this._campWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
            };
        }
        private function showUI():void{
            if (this._campWar == null){
                return;
            };
            _popup.addView(this, this._campWar.content);
            _view.center(sign, this._campWar.content);
        }
        private function hideUI():void{
            _popup.closeView(this);
        }
        private function init():void{
            this._intCanOpenUI = 0;
            this._blnIsInWar = false;
            this._blnCanJoin = false;
            this._blnInBuyBuff = false;
            this._campWar.loadBtnCartoon([(URI.addonsUrl + "button_effect.swf")]);
            this._campWar.drag = this._view.drag.iDrag;
            this._campWar.tip = _view.tip.iTip;
            if (this._dialog == null){
                this._dialog = _view.alert.iAlert;
            };
            this._campWar.playerLevel = this._ctrl.player.level;
            this._campWar.playerID = this._ctrl.player.playerId;
            this._campWar.onClose = this.close;
            this._campWar.onJoinWar = this.joinCampWar;
            this._campWar.onExitWar = this.exit_camp_war;
            this._campWar.onIngotInspire = this.buyBuff;
            this._campWar.onSkillInspire = this.buyBuff;
            this._campWar.onTextLink = this._view.toolbar.onTextLink;
            _view.townMap.otherCount = 0;
        }
        private function timer():void{
            if (this._intEndTime > 0){
                this._intEndTime--;
                this._campWar.renderCampWarEndTime(DateTime.formatFromSecond(this._intEndTime));
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
                if (this._ctrl.campWar.getPlayerStatusDataLength > 0){
                    this._aryCachePlayer = this._ctrl.campWar.getPlayerStatusData();
                };
            };
            if (this._aryCacheWarReport.length > this._intRenderRecordCount){
                this.updateWarReport(this._aryCacheWarReport.splice(0, 15));
            } else {
                if (this._ctrl.campWar.getWarReportLength > 0){
                    this._aryCacheWarReport = this._ctrl.campWar.getWarReport();
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
            if ((((intType == Mod_CampWar_Base.PAY_INGOT)) && (!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.CampWarIngotBuyBuff))))){
                this._dialog.yesLabel = CampWarViewLang.DialogYes;
                this._dialog.cancelLabel = CampWarViewLang.DialogCancel;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(CampWarViewLang.BuyBuff, HtmlText.yellow(CampWarViewLang.BuyBuffIngot)), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.buy_buff(intType);
            };
        }
        private function joinCampWar():void{
            this._view.toolbar.checkWarCdTime(this.join_camp_war);
        }
        private function updatePlayerStatus(_arg1:Array):void{
            var _local4:Object;
            var _local2:Boolean;
            var _local3:Boolean;
            for each (_local4 in _arg1) {
                if (_local4["camp_id"] == FactionType.campId(FactionType.ShuShanCheng)){
                    this.updateShuShanPlayerStatus(_local4);
                    _local2 = true;
                } else {
                    this.updateKunLunPlayerStatus(_local4);
                    _local3 = true;
                };
            };
            if (_local2){
                this._campWar.setShuShanPlayerList();
                this._campWar.renderShuShanInfo(this.toatlPlayerCount(this._aryShuShanPlayerList));
            };
            if (_local3){
                this._campWar.setKunLunPlayerList();
                this._campWar.renderKunLunInfo(this.toatlPlayerCount(this._aryKunLunPlayerList));
            };
        }
        private function updateShuShanPlayerStatus(_arg1:Object):void{
            var _local3:int;
            var _local2:Object = {};
            if (_arg1["status"] == Mod_CampWar_Base.PLAYER_JOIN_CAMP_WAR){
                for each (_local2 in this._aryShuShanPlayerList) {
                    if (_arg1["player_id"] == _local2["player_id"]){
                        return;
                    };
                };
                this._aryShuShanPlayerList.push(_arg1);
            } else {
                if (_arg1["status"] == Mod_CampWar_Base.PLAYER_EXIT_CAMP_WAR){
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
            this._campWar.renderPlayer(_arg1, FactionType.ShuShanCheng);
        }
        private function updateKunLunPlayerStatus(_arg1:Object):void{
            var _local3:int;
            var _local2:Object = {};
            if (_arg1["status"] == Mod_CampWar_Base.PLAYER_JOIN_CAMP_WAR){
                for each (_local2 in this._aryKunLunPlayerList) {
                    if (_arg1["player_id"] == _local2["player_id"]){
                        return;
                    };
                };
                this._aryKunLunPlayerList.push(_arg1);
            } else {
                if (_arg1["status"] == Mod_CampWar_Base.PLAYER_EXIT_CAMP_WAR){
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
            this._campWar.renderPlayer(_arg1, FactionType.KunLunCheng);
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
                if (this._campWar.WarReportType == 1){
                    this._campWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
                };
            } else {
                if (this._campWar.WarReportType == 1){
                    this._campWar.renderWarReport(this._aryWarReport, this._aryPlayerWarReport, _arg1);
                };
            };
            if (this._aryWarReport.length > 30){
                this._aryWarReport.splice(0, (this._aryWarReport.length - 15));
                if (this._campWar.WarReportType == 0){
                    this._campWar.renderWarReportList(this._aryWarReport, this._aryPlayerWarReport);
                };
            } else {
                if (this._campWar.WarReportType == 0){
                    this._campWar.renderWarReport(this._aryWarReport, this._aryPlayerWarReport, _arg1);
                };
            };
        }
        private function renderAutoJoin():void{
            if (((this._blnCanJoin) && (!(this._blnIsInWar)))){
                this._campWar.renderAutoJoin();
                this._blnCanJoin = false;
            };
        }
        public function get_camp_open_time():void{
            this._data.call(Mod_CampWar_Base.get_camp_open_time, this.getCampOpenTimeCallBack, []);
        }
        private function getCampOpenTimeCallBack():void{
            var _local1:Object = this._ctrl.campWar.getCurrentCampOpenTime();
            var _local2:int = this._ctrl.campWar.getIsOpenCampWar();
            this._view.activities.get_robot_status();
        }
        private function open_camp_war():void{
            this._data.call(Mod_CampWar_Base.open_camp_war, this.openCampWarCallBack, []);
        }
        private function openCampWarCallBack():void{
            this.isShowUI();
            var _local1:Object = this._ctrl.campWar.openCampWar();
            this._campWar.renderWinningList(_local1);
            this._campWar.renderIntegral(_local1);
            this._campWar.renderPlayerCampWarInfo(_local1);
        }
        private function close_camp_war():void{
            this._data.call(Mod_CampWar_Base.close_camp_war, null, []);
        }
        private function getCampPlayerByShuShan():void{
            this._data.call(Mod_CampWar_Base.get_camp_player, this.getCampPlayerByShuShanCallBack, [FactionType.campId(FactionType.ShuShanCheng)]);
        }
        private function getCampPlayerByShuShanCallBack():void{
            this.isShowUI();
            var _local1:Array = this._ctrl.campWar.getCampLevelArea();
            this._campWar.renderCampLevelArea(_local1);
            this._aryShuShanPlayerList = this._ctrl.campWar.getCampPlayer();
            this._campWar.renderPlayerList(this._aryShuShanPlayerList, FactionType.ShuShanCheng);
            this.getCampPlayerByKunLun();
        }
        private function getCampPlayerByKunLun():void{
            this._data.call(Mod_CampWar_Base.get_camp_player, this.getCampPlayerByKunLunCallBack, [FactionType.campId(FactionType.KunLunCheng)]);
        }
        private function getCampPlayerByKunLunCallBack():void{
            this.isShowUI();
            var _local1:Array = this._ctrl.campWar.getCampLevelArea();
            this._campWar.renderCampLevelArea(_local1);
            this._aryKunLunPlayerList = this._ctrl.campWar.getCampPlayer();
            this._campWar.renderPlayerList(this._aryKunLunPlayerList, FactionType.KunLunCheng);
        }
        private function join_camp_war(_arg1:Boolean):void{
            if (_arg1){
                this._campWar.renderJoinWar(-1);
            } else {
                _view.toolbar.blockHealthInCampWar();
                _view.inCampWar.opened = true;
                this._data.call(Mod_CampWar_Base.join_camp_war, this.joinCampWarCallBack, []);
            };
        }
        private function joinCampWarCallBack():void{
            var _local1:Object = this._ctrl.campWar.getJoinCampWar();
            if (_local1["result"] == Mod_CampWar_Base.SUCCESS){
                this._view.showTip(CampWarViewLang.JoinCampWar, CampWarViewLang.JoinBlessing, TipType.Success);
            } else {
                _view.inCampWar.opened = false;
                this._view.showTip(this.message(_local1["result"]));
            };
            this._campWar.renderJoinWar(_local1["result"]);
        }
        private function exit_camp_war():void{
            this._data.call(Mod_CampWar_Base.exit_camp_war, null, []);
        }
        public function notifyCallBack(_arg1:Object):void{
            var objPlayerCampInfo:* = null;
            var objIntegral:* = null;
            var obj:* = _arg1;
            switch (obj["notify_type"]){
                case Mod_CampWar_Base.OPEN_CAMP_WAR:
                    break;
                case Mod_CampWar_Base.END_CAMP_WAR:
                    if (this._campWar != null){
                        this._dialog.yesLabel = CampWarViewLang.DialogYes;
                        this._dialog.show(CampWarViewLang.CampWarFinish, AlertButtonType.Yes, null);
                        this._aryWarReport = [];
                        this._aryPlayerWarReport = [];
                        this.close();
                    };
                    this.get_camp_open_time();
                    this._view.toolbar.updateCampWarInspire(0);
                    break;
                case Mod_CampWar_Base.UPDATE_TOP_WINNER:
                    if (this._campWar != null){
                        this._campWar.renderWinningList(this._ctrl.campWar.getNotifyTopWinner()[0]);
                    };
                    break;
                case Mod_CampWar_Base.UPDATE_PLAYER_CAMP_WAR_INFO:
                    if (this._campWar != null){
                        objPlayerCampInfo = this._ctrl.campWar.getNotifyPlayerCampInfo();
                        this._campWar.renderPlayerCampWarInfo(objPlayerCampInfo);
                    };
                    break;
                case Mod_CampWar_Base.START_WAR:
                    if (this._campWar != null){
                        _view.inCampWar.auto = this._campWar.autoJoin;
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
                case Mod_CampWar_Base.CAN_JOIN_CAMP_WAR:
                    if (this._campWar != null){
                        this._campWar.renderCanJoinWar();
                        this._blnCanJoin = true;
                        this.renderAutoJoin();
                    };
                    break;
                case Mod_CampWar_Base.UPDATE_INTEGRAL:
                    if (this._campWar != null){
                        objIntegral = this._ctrl.campWar.getNotifyIntegral();
                        this._campWar.renderIntegral(objIntegral);
                    };
                    break;
            };
        }
        private function notify_report():void{
            this._data.patch(Mod_CampWar_Base.notify_report, this.notifyReportCallBack);
        }
        private function notifyReportCallBack():void{
        }
        public function finish_war():void{
            this._blnIsInWar = false;
            this._data.call(Mod_CampWar_Base.finish_war, null, []);
        }
        private function buy_buff(_arg1:int):void{
            if (this._blnInBuyBuff){
                return;
            };
            this._blnInBuyBuff = true;
            this._data.call(Mod_CampWar_Base.buy_buff, this.buyBuffCallBack, [_arg1]);
        }
        private function buyBuffCallBack():void{
            var _local1:Object = this._ctrl.campWar.buyBuff();
            if (_local1["result"] == Mod_CampWar_Base.SUCCESS){
                if (_local1["add_buff_value"] == 0){
                    this._campWar.renderBuyBuffFail(CampWarViewLang.InspireFial);
                } else {
                    this._campWar.renderBuyBuffSuccess(Lang.sprintf(CampWarViewLang.InspireSuccess, _local1["add_buff_value"]));
                    this._campWar.renderBuff(_local1);
                    this._view.toolbar.updateCampWarInspire(_local1["buff_value"]);
                };
            } else {
                if (_local1["result"] == Mod_CampWar_Base.NOT_ENOUGH_INGOT){
                    _view.showTip(this.message(_local1.result));
                } else {
                    this._campWar.renderBuyBuffFail(this.message(_local1["result"]));
                };
            };
            this._blnInBuyBuff = false;
        }
        private function get_buff():void{
            this._data.call(Mod_CampWar_Base.get_buff, this.getBuffCallBack, []);
        }
        private function getBuffCallBack():void{
            var _local1:Object = this._ctrl.campWar.getBuff();
            this._view.toolbar.updateCampWarInspire(_local1["buff_value"]);
            if (this._campWar != null){
                this._campWar.renderBuff(_local1);
            };
        }
        private function syncEndTime():void{
            this._data.call(Mod_CampWar_Base.get_camp_open_time, this.syncEndTimeCallBack, []);
        }
        private function syncEndTimeCallBack():void{
            var _local1:Object = this._ctrl.campWar.getCurrentCampOpenTime();
            this._intEndTime = _local1["end_time"];
        }
        public function set_robot(_arg1:Boolean):void{
            this._data.call(Mod_CampWar_Base.set_robot, this.setRobotCallBack, [((_arg1 == true)) ? Mod_CampWar_Base.ON : Mod_CampWar_Base.OFF]);
        }
        private function setRobotCallBack():void{
            var _local1:Object = this._ctrl.campWar.setRobot();
            if (_local1["result"] != Mod_CampWar_Base.SUCCESS){
                this.message(_local1["result"]);
            };
            this._view.activities.get_robot_status();
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_CampWar_Base.SUCCESS:
                    _local2 = CampWarViewLang.Success;
                    break;
                case Mod_CampWar_Base.CD_TIME:
                    _local2 = CampWarViewLang.CdTime;
                    break;
                case Mod_CampWar_Base.NOT_ENOUGH_INGOT:
                    _local2 = CampWarViewLang.NotEnoughIngot;
                    break;
                case Mod_CampWar_Base.NOT_ENOUGH_SKILL:
                    _local2 = CampWarViewLang.NotEnoughSkill;
                    break;
                case Mod_CampWar_Base.MAX_BUFF:
                    _local2 = CampWarViewLang.MaxBuff;
                    break;
                case Mod_CampWar_Base.REQUEST_VIP_LEVEL:
                    _local2 = CampWarViewLang.RequestVipLevel;
                    break;
                case Mod_CampWar_Base.IN_ACTION:
                    _local2 = CampWarViewLang.InAction;
                    break;
                default:
                    _local2 = (CampWarViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
