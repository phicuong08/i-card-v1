//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MissionPracticeView extends Base implements IView {

        public var onSaoDanStart:Function;
        public var missionId:int = 0;
        public var monsterLen:int = 0;
        private var _autoNum:int = 0;
        private var _practiceInfo:Object;
        private var _missionPractice:IMissionPractice;
        private var _quicklyTime:int = 0;
        private var _isBatton:Boolean = false;
        private var _inStage:Boolean = false;
        private var _battleTimer:int = 0;
        private var _isQuickly:Boolean = false;
        private var _isAutoPower:Boolean = false;
        private var _isAutoBuyAward:Boolean = false;
        private var _lostPowerNum:int = 0;
        private var _continuePracticeInfo:Object;
        private var _isContinue:Boolean = false;

        public function MissionPracticeView(){
            this.onSaoDanStart = new Function();
            super();
            _inStageTipTitle = MissionPracticeViewLang.inStageTipTitle;
            _inStageTipContent = "";
        }
        public function get_practice_info():void{
            _data.call(Mod_MissionPractice_Base.get_practice_info, this.pricticeInfoCallBack, [this.missionId]);
        }
        public function start_practice():void{
            _data.call(Mod_MissionPractice_Base.start_practice, this.startPracticeCallBack, [this.missionId, this._battleTimer, this._autoNum]);
        }
        public function cancel_practice():void{
            _data.call(Mod_MissionPractice_Base.cancel_practice, new Function(), []);
            this._isBatton = false;
        }
        public function quickly():void{
            _data.call(Mod_MissionPractice_Base.quickly, this.quicklyCallBack, [this._quicklyTime]);
        }
        public function set_auto_sale_item():void{
            _data.call(Mod_MissionPractice_Base.set_auto_sale_item, this.setAutoSaleCallBack, []);
        }
        public function cancel_auto_sale_item():void{
            _data.call(Mod_MissionPractice_Base.cancel_auto_sale_item, this.cancelAutoCallBack, []);
        }
        public function notify():void{
            _data.patch(Mod_MissionPractice_Base.notify, this.notifyCallBack);
        }
        public function notifyState():void{
        }
        public function pricticeInfoCallBack():void{
            this._practiceInfo = this._ctrl.missionPractice.practiceInfo;
            this._practiceInfo.monsterLen = this.monsterLen;
            if (this.inStage){
                this._missionPractice.packNum = _view.ctrl.player.packNum;
            } else {
                this.renderShow();
            };
        }
        public function startPracticeCallBack():void{
            var _local1:Object = this._ctrl.missionPractice.startPractice;
            if (_local1.msg == Mod_MissionPractice_Base.SUCCESS){
                this.onSaoDanStart();
                this.quickly();
                this._missionPractice.getPracticeInfoDownTimer = _local1.practiceTime;
                this._missionPractice.getBattleNum = _local1.remainWarTimes;
                this._missionPractice.newBattleStart();
                this._isBatton = true;
                if (_view.chooseMission.inStage){
                    _view.chooseMission.close();
                };
            } else {
                this.renderMsg(_local1.msg);
            };
            this._missionPractice.getPracticeInfoData = this._practiceInfo;
            this._missionPractice.packNum = _view.ctrl.player.packNum;
            this._missionPractice.cdTimer = 0;
        }
        private function setAutoSaleCallBack():void{
            var _local1:Object = _ctrl.missionPractice.setAutoSale;
            if (_local1.msg == Mod_MissionPractice_Base.SUCCESS){
                _view.showTip(MissionPracticeViewLang.SetAutoSale);
                this._autoNum = 1;
            };
        }
        private function cancelAutoCallBack():void{
            var _local1:Object = _ctrl.missionPractice.cancelAutoSale;
            if (_local1.msg == Mod_MissionPractice_Base.SUCCESS){
                _view.showTip(MissionPracticeViewLang.CancelAutoSale);
                this._autoNum = 0;
            };
        }
        public function quicklyCallBack():void{
            var _local1:Object = this._ctrl.missionPractice.quickly;
            if (_local1.msg == Mod_MissionPractice_Base.SUCCESS){
                this._missionPractice.cdTimer = _local1.timer;
            } else {
                this.renderMsg(_local1.msg);
            };
            this._missionPractice.packNum = _view.ctrl.player.packNum;
        }
        public function notifyCallBack():void{
            var _local1:Object = this._ctrl.missionPractice.notify;
            switch (_local1.type){
                case Mod_MissionPractice_Base.NEW_WAR_REPORT:
                    this._missionPractice.getBattleInfoList = _local1.newWarReport;
                    break;
                case Mod_MissionPractice_Base.RANK_REPORT:
                    this._missionPractice.getBattleInfoList = _local1.rankReport;
                    _view.pack.resetPack();
                    if ((((((((this._ctrl.player.power <= 150)) && (this._isAutoPower))) && ((_view.toolbar.isBuy == false)))) && ((_view.toolbar.isCanBuy == true)))){
                        _view.toolbar.buy_power();
                    };
                    break;
                case Mod_MissionPractice_Base.UPDATE_TIME:
                    this._missionPractice.getPracticeInfoDownTimer = _local1.remainTime;
                    this._missionPractice.getBattleNum = _local1.remainWarTimes;
                    break;
                case Mod_MissionPractice_Base.BAG_FULL:
                    this.renderMsg(Mod_MissionPractice_Base.BAG_FULL);
                    break;
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_MissionPractice_Base.NOT_ENOUGH_POWER:
                    _view.showTip(MissionPracticeViewLang.NotEnoughPower);
                    break;
                case Mod_MissionPractice_Base.BAG_FULL:
                    _view.alert.confirm(MissionPracticeViewLang.BagFull);
                    break;
                case Mod_MissionPractice_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(MissionPracticeViewLang.NotEnoughIngot);
                    return;
            };
            this._missionPractice.getBattleNum = 0;
        }
        public function show():void{
            _view.toolbar.isCanBuy = true;
            if (_view.tower.inStage){
                _view.showTip(MissionPracticeViewLang.Quit);
                return;
            };
            if (this._continuePracticeInfo != null){
                this.renderShow();
            } else {
                this.get_practice_info();
            };
            _inStageTipContent = MissionPracticeViewLang.InStageTipContent;
        }
        private function renderShow():void{
            loadAssets("MissionPractice", this.render, MissionPracticeViewLang.LoadAssets);
        }
        public function render():void{
            this._inStage = true;
            this._missionPractice = (_view.getAssetsObject("MissionPractice", "MissionPractice") as IMissionPractice);
            _popup.addChild(this._missionPractice.content);
            _view.center(sign, this._missionPractice.content);
            this._missionPractice.tip = _view.tip.iTip;
            this._missionPractice.drag = _view.drag.iDrag;
            if (this._continuePracticeInfo != null){
                this._practiceInfo = this._continuePracticeInfo.practiceInfo;
                this._missionPractice.getPracticeInfoData = this._continuePracticeInfo.practiceInfo;
                this._missionPractice.getPracticeInfoDownTimer = this._continuePracticeInfo.remainTime;
                this._missionPractice.getBattleNum = this._continuePracticeInfo.remainWarTimes;
                this._missionPractice.newBattleStart();
                this.missionId = this._continuePracticeInfo.missionId;
                this._isBatton = true;
            } else {
                this._missionPractice.getPracticeInfoData = this._practiceInfo;
            };
            var obj:* = MissionType.getMissionDataByMissionId(this.missionId);
            this._missionPractice.titleName = (obj.mainName + obj.missionNum);
            this._missionPractice.packNum = _view.ctrl.player.packNum;
            this._missionPractice.isShowCheck = VIPType.check(VIPType.Level7);
            this.upDataPower = _ctrl.player.power;
            this.notify();
            this._missionPractice.onStartPractice = function (_arg1:int):void{
                _battleTimer = _arg1;
                if (_view.ctrl.player.packNum <= 0){
                    _view.showTip(MissionPracticeViewLang.BagFull);
                    return;
                };
                if (_view.ctrl.player.packNum <= 3){
                    _view.alert.showYesNoMsg(MissionPracticeViewLang.BagLost, MissionPracticeViewLang.Sure, MissionPracticeViewLang.Cancel, onClosePractice);
                    return;
                };
                if (_ctrl.player.playerInfo.practice == Mod_Town_Base.ON_PRACTICE){
                    _view.alert.showYesNoMsg(MissionPracticeViewLang.OnPractice, MissionPracticeViewLang.Sure, MissionPracticeViewLang.Cancel, onClosePractice);
                    return;
                };
                if ((((((((_ctrl.player.power <= 150)) && (_isAutoPower))) && ((_view.toolbar.isBuy == false)))) && ((_view.toolbar.isCanBuy == true)))){
                    _view.toolbar.buy_power();
                };
                start_practice();
            };
            this._missionPractice.onQuickly = function (_arg1:int):void{
                var callback:* = null;
                var time:* = _arg1;
                if (_view.vipEnabled == false){
                    return;
                };
                _quicklyTime = 30;
                var packStr:* = "";
                if (_view.ctrl.player.packNum <= 3){
                    packStr = MissionPracticeViewLang.BagNum;
                };
                var str:* = (packStr + Lang.sprintf(MissionPracticeViewLang.Quickly30, HtmlText.yellow(("30" + MissionPracticeViewLang.Ingot))));
                if (time > 3600){
                    _quicklyTime = 60;
                    str = (packStr + Lang.sprintf(MissionPracticeViewLang.Quickly60, HtmlText.yellow(("60" + MissionPracticeViewLang.Ingot))));
                };
                if (time > 7200){
                    _quicklyTime = 120;
                    str = (packStr + Lang.sprintf(MissionPracticeViewLang.Quickly120, HtmlText.yellow(("120" + MissionPracticeViewLang.Ingot))));
                };
                if (time > 10800){
                    _quicklyTime = 180;
                    str = (packStr + Lang.sprintf(MissionPracticeViewLang.Quickly180, HtmlText.yellow(("180" + MissionPracticeViewLang.Ingot))));
                };
                if (_view.ingotEnough(_quicklyTime) == false){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.MissionPracticeQuickly)){
                    dialog.yesLabel = MissionPracticeViewLang.Sure;
                    dialog.cancelLabel = MissionPracticeViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            quickly();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.MissionPracticeQuickly, true);
                        };
                    };
                    dialog.show(str, (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    quickly();
                };
            };
            this._missionPractice.onQuitPractice = function ():void{
                if (_isQuickly){
                    _view.showTip(MissionPracticeViewLang.InQuickly);
                } else {
                    cancel_practice();
                    _missionPractice.getBattleNum = 0;
                    upDataPower = _ctrl.player.power;
                };
            };
            this._missionPractice.onIsQuickly = function (_arg1:Boolean):void{
                _isQuickly = _arg1;
            };
            this._missionPractice.onClose = function ():void{
                close();
            };
            this._missionPractice.onStop = function ():void{
                _isBatton = false;
                upDataPower = _ctrl.player.power;
            };
            this._missionPractice.onTextLink = function (_arg1:TextEvent):void{
                _view.toolbar.onTextLink(_arg1);
            };
            this._missionPractice.onPowerTip = function (_arg1:String):void{
                powerTip(_arg1);
            };
            this._missionPractice.onAutoBuyPower = function (_arg1:Boolean):void{
                _isAutoPower = _arg1;
            };
            this._missionPractice.onAutoBuyAward = function (_arg1:Boolean):void{
                if (_isBatton == false){
                    _autoNum = ((_arg1 == true)) ? 1 : 0;
                } else {
                    _view.showTip(MissionPracticeViewLang.InButtle);
                };
                _missionPractice.autoBuyAwardState = (_autoNum == 1);
            };
            this._missionPractice.getLostPowerNum = this._lostPowerNum;
            this._missionPractice.autoBuyPowerState = this._isAutoPower;
            this._missionPractice.autoBuyAwardState = (this._autoNum == 1);
            if (this._isContinue){
                this.continue_practice();
            };
        }
        private function powerTip(_arg1:String):void{
            switch (_arg1){
                case "noButtleNum":
                    _view.showTip(MissionPracticeViewLang.setButtleNum);
                    break;
                case "PowerTip":
                    _view.showTip(MissionPracticeViewLang.NoPowerUser);
                    break;
                case "noPower":
                    _view.showTip(MissionPracticeViewLang.NoPower);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function set upDataPower(_arg1:int):void{
            if (this._isBatton){
                return;
            };
            var _local2:int;
            if (this._ctrl.player.extraPower > 0){
                _local2 = this._ctrl.player.extraPower;
            };
            if (((this._inStage) && ((this._isBatton == false)))){
                this._missionPractice.getCurrentPower = (_arg1 + _local2);
            };
        }
        public function set pickNum(_arg1:int):void{
            if (this._inStage){
                this._missionPractice.packNum = _arg1;
            };
        }
        public function set getLostPowerNum(_arg1:int):void{
            this._lostPowerNum = _arg1;
            if (this.inStage){
                this._missionPractice.getLostPowerNum = _arg1;
            };
        }
        public function set continuePracticeInfo(_arg1:Object):void{
            this._continuePracticeInfo = _arg1;
        }
        override public function get inStage():Boolean{
            return (this._inStage);
        }
        public function get isBatton():Boolean{
            return (this._isBatton);
        }
        public function onQuicklyMission(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.quickly();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onClosePractice(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    _view.toolbar.closePractice();
                    this.start_practice();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function get_continue_practice_info():void{
            _data.call(Mod_MissionPractice_Base.get_continue_practice_info, this.continuePracticeCallBack, []);
        }
        private function continue_practice():void{
            _data.call(Mod_MissionPractice_Base.continue_practice, new Function(), []);
            this.quickly();
        }
        private function continuePracticeCallBack():void{
            var _local1:Object = this._ctrl.missionPractice.continuePracticeInfo;
            if (_local1.remainWarTimes > 0){
                this._isContinue = true;
                this._continuePracticeInfo = _local1;
                this._autoNum = _local1.isAutoSaleItem;
                this.show();
            };
        }
        public function clear():void{
            this._missionPractice.clear();
        }
        public function close():void{
            this._isContinue = false;
            if (this._isQuickly){
                _view.showTip(MissionPracticeViewLang.InQuickly);
                return;
            };
            Helper.gc();
            this.clear();
            this._continuePracticeInfo = null;
            this._inStage = false;
            if (this._isBatton){
                this.cancel_practice();
            };
            _data.cancelPatch(Mod_MissionPractice_Base.notify);
            _popup.removeChild(this._missionPractice.content);
        }

    }
}//package com.views 
