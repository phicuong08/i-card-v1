//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class DelayMessageView extends Base {

        private var _delayMessage:IDelayMessage;

        public function checkVisible(_arg1:Boolean=false):void{
            this._delayMessage.content.visible = _view.townMap.inStage;
            if (_arg1){
                _popup.addChild(this._delayMessage.content);
            };
        }
        public function init():void{
            this._delayMessage = (_view.getAssetsObject("DelayMessage", "DelayMessage") as IDelayMessage);
            this._delayMessage.dialog = this._view.alert.iAlert;
            this._delayMessage.tip = this._view.tip.iTip;
            this._delayMessage.specialDelayMessage = this.specialDelayMessage;
            this._delayMessage.whenDelayMessageDialogShow = this.whenDelayMessageDialogShow;
            this._delayMessage.removeNickNameSuffix = this._ctrl.player.removeNickNameSuffix;
            this._delayMessage.init();
            this._delayMessage.addOverrideMessage(DelayNotifyType.SuperSport);
            this._delayMessage.addOverrideMessage(DelayNotifyType.Farm);
            this._delayMessage.addOverrideMessage(DelayNotifyType.JoinFactionWar);
            this._delayMessage.addOverrideMessage(DelayNotifyType.InvitJoinEat);
            _popup.addChild(this._delayMessage.content);
            this.receive_player_delay_notify_message();
        }
        public function addDelayMessage(_arg1:int, _arg2:String, _arg3:uint=1, _arg4:Function=null):void{
            var _local5:Object = {
                id:_arg1,
                message:_arg2,
                flags:_arg3,
                clickCallBack:_arg4
            };
            _local5["message"] = this.replaceString(_local5["message"]);
            this._delayMessage.addMessage(_local5);
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._delayMessage.reposition(Structure.stageWidth, Structure.stageHeight);
            };
        }
        private function whenDelayMessageDialogShow(_arg1:int):void{
            switch (_arg1){
                case DelayNotifyType.TakeBibleSuccess:
                case DelayNotifyType.ReceiveSendFlower:
                    _view.activities.showWinEffect();
                    break;
                case DelayNotifyType.ReceiveTopFlower:
                    _view.sendFlower.showFlowerCartoon();
                    _view.toolbar.playFlowerRain();
                    break;
            };
        }
        private function specialDelayMessage(_arg1:SimpleButton):void{
            var delayMessage:* = _arg1;
            switch (delayMessage["id"]){
                case DelayNotifyType.Farm:
                    delayMessage["clickCallBack"] = this.farmClickCallBack;
                    break;
                case DelayNotifyType.InvitJoinEat:
                    delayMessage["flags"] = (AlertButtonType.Yes | AlertButtonType.No);
                    delayMessage["clickCallBack"] = this.factionEatClickCallBack;
                    break;
                case DelayNotifyType.AddFriend:
                    delayMessage["flags"] = (AlertButtonType.Yes | AlertButtonType.No);
                    delayMessage["yesLabel"] = DelayMessageViewLang.AddFriend;
                    delayMessage["noLabel"] = DelayMessageViewLang.Close;
                    delayMessage["clickCallBack"] = function (_arg1:uint):void{
                        addFriendClickCallBack(_arg1, delayMessage["message"]);
                    };
                    break;
                case DelayNotifyType.ReceiveTopFlower:
                    delayMessage["clickCallBack"] = function (_arg1:uint):void{
                        _view.sendFlower.clearFlowerCartoon();
                    };
                    break;
            };
        }
        private function replaceString(_arg1:String):String{
            var _local4:String;
            var _local5:int;
            var _local6:int;
            var _local7:String;
            var _local8:String;
            var _local2:Array = _arg1.split("[");
            var _local3:String = "";
            for each (_local4 in _local2) {
                _local5 = 0;
                _local6 = _local4.indexOf("]");
                if (_local6 != -1){
                    _local7 = _local4.substr(_local5, ((_local6 - _local5) + 1));
                    if (_local7.slice(_local5, _local7.indexOf(",")) != "replace"){
                        continue;
                    };
                    _local8 = _local7.slice((_local7.indexOf(",") + 1), (_local7.length - 1));
                    _local4 = _local4.replace(_local7, this.replace(_local8));
                };
                _local3 = (_local3 + _local4);
            };
            return (_local3);
        }
        private function replace(_arg1:String):String{
            var _local2:String = "";
            switch (_arg1){
                case "1":
                    _local2 = DelayMessageViewLang.Monday;
                    break;
                case "2":
                    _local2 = DelayMessageViewLang.Tuesday;
                    break;
                case "3":
                    _local2 = DelayMessageViewLang.Wednesday;
                    break;
                case "4":
                    _local2 = DelayMessageViewLang.Thursday;
                    break;
                case "5":
                    _local2 = DelayMessageViewLang.Friday;
                    break;
                case "6":
                    _local2 = DelayMessageViewLang.Saturday;
                    break;
                case "7":
                    _local2 = DelayMessageViewLang.Sunday;
                    break;
                default:
                    _local2 = "";
            };
            return (_local2);
        }
        private function farmClickCallBack(_arg1:uint):void{
            if (!_view.farm.inStage){
                _view.farm.switchSelf();
            };
        }
        private function factionEatClickCallBack(_arg1:uint):void{
            if (AlertButtonType.Yes == _arg1){
                _view.factionEat.factionEatClickCallBack();
            };
        }
        private function addFriendClickCallBack(_arg1:uint, _arg2:String):void{
            var _local3:Array = _arg2.split("【");
            var _local4:Array = _local3[1].split("】");
            var _local5:String = _local4[0];
            if (AlertButtonType.Yes == _arg1){
                this._view.friendList.addFriend(_local5);
            };
        }
        private function receive_player_delay_notify_message():void{
            this._data.call(Mod_Player_Base.receive_player_delay_notify_message, this.receivePlayerDelayNotifyMessageCallBack, []);
            this._data.patch(Mod_Player_Base.receive_player_delay_notify_message, this.receivePlayerDelayNotifyMessageCallBack);
        }
        private function receivePlayerDelayNotifyMessageCallBack():void{
            var _local1:SimpleButton;
            var _local3:Object;
            var _local2:Array = this._ctrl.player.delayMessage;
            for each (_local3 in _local2) {
                if ((((((_local3["id"] == DelayNotifyType.Farm)) && (_view.farm.inStage))) || ((((_local3["id"] == DelayNotifyType.SealSatanAward)) && (_view.factionSeal.inStage))))){
                } else {
                    _local3["message"] = this.replaceString(_local3["message"]);
                    this._delayMessage.addMessage(_local3);
                };
            };
        }

    }
}//package com.views 
