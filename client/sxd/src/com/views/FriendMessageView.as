//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FriendMessageView extends Base implements IView {

        private var _messageList:Array;
        private var _message:IFriendMessage;
        public var isShowMostBox:Boolean = false;

        public function patchReceiveMessage():void{
            _data.patch(Mod_Friend_Base.receive_message_from_friend, this.receiveMessageCallBack);
        }
        public function cancelPatchReceiveMessage():void{
            _data.cancelPatch(Mod_Friend_Base.receive_message_from_friend);
        }
        public function message_box_list():void{
            if (this._messageList == null){
                _data.call(Mod_Friend_Base.message_box_list, this.messageBoxCallBack, []);
            } else {
                this.isShowFriend();
            };
        }
        private function receiveMessageCallBack():void{
            var _local1:Object = _ctrl.friend.receiveMessageFromFriend;
            this.addSingularMissage(_local1);
        }
        private function messageBoxCallBack():void{
            var _local1:Array = _ctrl.friend.messageBoxList;
            this._messageList = _local1;
            this.isShowFriend();
        }
        private function isShowFriend():void{
            var _local1:int = this._messageList.length;
            if (_local1 > 0){
                if (this._message == null){
                    return;
                };
                this._message.geMessageList = this._messageList;
                _view.toolbar.friendMsg(0);
            } else {
                _view.friendList.switchSelf();
            };
        }
        private function messageBoxForColoseCallBack():void{
            if (this._messageList == null){
                return;
            };
            var _local1:int = this._messageList.length;
            _view.toolbar.friendMsg(_local1);
        }
        public function show():void{
            loadAssets("FriendMessage", this.render, FriendMessageViewLang.LoadInfo, true, true);
        }
        private function render():void{
            this._message = (_view.getAssetsObject("FriendMessage", "FriendMessage") as IFriendMessage);
            _popup.addView(this, this._message.content);
            this._message.onOpenFriend = function (_arg1:int):void{
                _view.friendChat.onAutoShowChat = _arg1;
            };
            this._message.onOpenFriendList = function ():void{
                _view.friendList.show();
            };
            this._message.onShowMost = function (_arg1:Boolean):void{
                if (_arg1 == isShowMostBox){
                    return;
                };
                isShowMostBox = _arg1;
                _view.toolbar.friendMsg(0);
            };
            this._message.onClearAll = function (_arg1:Array):void{
                clearMessageAll(_arg1);
            };
            this.patchReceiveMessage();
            this.reposition();
        }
        public function clear():void{
            if (this._message == null){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Friend) == false){
                return;
            };
            this.isShowMostBox = false;
            this.messageBoxForColoseCallBack();
            this._message.clearMostMessage();
        }
        public function close():void{
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._message.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function clearMessageAll(_arg1:Array):void{
            var _local4:int;
            if (this._message == null){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Friend) == false){
                return;
            };
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _arg1[_local3]["messageId"];
                _view.friendList.check_receive_message(_local4);
                _local3++;
            };
            this._messageList = [];
        }
        public function clearList():void{
            this._messageList = [];
        }
        public function addSingularMissage(_arg1:Object):void{
            if (this._message == null){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Friend) == false){
                return;
            };
            if (_view.friendChat.checkPlayerId(_arg1.playerId)){
                return;
            };
            this._message.addSingularMissage = _arg1;
            if (this._messageList != null){
                this._messageList.push(_arg1);
            };
        }
        public function set clearAble(_arg1:int):void{
            if (this._message == null){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Friend) == false){
                return;
            };
            this._message.clearAble = _arg1;
            this.clearMessageList = _arg1;
        }
        public function set clearMessageList(_arg1:int):void{
            var _local4:Object;
            if ((((this._messageList == null)) || ((this._messageList.length <= 0)))){
                return;
            };
            var _local2:int = this._messageList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._messageList[_local3];
                if (_local4.playerId == _arg1){
                    this._messageList.splice(_local3, 1);
                    return;
                };
                _local3++;
            };
        }
        public function set additionalHeight(_arg1:int):void{
            if (this._message == null){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Friend) == false){
                return;
            };
            this._message.additionalHeight = _arg1;
        }
        public function updateDepth(_arg1:IView):void{
            if (((inStage) && (((((((((!(((_arg1 as WarView) == null))) || (!(((_arg1 as SuperSportView) == null))))) || (!(((_arg1 as SuperSportWarView) == null))))) || (!(((_arg1 as StrategyWarView) == null))))) || (!(((_arg1 as TakeBibleRoadView) == null))))))){
                _popup.addView(this, this._message.content);
            };
        }

    }
}//package com.views 
