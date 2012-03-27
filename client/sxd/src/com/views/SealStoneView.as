//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class SealStoneView extends Base implements IView {

        private var _sealStone:ISealStone;
        private var _dialog:IAlert;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            if (this._sealStone != null){
                this._sealStone.clear();
            };
            if (this._dialog != null){
                this._dialog.hide();
            };
        }
        public function notifyGet():void{
            if (FunctionType.isOpened(FunctionType.SealSoul)){
                this.notify_get();
            };
        }
        public function getDayStone():void{
            if (VIPType.check(VIPType.Level3)){
                this.show();
            } else {
                this.getDaySealStone(0);
            };
        }
        private function loadData():void{
            this.day_stone_count(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("SealStone", this.render, SealStoneViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._sealStone.content);
            _view.center(sign, this._sealStone.content);
        }
        private function render():void{
            if (this._sealStone == null){
                this._sealStone = (_view.getAssetsObject("SealStone", "SealStone") as ISealStone);
            };
            this.init();
            this.dayStoneCountCallBack();
            this.showUI();
        }
        private function init():void{
            if (this._dialog == null){
                this._dialog = this._view.alert.iAlert;
            };
            this._sealStone.tip = this._view.tip.iTip;
            this._sealStone.drag = this._view.drag.iDrag;
            this._sealStone.onClose = this.close;
            this._sealStone.onGetDayStone = this.getDaySealStone;
            this._sealStone.init();
        }
        private function getDaySealStone(_arg1:int):void{
            var callBack:* = null;
            var intType:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    get_day_stone(intType);
                };
                if (_dialog.checked){
                    if (intType == 1){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.GetSealStoneTwo, true);
                    };
                    if (intType == 2){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.GetSealStoneThree, true);
                    };
                };
            };
            if ((((intType == 1)) && (!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.GetSealStoneTwo))))){
                this._dialog.yesLabel = SealStoneViewLang.DialogYes;
                this._dialog.cancelLabel = SealStoneViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(SealStoneViewLang.GetStongByIngot, HtmlText.yellow(("100" + SealStoneViewLang.Ingot)), SealStoneViewLang.Two, (this._ctrl.sealSoul.dayStoneCount["count"] * 2)), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                if ((((intType == 2)) && (!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.GetSealStoneThree))))){
                    this._dialog.yesLabel = SealStoneViewLang.DialogYes;
                    this._dialog.cancelLabel = SealStoneViewLang.DialogNo;
                    this._dialog.hasCheckbox = true;
                    this._dialog.show(Lang.sprintf(SealStoneViewLang.GetStongByIngot, HtmlText.yellow(("200" + SealStoneViewLang.Ingot)), SealStoneViewLang.Three, (this._ctrl.sealSoul.dayStoneCount["count"] * 3)), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
                } else {
                    this.get_day_stone(intType);
                };
            };
        }
        private function get_day_stone(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.get_day_stone, this.getDayStoneCallBack, [_arg1]);
        }
        private function getDayStoneCallBack():void{
            var _local1:Object = this._ctrl.sealSoul.getDayStone;
            if (_local1["state"] == 1){
                this._view.showTip(Lang.sprintf(SealStoneViewLang.GetSuccess, _local1["stone_coun"]), null, TipType.Success);
                this._view.activities.removeActivity(FunctionType.SealSoul);
                if (this.inStage){
                    this.close();
                };
            } else {
                this._view.showTip(this.message(_local1["state"]));
            };
            this._view.gameHelper.updateGameAssistant();
        }
        private function notify_get():void{
            _data.call(Mod_SealSoul_Base.notify_get, this.notifyGetCallBack, []);
        }
        public function notifyGetCallBack():void{
            var obj:* = this._ctrl.sealSoul.notifyGet;
            if (obj["state"] == 1){
                this._view.activities.addActivity(FunctionType.SealSoul);
                if (!VIPType.check(VIPType.Level3)){
                    var callBack:* = function ():void{
                        var _local1:Object = _ctrl.sealSoul.dayStoneCount;
                        var _local2:String = HtmlText.format(Lang.sprintf(SealStoneViewLang.CanGetStone, _local1["count"]), HtmlText.White, 14, "", true);
                        _view.activities.activityTip(FunctionType.SealSoul, _local2);
                    };
                    this.day_stone_count(callBack);
                };
            } else {
                this._view.activities.removeActivity(FunctionType.SealSoul);
            };
        }
        private function day_stone_count(_arg1:Function):void{
            _data.call(Mod_SealSoul_Base.day_stone_count, _arg1, []);
        }
        private function dayStoneCountCallBack():void{
            var _local1:Object = this._ctrl.sealSoul.dayStoneCount;
            this._sealStone.render(_local1);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case 0:
                    _local2 = SealStoneViewLang.Fail;
                    break;
                case 1:
                    _local2 = SealStoneViewLang.Success;
                    break;
                case 2:
                    _local2 = SealStoneViewLang.NoIngot;
                    break;
                case 3:
                    _local2 = SealStoneViewLang.NoVip;
                    break;
                default:
                    _local2 = (SealStoneViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
