//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.haloer.display.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class SendFlowerView extends Base implements IView {

        private var _sendFlower:ISendFlower;
        private var _dialog:IAlert = null;
        public var sendPlayerID:int;
        private var _imgFlowerCartoon:Image;
        private var _intFlowerCartoonTime:int = 0;
        private var _timer:Timer;
        private var _blnInLoadFlowerCartoon:Boolean = false;

        public function show():void{
            if (!FunctionType.isOpened(FunctionType.SendFlower)){
                return;
            };
            if (this.inStage){
                this.update();
            } else {
                this.loadData();
            };
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._dialog.hide();
            this._sendFlower.clear();
            this._view.removeFromTimerProcessList(sign);
            this.clearFlowerCartoon();
        }
        public function showFlowerCartoon():void{
            if (this._imgFlowerCartoon != null){
                return;
            };
            this._blnInLoadFlowerCartoon = true;
            this._imgFlowerCartoon = new Image((URI.assetsUrl + "flower_cartoon.swf"));
            this._imgFlowerCartoon.onComplete = function ():void{
                _imgFlowerCartoon.x = ((_view.stage.stageWidth - 136) / 2);
                _imgFlowerCartoon.y = ((_view.stage.stageHeight - 128) / 2);
                _view.stage.addChild(_imgFlowerCartoon);
                _timer = new Timer(100);
                _timer.addEventListener(TimerEvent.TIMER, onTimer);
                _timer.start();
                _blnInLoadFlowerCartoon = false;
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                if (this._imgFlowerCartoon != null){
                    this._imgFlowerCartoon.x = ((_view.stage.stageWidth - 136) / 2);
                    this._imgFlowerCartoon.y = ((_view.stage.stageHeight - 128) / 2);
                };
            };
        }
        public function clearFlowerCartoon():void{
            if (this._blnInLoadFlowerCartoon){
                setTimeout(this.clearFlowerCartoon, 500);
                return;
            };
            if (this._imgFlowerCartoon != null){
                this._timer.stop();
                this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
                if (this._view.stage.contains(this._imgFlowerCartoon)){
                    this._view.stage.removeChild(this._imgFlowerCartoon);
                };
                this._intFlowerCartoonTime = 0;
                this._imgFlowerCartoon = null;
                this._timer = null;
            };
        }
        public function update():void{
            if (this.inStage){
                this.player_send_flower_info();
            };
        }
        private function showUI():void{
            _popup.addView(this, this._sendFlower.content);
            _view.center(sign, this._sendFlower.content);
        }
        private function render():void{
            if (this._sendFlower == null){
                this._sendFlower = (_view.getAssetsObject("SendFlower", "SendFlower") as ISendFlower);
            };
            this.init();
            this._sendFlower.init();
            this.playerSendFlowerInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._sendFlower.tip = this._view.tip.iTip;
            this._sendFlower.drag = this._view.drag.iDrag;
            this._dialog = _view.alert.iAlert;
            this._sendFlower.onClose = this.close;
            this._sendFlower.onTextLink = _view.toolbar.onTextLink;
            this._sendFlower.onQueryFlower = this.send_flower_ranking;
            this._sendFlower.onSendFlower = this.sendPlayerFlower;
            this._sendFlower.onIsValentineDay = this.isValentineDay;
        }
        private function sendPlayerFlower(_arg1:uint, _arg2:String):void{
            var callBack:* = null;
            var uintFlowerType:* = _arg1;
            var strNickName:* = _arg2;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    send_player_flower(uintFlowerType);
                };
            };
            this._dialog.yesLabel = SendFlowerViewLang.DialogYes;
            this._dialog.noLabel = SendFlowerViewLang.DialogNo;
            var strHtml:* = Lang.sprintf(SendFlowerViewLang.SendFlower, this.getFlowerIngotString(uintFlowerType), strNickName, HtmlText.yellow(this.getFlowerNumber(uintFlowerType)));
            this._dialog.show(strHtml, (AlertButtonType.Yes | AlertButtonType.No), callBack);
        }
        private function getFlowerNumber(_arg1:uint):String{
            var _local2:Object = {
                1:1,
                2:9,
                3:99
            };
            return (_local2[_arg1]);
        }
        private function getFlowerFame(_arg1:uint):String{
            var _local2:Object = {};
            if (this.isValentineDay()){
                _local2 = {
                    1:20,
                    2:60,
                    3:1314
                };
            } else {
                _local2 = {
                    1:10,
                    2:20,
                    3:520
                };
            };
            return (_local2[_arg1]);
        }
        private function getFlowerIngotString(_arg1:uint):String{
            var _local2:Object = {
                1:(HtmlText.yellow("1000") + SendFlowerViewLang.Coin),
                2:(HtmlText.yellow("9") + SendFlowerViewLang.Ingot),
                3:(HtmlText.yellow("99") + SendFlowerViewLang.Ingot)
            };
            return (_local2[_arg1]);
        }
        private function onTimer(_arg1:TimerEvent):void{
            if (this._intFlowerCartoonTime >= 40){
                this._imgFlowerCartoon.alpha = (this._imgFlowerCartoon.alpha - 0.1);
                if (this._imgFlowerCartoon.alpha <= 0){
                    this.clearFlowerCartoon();
                };
            } else {
                this._intFlowerCartoonTime++;
            };
        }
        private function isValentineDay():Boolean{
            var _local1:Date = new Date((this._ctrl.player.serverTime * 1000));
            var _local2:Boolean = (((_local1.month == 1)) && ((((_local1.date >= 13)) && ((_local1.date <= 15)))));
            return (_local2);
        }
        private function loadData():void{
            _data.call(Mod_SendFlower_Base.player_send_flower_info, this.loadDataCallBack, [this.sendPlayerID]);
        }
        private function loadDataCallBack():void{
            var _local1:Object = this._ctrl.sendFlower.sendFlowerInfo();
            if (_local1["result"] != Mod_SendFlower_Base.SUCCESS){
                this._view.showTip(this.message(_local1["result"]));
                return;
            };
            if (_local1["is_can_send"] == Mod_SendFlower_Base.NO){
                this._view.showTip(SendFlowerViewLang.OnlyOne);
                return;
            };
            loadAssets("SendFlower", this.render, SendFlowerViewLang.LoadInfo);
        }
        private function player_send_flower_info():void{
            _data.call(Mod_SendFlower_Base.player_send_flower_info, this.playerSendFlowerInfoCallBack, [this.sendPlayerID]);
        }
        private function playerSendFlowerInfoCallBack():void{
            var _local1:Object = this._ctrl.sendFlower.sendFlowerInfo();
            if (_local1["result"] != Mod_SendFlower_Base.SUCCESS){
                this._view.showTip(this.message(_local1["result"]));
                return;
            };
            if (_local1["is_can_send"] == Mod_SendFlower_Base.NO){
                this._view.showTip(SendFlowerViewLang.OnlyOne);
                return;
            };
            var _local2:Array = this._ctrl.sendFlower.sendFlowerRecord();
            this._sendFlower.renderSendFlowerInfo(_local1, _local2);
        }
        private function send_player_flower(_arg1:uint):void{
            var callBack:* = null;
            var uintFlowerType:* = _arg1;
            callBack = function ():void{
                sendPlayerFlowerCallBack(uintFlowerType);
            };
            _data.call(Mod_SendFlower_Base.send_player_flower, callBack, [this.sendPlayerID, uintFlowerType]);
        }
        private function sendPlayerFlowerCallBack(_arg1:uint):void{
            var callBack:* = null;
            var uintFlowerType:* = _arg1;
            callBack = function (_arg1:uint):void{
                close();
            };
            var obj:* = this._ctrl.sendFlower.sendPlayerFlower();
            if (obj["result"] == Mod_SendFlower_Base.SUCCESS){
                this._view.activities.showWinEffect();
                this._dialog.yesLabel = SendFlowerViewLang.DialogYes;
                this._dialog.show(Lang.sprintf(SendFlowerViewLang.GetFame, this.getFlowerNumber(uintFlowerType), HtmlText.yellow(this.getFlowerFame(uintFlowerType))), AlertButtonType.Yes, callBack);
            } else {
                this._view.showTip(this.message(obj["result"]));
            };
        }
        private function send_flower_ranking():void{
            _data.call(Mod_SendFlower_Base.send_flower_ranking, this.sendFlowerRankingCallBack, []);
        }
        private function sendFlowerRankingCallBack():void{
            var _local1:Array = this._ctrl.sendFlower.sendFlowerRanking();
            this._sendFlower.renderSendFlowerRanking(_local1);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_SendFlower_Base.SUCCESS:
                    _local2 = SendFlowerViewLang.Success;
                    break;
                case Mod_SendFlower_Base.FUN_OPENED:
                    _local2 = SendFlowerViewLang.FunOpened;
                    break;
                case Mod_SendFlower_Base.NOT_ENOUGH_INGOT:
                    _local2 = SendFlowerViewLang.NotEnoughIngot;
                    break;
                case Mod_SendFlower_Base.NOT_ENOUGH_COIN:
                    _local2 = SendFlowerViewLang.NotEnoughCoin;
                    break;
                case Mod_SendFlower_Base.SAME_SEX:
                    _local2 = SendFlowerViewLang.SameSex;
                    break;
                case Mod_SendFlower_Base.SEND_SELF:
                    _local2 = SendFlowerViewLang.SendSelf;
                    break;
                default:
                    _local2 = (SendFlowerViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
