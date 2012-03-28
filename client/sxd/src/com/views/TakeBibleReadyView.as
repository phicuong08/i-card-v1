//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class TakeBibleReadyView extends Base implements IView {

        private var _takeBibleReady:ITakeBibleReady;
        private var _inspireNum:int;
        private var _awardState:Number = 0;

        public function get_take_bible_info():void{
            _data.call(Mod_TakeBible_Base.get_take_bible_info, this.getTakeBibleInfoCallBack, []);
        }
        private function buy_protection():void{
            _data.call(Mod_TakeBible_Base.buy_protection, this.buyProtectionInfoCallBack, []);
        }
        private function start_take_bible():void{
            _data.call(Mod_TakeBible_Base.start_take_bible, this.startTakeBibleCallBack, []);
        }
        private function refresh():void{
            _data.call(Mod_TakeBible_Base.refresh, this.refreshCallBack, []);
        }
        private function apply_friend(_arg1:int):void{
            _data.call(Mod_TakeBible_Base.apply_friend, this.applyFriendCallBack, [_arg1]);
        }
        private function cancel_apply_friend():void{
            _data.call(Mod_TakeBible_Base.cancel_apply_friend, new Function(), []);
        }
        public function approve_apply(_arg1:int):void{
            _data.call(Mod_TakeBible_Base.approve_apply, this.approveApplyCallBack, [_arg1]);
        }
        public function reject_apply(_arg1:int):void{
            _data.call(Mod_TakeBible_Base.reject_apply, this.rejectApplyCallBack, [_arg1]);
        }
        public function buy_bless():void{
            _data.call(Mod_TakeBible_Base.buy_bless, this.buyBlessCallBack, []);
        }
        private function getTakeBibleInfoCallBack():void{
            var _local1:Object = _ctrl.TakeBible.getTakeBibleInfo;
            if (inStage){
                this._takeBibleReady.awardState = this._awardState;
                this._takeBibleReady.getEscortData = _local1;
            } else {
                this.renderShow();
            };
        }
        private function buyProtectionInfoCallBack():void{
            var _local1:Object = _ctrl.TakeBible.buyProtection;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                this.get_take_bible_info();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function refreshCallBack():void{
            var _local1:Object = _ctrl.TakeBible.refreshData;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                this.get_take_bible_info();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function applyFriendCallBack():void{
            var _local1:Object = _ctrl.TakeBible.applyFriend;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _view.showTip(TakeBibleReadyViewLang.SuccessApplyFriend, null, TipType.Success);
            } else {
                this.renderMsg(_local1);
            };
        }
        private function approveApplyCallBack():void{
            var _local1:Object = _ctrl.TakeBible.approveApply;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _view.showTip(TakeBibleReadyViewLang.SuccessApproveApply, null, TipType.Success);
            } else {
                this.renderMsg(_local1);
            };
        }
        private function rejectApplyCallBack():void{
            var _local1:Object = _ctrl.TakeBible.approveApply;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _view.showTip(TakeBibleReadyViewLang.SuccessRejectApply, null, TipType.Success);
            } else {
                this.renderMsg(_local1);
            };
        }
        private function startTakeBibleCallBack():void{
            var _local1:Object = _ctrl.TakeBible.startTakeBible;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                _view.showTip(TakeBibleReadyViewLang.StartTakeBable, null, TipType.Success);
                _view.takeBibleRoad.get_take_bible_updata_data();
                this.close();
            } else {
                this.renderMsg(_local1);
                this._takeBibleReady.escortStata = 0;
                _view.takeBibleRoad.takeBibleStatus = 0;
            };
        }
        private function buyBlessCallBack():void{
            var _local1:Object = _ctrl.TakeBible.buyBless;
            if (_local1.msg == Mod_TakeBible_Base.SUCCESS){
                this._takeBibleReady.inspireInfo = _local1.newBless;
            } else {
                this.renderMsg(_local1);
            };
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_TakeBible_Base.FULL_PROTECT_TIMES:
                    _view.showTip(TakeBibleReadyViewLang.FullProtectTimes);
                    break;
                case Mod_TakeBible_Base.CANCEL_APPLY:
                    _view.showTip(TakeBibleReadyViewLang.CancelApply);
                    break;
                case Mod_TakeBible_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(TakeBibleReadyViewLang.NotEnoughIngot);
                    break;
                case Mod_TakeBible_Base.REQUEST_VIP:
                    _view.showTip(TakeBibleReadyViewLang.RequestVip);
                    break;
                case Mod_TakeBible_Base.FULL_TAKE_BIBLE_TIMES:
                    _view.showTip(TakeBibleReadyViewLang.FullTakeBibleTimes);
                    break;
                case Mod_TakeBible_Base.TAKE_BIBLE_STATUS:
                    _view.showTip(TakeBibleReadyViewLang.TakeBibleStatus);
                    break;
                case Mod_TakeBible_Base.INVALID_PLAYER_ID:
                    _view.showTip(TakeBibleReadyViewLang.InvalidPlayerId);
                    break;
                case Mod_TakeBible_Base.FULL_PROTECT_TIMES:
                    _view.showTip(TakeBibleReadyViewLang.FullProtectTimes);
                    break;
                case Mod_TakeBible_Base.NOT_ONLINE:
                    _view.showTip(TakeBibleReadyViewLang.NotOnline);
                    break;
                case Mod_TakeBible_Base.TAKE_BIBLE_STATUS:
                    _view.showTip(TakeBibleReadyViewLang.TakeBibleStatus);
                    break;
            };
        }
        private function renderShow():void{
            loadAssets("TakeBibleReady", this.render, TakeBibleReadyViewLang.LoadAssets);
        }
        public function show():void{
            this.get_take_bible_info();
        }
        public function render():void{
            this._takeBibleReady = (_view.getAssetsObject("TakeBibleReady", "TakeBibleReady") as ITakeBibleReady);
            _popup.addView(this, this._takeBibleReady.content);
            _view.center(sign, this._takeBibleReady.content);
            this._takeBibleReady.tip = _view.tip.iTip;
            this._takeBibleReady.drag = _view.drag.iDrag;
            this.renderReady();
        }
        private function renderReady():void{
            this._takeBibleReady.init();
            this.getTakeBibleInfoCallBack();
            this._takeBibleReady.vipLevel = _ctrl.player.vipLevel;
            this._takeBibleReady.onRefreshAngel = function (_arg1:int):void{
                var callback:* = null;
                var value:* = _arg1;
                if ((((_view.vipEnabled == false)) || ((_view.ingotEnough(value) == false)))){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TakeBibleRefreshAngel)){
                    dialog.yesLabel = TakeBibleReadyViewLang.Sure;
                    dialog.cancelLabel = TakeBibleReadyViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            refresh();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TakeBibleRefreshAngel, true);
                        };
                    };
                    dialog.show(Lang.sprintf(TakeBibleReadyViewLang.RefreshAngel, HtmlText.yellow((value + TakeBibleReadyViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    refresh();
                };
            };
            this._takeBibleReady.onStartEscort = function (_arg1:Boolean, _arg2:int):void{
                _inspireNum = _arg2;
                if (_arg1){
                    _view.alert.showYesNoMsg(TakeBibleReadyViewLang.StartEscort, TakeBibleReadyViewLang.Sure, TakeBibleReadyViewLang.Cancel, onStartEscort);
                } else {
                    startTakeBible();
                };
            };
            this._takeBibleReady.onInspire = function ():void{
                var callback:* = null;
                if ((((_view.vipEnabled == false)) || ((_view.ingotEnough(15) == false)))){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TakeBibleInspire)){
                    dialog.yesLabel = TakeBibleReadyViewLang.Sure;
                    dialog.cancelLabel = TakeBibleReadyViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            buy_bless();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TakeBibleInspire, true);
                        };
                    };
                    dialog.show(Lang.sprintf(TakeBibleReadyViewLang.InspireInfo, HtmlText.yellow(("15" + TakeBibleReadyViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    buy_bless();
                };
            };
            this._takeBibleReady.onSummon = function ():void{
                var callback:* = null;
                if (_view.ingotEnough(200) == false){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.SummerTS)){
                    dialog.yesLabel = TakeBibleReadyViewLang.Sure;
                    dialog.cancelLabel = TakeBibleReadyViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            buy_protection();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.SummerTS, true);
                        };
                    };
                    dialog.show(Lang.sprintf(TakeBibleReadyViewLang.SummonTS, HtmlText.yellow(("200" + TakeBibleReadyViewLang.Ingot)), HtmlText.yellow(("40%" + TakeBibleReadyViewLang.LifeAndPower))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    buy_protection();
                };
            };
            this._takeBibleReady.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case "isApplyFriend":
                        _view.showTip(TakeBibleReadyViewLang.isApplyFriend);
                        break;
                    case "remainProtectTimes":
                        _view.showTip(TakeBibleReadyViewLang.remainProtectTimes);
                        break;
                    case "protectStatus":
                        _view.showTip(TakeBibleReadyViewLang.protectStatus);
                        break;
                };
            };
            this._takeBibleReady.onSure = function (_arg1:Object):void{
                apply_friend(_arg1.playerId);
            };
            this._takeBibleReady.onCancel = function ():void{
                cancel_apply_friend();
            };
            this._takeBibleReady.onClose = function ():void{
                close();
            };
            this.reposition();
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function startTakeBible():void{
            this._takeBibleReady.escortStata = 1;
            _view.takeBibleRoad.takeBibleStatus = 1;
            _view.takeBibleRoad.isUserProtection = this._inspireNum;
            _view.takeBibleRoad.get_take_bible_updata_data();
            this.start_take_bible();
        }
        public function hasApplyFriend(_arg1:Boolean):void{
            if (inStage){
                this._takeBibleReady.hasApplyFriend(_arg1);
            };
        }
        public function set awardState(_arg1:Number):void{
            this._awardState = _arg1;
        }
        public function set isUserProtection(_arg1:int):void{
            this._takeBibleReady.isUserProtection = _arg1;
        }
        private function onStartEscort(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.startTakeBible();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function onSummonHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.buy_protection();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function onSummonTS(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.buy_protection();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function set escortStata(_arg1:int):void{
            if (this.inStage){
                this._takeBibleReady.escortStata = _arg1;
            };
        }
        private function onBuyFateGridHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            var _local2:Point = Structure.stageOffset;
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._takeBibleReady.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function clear():void{
            if (this._takeBibleReady == null){
                return;
            };
            this._takeBibleReady.clear();
            this._takeBibleReady = null;
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }

    }
}//package com.views 
