//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class RuneView extends Base implements IView {

        private var _isUser:Boolean = false;
        private var _isRuneUser:Boolean = false;
        private var _userIngot:int = 0;
        private var _userbatchRuneIngot:int = 0;
        private var _oldAutoData:Object;
        private var _alert:IAlert;
        private var _rune:IRune;

        public function rune_list():void{
            if (VIPType.enabled == false){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Rune)){
                _data.call(Mod_Rune_Base.rune_list, this.runeListCallback, []);
            };
        }
        private function rune_use():void{
            _data.call(Mod_Rune_Base.rune_use, this.runeUseCallback, []);
        }
        public function batch_rune_list():void{
            this._isUser = true;
            _data.call(Mod_Rune_Base.batch_rune_list, this.batchRuneListCallback, []);
        }
        public function batch_rune_use():void{
            this._rune.sureBtnShow = false;
            _data.call(Mod_Rune_Base.batch_rune_use, this.batchRuneUseCallback, []);
        }
        public function auto_rune_info():void{
            _data.call(Mod_Rune_Base.auto_rune_info, this.autoRuneInfoCallback, []);
        }
        public function set_auto_rune(_arg1:int, _arg2:int):void{
            _data.call(Mod_Rune_Base.set_auto_rune, this.setAutoRuneCallback, [_arg1, _arg2]);
        }
        private function runeListCallback():void{
            var _local1:Object = this._ctrl.rune.runeList;
            this.isBtnUser(_local1, false);
            this._userIngot = _local1.ingot;
        }
        private function runeUseCallback():void{
            var _local1:Object = this._ctrl.rune.runeUse;
            if (_local1.msg == Mod_Rune_Base.SUCCEED){
                this._rune.upGrade = _local1.coins;
                _view.chat.addSystemMessage(Lang.sprintf(RuneViewLang.UserIngot, _local1.coins));
            } else {
                this.renderMsg(_local1.msg);
            };
            this.renderMsg(_local1.msg);
            this.isBtnUser(_local1);
            this._userIngot = _local1.ingot;
        }
        public function batchRuneListCallback():void{
            this._isUser = false;
            var _local1:Object = _ctrl.rune.batchRuneData;
            this._rune.batchRuneData = _local1;
            this.isBtnUser(_local1, false, false);
            this._userbatchRuneIngot = _local1.ingot;
            this.batchRune(_local1);
        }
        public function batchRuneUseCallback():void{
            var _local1:Object = _ctrl.rune.batchRuneUse;
            if (_local1.msg == Mod_Rune_Base.SUCCEED){
                this._rune.batchRuneData = _local1;
                this._rune.upGrade = _local1.newCoins;
                _view.chat.addSystemMessage(Lang.sprintf(RuneViewLang.UserIngot, _local1.newCoins));
                this.isBtnUser(_local1, true, false);
                this.rune_list();
                this._userbatchRuneIngot = _local1.ingot;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        public function autoRuneInfoCallback():void{
            var _local1:Object = _ctrl.rune.autoRuneInfo;
            this._rune.autoRuneInfo = _local1;
            this._oldAutoData = _local1;
        }
        public function setAutoRuneCallback():void{
            var _local1:Object = _ctrl.rune.setAutoRune;
        }
        public function isBtnUser(_arg1:Object, _arg2:Boolean=true, _arg3:Boolean=true):void{
            _view.gameHelper.updateGameAssistant();
            _view.toolbar.runeVisible = (_arg1.count > 0);
            if (_arg1.count > 0){
                _view.activities.openActivity(FunctionType.Rune);
                _view.activities.activityRuneNum = _arg1.count;
                if (inStage){
                    if (((_arg2) && ((_ctrl.player.ingot >= _arg1.ingot)))){
                        this._rune.sureBtnShow = true;
                    };
                    if (_arg3){
                        this._rune.runeInfo = Lang.sprintf(RuneViewLang.GetCoins, _arg1.ingot, _arg1.coins);
                    };
                };
            } else {
                _view.activities.removeActivity(FunctionType.Rune);
                if (inStage){
                    this.close();
                };
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_Rune_Base.FAILED:
                    this.alertInfo(RuneViewLang.Fail);
                    break;
                case Mod_Rune_Base.NOENOUGHINGOT:
                    _view.showTip(RuneViewLang.InsufficientIngot);
                    break;
            };
        }
        public function alertInfo(_arg1:String):void{
            var _local2:uint;
            this._alert.yesLabel = RuneViewLang.Sure;
            _local2 = AlertButtonType.Yes;
            this._alert.show(_arg1, _local2);
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        public function show():void{
            loadAssets("Rune", this.render, RuneViewLang.LoadAssets);
        }
        public function render():void{
            this._rune = (_view.getAssetsObject("Rune", "Rune") as IRune);
            _popup.addView(this, this._rune.content);
            _view.center(sign, this._rune.content);
            this.alert = _view.alert.iAlert;
            this._rune.tip = _view.tip.iTip;
            this._rune.drag = _view.drag.iDrag;
            this.rune_list();
            var isVip6:* = VIPType.check(VIPType.Level6);
            this._rune.isVip6 = isVip6;
            var isVip7:* = VIPType.check(VIPType.Level7);
            this._rune.isVip10 = isVip7;
            if (isVip7){
                this.auto_rune_info();
            };
            this._rune.onRuneSure = function ():void{
                if (_ctrl.player.ingot >= _userIngot){
                    rune_use();
                    _rune.sureBtnShow = false;
                } else {
                    _view.showTip(RuneViewLang.InsufficientIngot);
                };
            };
            this._rune.onSetAutoRune = function (_arg1:int, _arg2:Object):void{
                set_auto_rune(_arg1, _arg2.key);
            };
            this._rune.onBatchRune = function (_arg1:Object):void{
                if (_isUser == false){
                    batch_rune_list();
                };
            };
            this._rune.onClose = function ():void{
                close();
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function batchRune(_arg1:Object):void{
            var callback:* = null;
            var data:* = _arg1;
            if ((((this._userbatchRuneIngot == 0)) || ((this._userbatchRuneIngot > _ctrl.player.ingot)))){
                _view.showTip(RuneViewLang.InsufficientIngot);
            } else {
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.BatchRune)){
                    this.dialog.yesLabel = RuneViewLang.Sure;
                    this.dialog.cancelLabel = RuneViewLang.Cancel;
                    this.dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            batch_rune_use();
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.BatchRune, true);
                        };
                    };
                    this.dialog.show(data.info, (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    this.batch_rune_use();
                };
            };
        }
        public function onBatchRune(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.batch_rune_use();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function clear():void{
            this._rune.close();
        }
        public function close():void{
            this._isUser = false;
            this.clear();
            _popup.closeView(this);
        }

    }
}//package com.views 
