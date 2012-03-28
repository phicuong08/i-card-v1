//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FriendChatView extends Base implements IView {

        private var _groupId:int = 0;
        private var _gmListData:Object;
        public var _chat:IFriendChat;
        private var _showNum:int = 0;
        private var _chatPlayerList:Array;

        public function FriendChatView(){
            this._gmListData = {};
            this._chatPlayerList = [];
            super();
        }
        public function get_friendinfo_chatrecord_list(_arg1:int):void{
            if (this.checkChatLen(_arg1) == false){
                return;
            };
            if (_arg1 == this._ctrl.player.playerId){
                return;
            };
            this.getPlayerId = _arg1;
            _view.friendMessage.clearAble = _arg1;
            if (_view.toolbar.showChatId == _arg1){
                _view.toolbar.showChatId = 0;
            };
            _view.tip2.showTip(FriendChatViewLang.Wait, FriendChatViewLang.GetDate, TipType.Process);
            _data.call(Mod_Friend_Base.get_friendinfo_chatrecord_list, this.friendinfoChatrecordCallBack, [_arg1]);
        }
        private function send_message_to_friend(_arg1:int, _arg2:String, _arg3:String, _arg4:String):void{
            _data.call(Mod_Friend_Base.send_message_to_friend, this.sendMessageCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        private function receive_message_from_friend():void{
            _data.patch(Mod_Friend_Base.receive_message_from_friend, this.receiveMessageCallBack);
        }
        public function get_group(_arg1:String, _arg2:int):void{
            if (this.inStage == false){
                return;
            };
            this._groupId = _arg2;
            _data.call(Mod_Friend_Base.get_group, this.getGroupCallBack, [_arg2, _arg1]);
        }
        private function notify_enter_state(_arg1:int, _arg2:int):void{
            _data.call(Mod_Friend_Base.notify_enter_state, new Function(), [_arg1, _arg2]);
        }
        private function receive_friend_enter_state():void{
            _data.patch(Mod_Friend_Base.receive_friend_enter_state, this.receiveFriendEnterCallBack);
        }
        private function friendinfoChatrecordCallBack():void{
            _view.tip2.hideTip();
            if (this.inStage == false){
                this.show();
                return;
            };
            var _local1:Object = _ctrl.friend.getFriendinfoChatrecordList;
            this._chat.getPlayerInfo = _local1;
            this._chat.getChatList(_local1.chatRecordList, _local1.playerId);
            if (_local1.isGm == false){
                this.get_group(_local1.name, _local1.playerId);
            };
        }
        private function sendMessageCallBack():void{
            var _local1:Object = _ctrl.friend.sendMessageToFriend;
            if (_local1.msg == Mod_Friend_Base.SEND_SUCCESS){
                this._chat.getChatData(_local1, _local1.playerId);
            } else {
                this.renderMsg(_local1);
            };
        }
        private function receiveMessageCallBack():void{
            var _local1:Object = _ctrl.friend.receiveMessageFromFriend;
            this._chat.getChatData(_local1, _local1.playerId);
            if (this.checkPlayerId(_local1.playerId) == false){
                _view.friendMessage.addSingularMissage(_local1);
            };
        }
        private function getGroupCallBack():void{
            var _local1:Object = _ctrl.friend.getGroup;
            if (_local1.msg == Mod_Friend_Base.FRIEND_NOT_FOUND){
                this.renderMsg(_local1);
            } else {
                this._chat.btnState(_local1.msg, this._groupId);
            };
        }
        private function receiveFriendEnterCallBack():void{
            var _local1:Object = _ctrl.friend.receiveFriendEnterState;
            this._chat.getFriendEnterState(_local1.friendId, _local1.state);
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_Friend_Base.FRIEND_NOT_FOUND:
                    _view.showTip(FriendChatViewLang.FriendNotFound);
                    break;
                case Mod_Friend_Base.FUNCTION_NO_OPEN:
                    _view.showTip(FriendChatViewLang.FunctionNoOpen);
                    break;
                case Mod_Friend_Base.IN_BLCAKLIST:
                    _view.showTip(FriendChatViewLang.InBlcakList);
                    break;
                case Mod_Friend_Base.SEND_ERROR:
                    _view.showTip(FriendChatViewLang.SendError);
                    break;
            };
        }
        public function show():void{
            loadAssets("FriendChatBox", this.render, FriendChatViewLang.LoadAssets);
        }
        public function set gmListData(_arg1:Object):void{
        }
        private function render():void{
            this._chat = (_view.getAssetsObject("FriendChatBox", "FriendChatBox") as IFriendChat);
            _popup.addView(this, this._chat.content);
            _view.center(sign, this._chat.content);
            this._chat.tip = _view.tip.iTip;
            this._chat.drag = _view.drag.iDrag;
            this._chat.onSendChat = function (_arg1:Object):void{
                send_message_to_friend(_arg1.id, _arg1.msg, _arg1.eipNum, _arg1.eipIndex);
            };
            this._chat.onClose = function ():void{
                close();
            };
            this._chat.onAddFriend = function (_arg1:Object):void{
                _view.friendList.addFriend(_arg1.name, _arg1.playerId);
            };
            this._chat.onBlackList = function (_arg1:Object):void{
                _view.friendList.addBlackList = _arg1;
            };
            this._chat.onDeleteFriend = function (_arg1:Object):void{
                _view.friendList.deleteFrined = _arg1;
            };
            this._chat.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.playerId;
                _view.sendFlower.show();
            };
            this._chat.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case "CHATFULL":
                        _view.showTip(FriendChatViewLang.ChatFull);
                        break;
                };
            };
            this._chat.onButtleFriend = function (_arg1:Object):void{
                _view.pkWar.defenderPlayerId = _arg1.playerId;
                _view.pkWar.show();
            };
            this._chat.onClearFriend = function (_arg1:int):void{
                clearPlayerId = _arg1;
            };
            this._chat.onShowPerson = function (_arg1:Object):void{
                _view.otherRoleMsg.init(_arg1.playerId, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._chat.onEnterState = function (_arg1:int, _arg2:int):void{
                notify_enter_state(_arg1, _arg2);
            };
            this._chat.isShowSendFlower = FunctionType.isOpened(FunctionType.SendFlower);
            this._chat.init();
            this.friendinfoChatrecordCallBack();
            this.receive_message_from_friend();
            this.receive_friend_enter_state();
        }
        public function set onAutoShowChat(_arg1:int):void{
            if (this.checkChatLen(_arg1) == false){
                return;
            };
            this.getPlayerId = _arg1;
            this.get_friendinfo_chatrecord_list(_arg1);
        }
        public function set onlineState(_arg1:Object):void{
            if (this.inStage == false){
                return;
            };
            this._chat.onlineState = _arg1;
        }
        public function set getPlayerId(_arg1:int):void{
            if (this.checkPlayerId(_arg1) == false){
                this._chatPlayerList.push(_arg1);
            };
            this.cleckChat = _arg1;
        }
        public function set clearPlayerId(_arg1:int):void{
            var _local4:int;
            var _local2:int = this._chatPlayerList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._chatPlayerList[_local3];
                if (_local4 == _arg1){
                    this._chatPlayerList.splice(_local3, 1);
                    return;
                };
                _local3++;
            };
        }
        private function set cleckChat(_arg1:int):void{
            _ctrl.friend.clearPlayerId = _arg1;
            _view.friendList.check_receive_message(_arg1);
            var _local2:Array = _ctrl.friend.getUnreceiveFriendList;
            var _local3:int = _local2.length;
            _view.toolbar.friendMsg(_local3);
        }
        public function checkPlayerId(_arg1:int):Boolean{
            var _local4:int;
            var _local2:int = this._chatPlayerList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._chatPlayerList[_local3];
                if (_local4 == _arg1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }
        public function checkChatLen(_arg1:int):Boolean{
            var _local4:int;
            var _local2:int = this._chatPlayerList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._chatPlayerList[_local3];
                if (_local4 == _arg1){
                    return (true);
                };
                _local3++;
            };
            if (_local2 >= 10){
                _view.showTip(FriendChatViewLang.ChatAll);
            };
            return ((_local2 < 10));
        }
        public function close():void{
            this._chatPlayerList = [];
            _popup.closeView(this);
            this.clear();
        }
        public function clear():void{
            this._chat.clear();
            _data.cancelPatch(Mod_Friend_Base.receive_message_from_friend);
            _data.cancelPatch(Mod_Friend_Base.receive_friend_enter_state);
            _view.friendMessage.patchReceiveMessage();
        }

    }
}//package com.views 
