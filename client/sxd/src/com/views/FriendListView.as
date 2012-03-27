//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FriendListView extends Base implements IView {

        private var _friend:String = "FRIEND";
        private var _blackList:String = "BLACKLIST";
        private var _lastContact:String = "LAST_CONTACT";
        private var _moveList:String = "MOVELIST";
        private var _deleteList:String = "DELETELIST";
        private var _friendList:IFriendList;
        private var _isShowChat:Boolean = false;
        private var _friendShow:Boolean = false;
        private var _openType:String = "FRIEND";
        private var _friendName:String = "";
        private var _friendId:int = 0;
        private var _moveInfo:String = "";
        private var _moveType:String = "";
        private var _moveData:Object;
        private var _chetPlayerId:int = 0;
        public var showChatId:int = 0;
        private var _chatData:Object;
        private var _alert:IAlert;

        public function show():void{
            if (inStage){
                return;
            };
            var _local1:Array = _ctrl.friend.getUnreceiveFriendList;
            var _local2:int;
            if (((!((_local1 == null))) && ((_local1.length > 0)))){
                _local2 = _local1.length;
            };
            if (_local2 > 0){
                this._openType = this._lastContact;
            } else {
                this._openType = this._friend;
            };
            this.get_Friend_List(this._openType);
        }
        private function add_Friend(_arg1:int, _arg2:String):void{
            this.addLoadMc(FriendListViewLang.Wait, FriendListViewLang.SelectFriend);
            _data.call(Mod_Friend_Base.add_friend, this.addFriendCallback, [_arg1, _arg2]);
        }
        private function get_group(_arg1:int, _arg2:String):void{
            _data.call(Mod_Friend_Base.get_group, this.getGroupCallback, [_arg1, _arg2]);
        }
        private function add_Black(_arg1:String):void{
            _data.call(Mod_Friend_Base.add_to_black, this.addBlackCallback, [_arg1]);
        }
        public function check_receive_message(_arg1:int):void{
            _data.call(Mod_Friend_Base.check_receive_message, new Function(), [_arg1]);
        }
        private function delete_Friend(_arg1:int):void{
            _data.call(Mod_Friend_Base.delete_friend, this.deleteFriendCallback, [_arg1]);
        }
        private function get_Friend_List(_arg1:String):void{
            this._openType = _arg1;
            _data.call(Mod_Friend_Base.get_friend_list, this.getFriendListCallback, [Mod_Friend_Base[_arg1]]);
        }
        private function renderShow():void{
            this.loadResource(this.render);
        }
        private function loadResource(_arg1:Function):void{
            loadAssets("FriendList", this.render, FriendListViewLang.LoadAssets);
        }
        private function render():void{
            this._friendList = (_view.getAssetsObject("FriendList", "FriendList") as IFriendList);
            _popup.addView(this, this._friendList.content);
            _view.center(sign, this._friendList.content);
            this._friendList.drag = _view.drag.iDrag;
            this._friendList.tip = _view.tip.iTip;
            this.alert = _view.alert.iAlert;
            this.renderList();
            this._moveType = this._friend;
        }
        private function addFriendCallback():void{
            var _local1:Object = _ctrl.friend.addFriend();
            this.renderMsg(_local1.msg, this._friend);
            if (((!((this._chatData == null))) && ((this._chatData.id > 0)))){
                _view.friendChat.get_group(this._chatData.name, this._chatData.id);
            };
            if (this.inStage == false){
                this.alert = _view.alert.iAlert;
                return;
            };
            this._friendList.addFriendInfo = _local1.info;
            this.renderFriendList();
        }
        private function addFriendForIdCallBack():void{
            var _local1:Object = _ctrl.friend.addFriendById();
            this.renderMsg(_local1.msg, this._friend);
        }
        private function addBlackCallback():void{
            var _local1:Object = _ctrl.friend.addBlack();
            this.renderMsg(_local1.msg, this._blackList);
            _view.friendChat.get_group(this._chatData.name, this._chatData.id);
        }
        private function getFriendListCallback():void{
            var _local1:Array = _ctrl.friend.getFriendList();
            this.clearFriendMsg(_local1);
            if (this.inStage == false){
                _data.call(Mod_Friend_Base.get_playerinfo, this.renderShow, [], false);
            } else {
                this._friendList.getFriendList = _local1;
            };
        }
        private function clearFriendMsg(_arg1:Array):void{
            var _local4:Object;
            var _local5:Boolean;
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _arg1[_local3];
                _local5 = _view.friendChat.checkPlayerId(_local4.id);
                if (_local5){
                    _local4.msg = 0;
                    _local4.onLine = _local4.tempOnLine;
                };
                _local3++;
            };
        }
        private function getGroupCallback():void{
            var _local1:Object = _ctrl.friend.getGroup;
            switch (_local1.msg){
                case Mod_Friend_Base.FRIEND:
                    if (this._moveType == this._blackList){
                        if (this._openType == this._friend){
                            this.add_Black(this._friendName);
                        } else {
                            this.renderBlackOrFriend(FriendListViewLang.AddBlackListInfo, this.addBlackListInfo);
                        };
                    } else {
                        this.add_Friend(this._friendId, this._friendName);
                    };
                    break;
                case Mod_Friend_Base.BLACKLIST:
                    if (this._moveType == this._friend){
                        if (this._openType == this._blackList){
                            this.add_Friend(this._friendId, this._friendName);
                        } else {
                            this.renderBlackOrFriend(FriendListViewLang.AddFriendListInfo, this.addFriendListInfo);
                        };
                    } else {
                        this.add_Black(this._friendName);
                    };
                    break;
                case Mod_Friend_Base.STRANGER:
                    if (this._moveType == this._friend){
                        this.add_Friend(this._friendId, this._friendName);
                    } else {
                        this.add_Black(this._friendName);
                    };
                    break;
                case Mod_Friend_Base.FRIEND_NOT_FOUND:
                    if (this._moveType == this._friend){
                        this.add_Friend(this._friendId, this._friendName);
                    } else {
                        this.add_Black(this._friendName);
                    };
                    break;
            };
        }
        private function moveFriendCallBack():void{
            var _local1:Object = _ctrl.friend.moveFriend();
            this.renderMsg(_local1.msg, this._moveType);
            _view.friendChat.get_group(this._chatData.name, this._chatData.id);
        }
        private function deleteFriendCallback():void{
            var _local1:Object = _ctrl.friend.deleteFriend();
            this.renderMsg(_local1.msg, this._deleteList);
            _view.friendChat.get_group(this._chatData.name, this._chatData.id);
        }
        private function renderList():void{
            this._friendList.getPlayerData = _ctrl.friend.getPlayerInfo();
            this._friendList.isOpenPk = FunctionType.isOpened(FunctionType.PK);
            this._friendList.isShowInvitation = !(!(URI.weiBoNickName));
            this.getFriendListCallback();
            this._friendList.onOpenFriendType = this._openType;
            this._friendList.isOpenSendFlower = FunctionType.isOpened(FunctionType.SendFlower);
            var str:* = URI.nickNameSuffix();
            var merge:* = (str.length > 0);
            this._friendList.isMerge = merge;
            this._friendList.onFriend = function ():void{
                get_Friend_List(_friend);
            };
            this._friendList.onAudience = function ():void{
                if (_view.audience.inStage == false){
                    _view.audience.show();
                } else {
                    _view.audience.close();
                };
            };
            this._friendList.onRecent = function ():void{
                get_Friend_List(_lastContact);
            };
            this._friendList.onBlackList = function ():void{
                get_Friend_List(_blackList);
            };
            this._friendList.onShowPerson = function (_arg1:Object):void{
                _view.otherRoleMsg.close();
                _view.otherRoleMsg.init(_arg1.id, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._friendList.onAddInfo = function (_arg1:String, _arg2:String):void{
                _moveType = _arg1;
                _friendName = _arg2;
                get_group(0, _arg2);
            };
            this._friendList.onClose = function ():void{
                close();
            };
            this._friendList.onButtleFriend = function (_arg1:Object):void{
                _view.pkWar.defenderPlayerId = _arg1.id;
                _view.pkWar.show();
            };
            this._friendList.onDeleteFriend = function (_arg1:Object):void{
                _chatData = _arg1;
                delete_Friend(_arg1.id);
            };
            this._friendList.onMoveFriend = function (_arg1:Object, _arg2:String, _arg3:String):void{
                get_group(0, _arg1.name);
                _friendName = _arg1.name;
                _chatData = _arg1;
                _moveData = {};
                _moveData = _arg1;
                _moveType = _arg2;
                _moveInfo = _arg3;
            };
            this._friendList.onChatShow = function (_arg1:Object):void{
                var _local2:int = _arg1.id;
                check_receive_message(_local2);
                _chetPlayerId = _local2;
                _view.friendChat.get_friendinfo_chatrecord_list(_local2);
            };
            this._friendList.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.id;
                _view.sendFlower.show();
            };
            this._friendList.onMsgOpen = function (_arg1:Object):void{
                var _local2:int = _arg1.id;
                check_receive_message(_local2);
                _view.friendChat.onAutoShowChat = _arg1.id;
                get_Friend_List(_openType);
            };
            this._friendList.onInvitation = function ():void{
                _view.switchWeiBoFriend(true);
            };
        }
        public function addFriend(_arg1:String="", _arg2:int=0):void{
            this._chatData = {};
            this._chatData.name = _arg1;
            this._chatData.id = _arg2;
            this._moveType = this._friend;
            this._friendName = _arg1;
            this._friendId = _arg2;
            this.get_group(_arg2, this._friendName);
        }
        public function set deleteFrined(_arg1:Object):void{
            this._chatData = _arg1;
            this._chatData.id = _arg1.playerId;
            this.delete_Friend(_arg1.playerId);
        }
        public function set addBlackList(_arg1:Object):void{
            this._chatData = _arg1;
            this._chatData.id = _arg1.playerId;
            this.add_Black(_arg1.name);
        }
        public function closeChat():void{
            this._chetPlayerId = 0;
        }
        public function set onlineState(_arg1:Object):void{
            if (this.inStage){
                this._friendList.isOnLine = _arg1;
            };
        }
        public function set messageCount(_arg1:Object):void{
            var _local2:Boolean;
            if (this.inStage){
                _local2 = _view.friendChat.checkPlayerId(_arg1.id);
                if (_local2 == false){
                    this._friendList.friendMsgNum = _arg1;
                };
            };
        }
        public function set alert(_arg1:IAlert):void{
            this._alert = _arg1;
        }
        public function renderBlackOrFriend(_arg1:String, _arg2:Function):void{
            var _local3:uint;
            this._alert.yesLabel = FriendListViewLang.Sure;
            this._alert.noLabel = FriendListViewLang.Cancel;
            _local3 = (AlertButtonType.Yes | AlertButtonType.No);
            this._alert.show(_arg1, _local3, _arg2);
        }
        public function addFriendListInfo(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.add_Friend(this._friendId, this._friendName);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function addLoadMc(_arg1:String, _arg2:String):void{
            _view.tip2.showTip(_arg1, _arg2, TipType.Process);
        }
        public function addBlackListInfo(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.add_Black(this._friendName);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function renderMsg(_arg1:int, _arg2:String):void{
            var _local3:Boolean;
            var _local4:Boolean;
            switch (_arg1){
                case Mod_Friend_Base.ADD_SUCCESS:
                    _local3 = true;
                    if (_arg2 == this._friend){
                        _view.showTip(FriendListViewLang.AddFriendSuccess, null, TipType.Success);
                    } else {
                        _view.showTip(FriendListViewLang.AddBlackSuccess, null, TipType.Success);
                    };
                    this.renderFriendList();
                    break;
                case Mod_Friend_Base.FRIEND_NOT_FOUND:
                    _view.showTip(FriendListViewLang.FriendNotFound);
                    break;
                case Mod_Friend_Base.ADD_SELF:
                    _view.showTip(FriendListViewLang.AddSelf);
                    break;
                case Mod_Friend_Base.EXIST_IN_FRIENDGROUP:
                    _view.showTip(FriendListViewLang.ExistInFriendGroup);
                    break;
                case Mod_Friend_Base.EXIST_IN_BLACKLISTGROUP:
                    _view.showTip(FriendListViewLang.ExistInBlacklistgroup);
                    break;
                case Mod_Friend_Base.FRIENDGROUP_GT_UPPER_LIMIT:
                    _view.showTip(FriendListViewLang.FriendGroupGtUpperLimit);
                    break;
                case Mod_Friend_Base.DELETE_SUCCESS:
                    _local4 = true;
                    _view.showTip(FriendListViewLang.DeleteSuccess);
                    this.renderFriendList();
                    break;
                case Mod_Friend_Base.DELETE_ERROR:
                    _view.showTip(FriendListViewLang.DeleteError);
                    break;
                case Mod_Friend_Base.FUNCTION_NO_OPEN:
                    _view.showTip(FriendListViewLang.FunctionNoOpen);
                    break;
            };
        }
        private function renderFriendList():void{
            if (!inStage){
                return;
            };
            this.get_Friend_List(this._openType);
        }
        public function alertInfo(_arg1:String, _arg2:String, _arg3:int):void{
            _view.showTip(_arg1, _arg2, _arg3);
        }
        public function close():void{
            _ctrl.friend.showChatId = 0;
            this._isShowChat = false;
            this._openType = this._friend;
            if (this._friendList != null){
                this._friendList.close();
                this._friendList = null;
            };
            _popup.closeView(this);
            Helper.gc();
        }
        public function clear():void{
        }

    }
}//package com.views 
