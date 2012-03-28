//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class FriendData extends Base {

        private var _addFriend:Array;
        private var _addBlack:Array;
        private var _deleteFriend:Array;
        private var _moveFriend:Array;
        private var _updateSignature:Object;
        private var _getFriendList:Array;
        private var _getFriendInfo:Object;
        private var _messageCount:Object;
        private var _getGroup:Array;
        private var _onlineState:Object;
        private var _getPlayerinfo:Array;
        private var _getFriendinfoChatrecordList:Array;
        private var _receiveUnreceiveMessage:Array;
        private var _sendMessageToFriend:Array;
        private var _receiveMessageFromFriend:Array;
        private var _checkReceiveMessage:Array;
        private var _isInFriend:Array;
        private var _getListeners:Array;
        public var getUnreceiveFriendList:Array;
        public var messageBoxList:Array;
        public var notifyEnterState:Array;
        public var receiveFriendEnterState:Array;
        public var getVipList:Array;
        public var addFriendById:Array;

        public function get addFriend():Array{
            return (this._addFriend);
        }
        public function get addBlack():Array{
            return (this._addBlack);
        }
        public function get deleteFriend():Array{
            return (this._deleteFriend);
        }
        public function get moveFriend():Array{
            return (this._moveFriend);
        }
        public function get updateSignature():Object{
            return (this._updateSignature);
        }
        public function get getFriendList():Array{
            return (this._getFriendList);
        }
        public function get getFriendInfo():Object{
            return (this._getFriendInfo);
        }
        public function get messageCount():Object{
            return (this._messageCount);
        }
        public function get getGroup():Array{
            return (this._getGroup);
        }
        public function get onlineState():Object{
            return (this._onlineState);
        }
        public function get getPlayerinfo():Array{
            return (this._getPlayerinfo);
        }
        public function get getFriendinfoChatrecordList():Array{
            return (this._getFriendinfoChatrecordList);
        }
        public function get receiveUnreceiveMessage():Array{
            return (this._receiveUnreceiveMessage);
        }
        public function get sendMessageToFriend():Array{
            return (this._sendMessageToFriend);
        }
        public function get receiveMessageFromFriend():Array{
            return (this._receiveMessageFromFriend);
        }
        public function get checkReceiveMessage():Array{
            return (this._checkReceiveMessage);
        }
        public function get isInFriend():Array{
            return (this._isInFriend);
        }
        public function get getListeners():Array{
            return (this._getListeners);
        }
        public function add_friend(_arg1:Array):void{
            this._addFriend = _arg1;
        }
        public function add_to_black(_arg1:Array):void{
            this._addBlack = _arg1;
        }
        public function delete_friend(_arg1:Array):void{
            this._deleteFriend = _arg1;
        }
        public function move_friend(_arg1:Array):void{
            this._moveFriend = _arg1;
        }
        public function update_signature(_arg1:Object):void{
            this._updateSignature = _arg1;
        }
        public function get_friend_list(_arg1:Array):void{
            this._getFriendList = _arg1;
        }
        public function get_group(_arg1:Array):void{
            this._getGroup = _arg1;
        }
        public function get_friend_details_info(_arg1:Object):void{
            this._getFriendInfo = _arg1;
        }
        public function get_Playerinfo(_arg1:Array):void{
            this._getPlayerinfo = _arg1;
        }
        public function notify_message_count(_arg1:Array):void{
            this._messageCount = _arg1;
        }
        public function notify_online_state(_arg1:Array):void{
            this._onlineState = _arg1;
        }
        public function get_friendinfo_chatrecord_list(_arg1:Array):void{
            this._getFriendinfoChatrecordList = _arg1;
        }
        public function receive_unreceive_message(_arg1:Array):void{
            this._receiveUnreceiveMessage = _arg1;
        }
        public function send_message_to_friend(_arg1:Array):void{
            this._sendMessageToFriend = _arg1;
        }
        public function receive_message_from_friend(_arg1:Array):void{
            this._receiveMessageFromFriend = _arg1;
        }
        public function check_receive_message(_arg1:Array):void{
            this._checkReceiveMessage = _arg1;
        }
        public function get_unreceive_friend_list(_arg1:Array):void{
            this.getUnreceiveFriendList = _arg1[0];
        }
        public function set clearUnreceiveId(_arg1:int):void{
            var _local4:int;
            var _local2:int = this.getUnreceiveFriendList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this.getUnreceiveFriendList[_local3];
                if (_local4 == _arg1){
                    this.getUnreceiveFriendList.splice(_local3, 1);
                    return;
                };
                _local3++;
            };
        }
        public function is_in_friend(_arg1:Array):void{
            this._isInFriend = _arg1;
        }
        public function get_listeners(_arg1:Array):void{
            this._getListeners = _arg1;
        }
        public function message_box_list(_arg1:Array):void{
            this.messageBoxList = _arg1[0];
        }
        public function notify_enter_state(_arg1:Array):void{
            this.notifyEnterState = _arg1;
        }
        public function receive_friend_enter_state(_arg1:Array):void{
            this.receiveFriendEnterState = _arg1;
        }
        public function vip_player_list(_arg1:Array):void{
            this.getVipList = _arg1;
        }
        public function add_friend_by_id(_arg1:Array):void{
            this.addFriendById = _arg1;
        }

    }
}//package com.datas 
