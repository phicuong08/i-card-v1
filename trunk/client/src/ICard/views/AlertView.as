//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.assist.view.interfaces.*;
    import ICard.assist.*;
    import ICard.assist.view.controls.*;
    import ICard.lang.client.com.views.*;

    public class AlertView extends Base implements IView {

        private var _alert:IAlert;

        public function show():void{
            var _local1:uint;
            this.iAlert.yesLabel = "是";
            this.iAlert.noLabel = "否";
            this.iAlert.cancelLabel = "取消";
            this.iAlert.yesLabelTip = "四十四";
            this.iAlert.yesEnabled = false;
            this.iAlert.hasCheckbox = true;
            _local1 = ((AlertButtonType.Yes | AlertButtonType.No) | AlertButtonType.Cancel);
            this.iAlert.show("测试", _local1, this.onCloseHandler);
        }
        private function onCloseHandler(_arg1:uint):void{
            Helper.output("onCloseHandler", this.iAlert.checked);
            switch (_arg1){
                case AlertButtonType.Yes:
                    break;
                case AlertButtonType.No:
                    break;
                case AlertButtonType.Cancel:
                    break;
            };
            this.iAlert.show("测试1", _arg1, null);
        }
        public function clear():void{
        }
        public function close():void{
            if (this._alert){
                this._alert.hide();
            };
        }
        public function hide():void{
            if (this.iAlert){
                this.iAlert.hide();
            };
        }
        public function reposition():void{
            if (this._alert){
                this._alert.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight);
            };
        }
        public function confirm(_arg1:String, _arg2:Function=null):void{
            this.iAlert.yesLabel = AlertViewLang.Confirm;
            this.iAlert.show(_arg1, AlertButtonType.Yes, _arg2);
        }
        public function showYesNoMsg(_arg1:String, _arg2:String="确定", _arg3:String="取消", _arg4:Function=null):void{
            this.iAlert.yesLabel = _arg2;
            this.iAlert.noLabel = _arg3;
            this.iAlert.show(_arg1, (AlertButtonType.Yes | AlertButtonType.No), _arg4);
        }
        public function socketClosed(_arg1:String="", _arg2:String=""):void{
            var reason:String = _arg1;
            var reason2:String = _arg2;
            try {
                this.iAlert.yesLabel = AlertViewLang.Confirm;
                this.iAlert.show(((reason) || (AlertViewLang.Closed)), AlertButtonType.Yes);
            } catch(e) {
                Helper.alert(((reason2) || (AlertViewLang.Fault)));
            };
        }
        public function get iAlert():IAlert{
            if (!this._alert){
                this._alert = (_view.getAssetsObject("Alert", "oAlert") as IAlert);
                this._alert.oParent = _structure.alert;
                this._alert.tip = _view.tip.iTip;
                this.reposition();
            };
            return (this._alert);
        }
        override public function get inStage():Boolean{
            return (((this._alert) && (this._alert.content.parent)));
        }

    }
}//package com.views 
