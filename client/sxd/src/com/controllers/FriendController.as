//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class FriendController extends com.controllers.Base {

        public var ownData:FriendData;
        private var _friendList:Array;
        public var showChatId:int = 0;
        private var _getListeners:Object;
        private var _sendColor:uint = 39423;

        public function addFriend():Object{
            var _local1:Array = this.ownData.addFriend;
            return (this.renderAddFriend(_local1));
        }
        public function addBlack():Object{
            var _local1:Array = this.ownData.addBlack;
            return (this.renderAddFriend(_local1));
        }
        public function deleteFriend():Object{
            var _local1:Array = this.ownData.deleteFriend;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getGroup():Object{
            var _local1:Array = this.ownData.getGroup;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function moveFriend():Object{
            var _local1:Array = this.ownData.moveFriend;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function updateSignature():Object{
            var _local1:Object = this.ownData.updateSignature;
            return (_local1);
        }
        public function getFriendList():Array{
            var _local1:Array = this.ownData.getFriendList;
            return (this.renderFriendList(_local1[0]));
        }
        public function getFriendInfo():Object{
            var _local1:Object = this.ownData.getFriendInfo;
            var _local2:Object = {};
            _local2.humor = _local1[0];
            _local2.level = (_local1[1] + FriendControllerLang.Ji);
            _local2.job = _local1[2];
            _local2.roleId = RoleType.getRoleId(_local2.job);
            _local2.signUrl = URI.getRoleIconUrl(_local2.job);
            _local2.fation = _local1[3];
            _local2.camp = _local1[4];
            _local2.id = _local1[5];
            _local2.AudienceNum = _local1[6];
            return (_local2);
        }
        public function getPlayerInfo():Object{
            var _local1:Array = this.ownData.getPlayerinfo;
            return (this.renderPlayerInfo(_local1));
        }
        public function messageCount():Object{
            var _local1:Object = this.ownData.messageCount;
            var _local2:Object = {};
            _local2.id = _local1[0];
            _local2.msgNum = _local1[1];
            return (_local2);
        }
        public function onlineState():Object{
            var _local1:Object = this.ownData.onlineState;
            var _local2:Object = {};
            _local2.id = _local1[0];
            if (_local1[1] == Mod_Friend_Base.ENTRY){
                _local2.isOnLine = true;
            } else {
                _local2.isOnLine = false;
            };
            return (_local2);
        }
        private function renderPlayerInfo(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.name = _ctrl.player.nickname;
            _local2.job = _arg1[1];
            var _local3:Object = MissionType.getMissionDataByMissionId(_arg1[2]);
            _local2.mission = (_local3["townName"] + _local3["minTownNum"]);
            _local2.signUrl = URI.getRoleIconUrl(_local2.job);
            _local2.AudienceNum = _arg1[3];
            return (_local2);
        }
        private function renderAddFriend(_arg1:Array):Object{
            var _local2:Object = {};
            var _local3:String = "";
            _local2.bool = false;
            switch (_arg1[0]){
                case Mod_Friend_Base.ADD_SUCCESS:
                    _local2.bool = true;
                    _local3 = FriendControllerLang.AddSuccess;
                    break;
                case Mod_Friend_Base.FRIEND_NOT_FOUND:
                    _local3 = FriendControllerLang.FriendNotFound;
                    break;
                case Mod_Friend_Base.ADD_SELF:
                    _local3 = FriendControllerLang.AddSelf;
                    break;
                case Mod_Friend_Base.EXIST_IN_FRIENDGROUP:
                    _local3 = FriendControllerLang.ExistInFriendFroup;
                    break;
                case Mod_Friend_Base.EXIST_IN_BLACKLISTGROUP:
                    _local3 = FriendControllerLang.ExistInBlackListgroup;
                    break;
                case Mod_Friend_Base.FRIENDGROUP_GT_UPPER_LIMIT:
                    _local3 = FriendControllerLang.FriendGroupGtUpperLimit;
                    break;
                case Mod_Friend_Base.FUNCTION_NO_OPEN:
                    _local3 = FriendControllerLang.FunctionNoOpen;
                    break;
            };
            _local2.info = _local3;
            _local2.msg = _arg1[0];
            return (_local2);
        }
        private function renderFriendList(_arg1:Array):Array{
            var _local4:Object;
            var _local5:Object;
            var _local2:int = _arg1.length;
            this._friendList = [];
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = {};
                _local4.id = _arg1[_local3][0];
                _local4.msgNum = _arg1[_local3][2];
                if ((((_local4.msgNum > 0)) && ((this.showChatId == 0)))){
                    this.showChatId = _local4.id;
                    _local4.msgNum = 0;
                };
                _local4.name = _arg1[_local3][1];
                _local4.showName = _ctrl.player.removeNickNameSuffix(_local4.name);
                if (_arg1[_local3][3] == Mod_Friend_Base.ONLINE){
                    _local4.onLine = true;
                    _local4.tempOnLine = true;
                } else {
                    if (_local4.msgNum > 0){
                        _local4.onLine = true;
                    } else {
                        _local4.onLine = false;
                    };
                    _local4.tempOnLine = false;
                };
                _local4.missionId = _arg1[_local3][4];
                if (_arg1[_local3][4] <= 0){
                    _local4.missionId = 1;
                };
                _local5 = MissionType.getMissionDataByMissionId(_local4.missionId);
                _local4.mission = ((("(" + _local5["townName"]) + _local5["minTownNum"]) + ")");
                _local4.lock = _local5["lock"];
                _local4.isGm = (_arg1[5] == 3);
                _local4.isStart = (_arg1[6] == 1);
                _local4.msgColor = ((_local4.isStart == true)) ? 191967 : 0xFFFFFF;
                if (_local4.isGm){
                    _local4.nameColor = 0xFFF100;
                    _local4.missionColor = 0xFFF100;
                    _local4.mission = "(GM)";
                } else {
                    if (_local4.onLine == false){
                        _local4.nameColor = 0x999999;
                    } else {
                        _local4.nameColor = 0xFFFFFF;
                    };
                    _local4.missionColor = 16737843;
                };
                _local4.vipLevel = _arg1[_local3][7];
                _local4.sex = RoleType.getRoleGender(_arg1[_local3][8]);
                this._friendList.push(_local4);
                _local3++;
            };
            return (this._friendList);
        }
        public function get getListeners():Object{
            var _local1:Array = this.ownData.getListeners;
            var _local2:Object = {};
            _local2.totalPage = _local1[0];
            _local2.pageCurrent = _local1[1];
            _local2.listenerList = this.renderListenersList(_local1[2]);
            return (_local2);
        }
        private function renderListenersList(_arg1:Array):Array{
            var _local5:Object;
            var _local6:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5.id = _arg1[_local4][0];
                _local5.name = _arg1[_local4][1];
                _local5.showName = _ctrl.player.removeNickNameSuffix(_local5.name);
                _local5.msgNum = _arg1[_local4][2];
                if (_arg1[_local4][3] == Mod_Friend_Base.ONLINE){
                    _local5.onLine = true;
                    _local5.tempOnLine = true;
                } else {
                    if (_local5.msgNum > 0){
                        _local5.onLine = true;
                    } else {
                        _local5.onLine = false;
                    };
                    _local5.tempOnLine = false;
                };
                _local5.missionId = _arg1[_local4][4];
                if (_arg1[_local4][4] <= 0){
                    _local5.missionId = 1;
                };
                _local6 = MissionType.getMissionDataByMissionId(_local5.missionId);
                _local5.mission = ((("(" + _local6["townName"]) + _local6["minTownNum"]) + ")");
                _local5.lock = _local6["lock"];
                _local5.nameColor = 0xFFFFFF;
                _local5.missionColor = 16737843;
                _local5.sex = RoleType.getRoleGender(_arg1[_local4][5]);
                _local3.push(_local5);
                _local4++;
            };
            return (_local3);
        }
        public function get getFriendinfoChatrecordList():Object{
            var _local1:Array = this.ownData.getFriendinfoChatrecordList;
            var _local2:Object = this.renderPlayerData(_local1);
            return (_local2);
        }
        private function renderPlayerData(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.playerId = _arg1[0];
            _local2.level = _arg1[1];
            _local2.name = _arg1[2];
            _local2.showName = _ctrl.player.removeNickNameSuffix(_local2.name);
            _local2.mission = _arg1[3];
            _local2.roleSign = _arg1[4];
            _local2.onLine = (_arg1[5] == Mod_Friend_Base.ONLINE);
            _local2.tempOnLine = _local2.onLine;
            _local2.isGm = PlayerType.isGM(_arg1[6]);
            _local2.isStartFriend = PlayerType.isStar(_arg1[7]);
            _local2.isStart = _ctrl.player.isStartAccount;
            _local2.chatRecordList = this.renderChatRecord(_arg1[8], _arg1[2], _local2.isStart, _local2.isStartFriend);
            if (_local2.isGm){
                _local2.url = URI.getRoleIconUrl("GM");
            } else {
                _local2.url = URI.getRoleIconUrl(_local2.roleSign);
            };
            return (_local2);
        }
        private function renderChatRecord(_arg1:Array, _arg2:String, _arg3:Boolean, _arg4:Boolean):Array{
            var _local8:Object;
            var _local5:Array = [];
            var _local6:int = _arg1.length;
            var _local7:int;
            while (_local7 < _local6) {
                _local8 = {};
                _local8.id = _arg1[_local7][0];
                if (_local8.id == _data.player.playerId){
                    _local8.color = "0xF39800";
                    _local8.name = _data.player.nickname;
                    _local8.msgColor = ((_arg3 == true)) ? 191967 : 0xFFFFFF;
                } else {
                    _local8.color = this._sendColor;
                    _local8.name = _arg2;
                    _local8.msgColor = ((_arg4 == true)) ? 191967 : 0xFFFFFF;
                };
                _local8.showName = _ctrl.player.removeNickNameSuffix(_local8.name);
                _local8.message = _arg1[_local7][1];
                _local8.eipNum = _arg1[_local7][2];
                _local8.eipIndex = _arg1[_local7][3];
                _local8.timeStamp = _arg1[_local7][4];
                _local8.diffTime = (_ctrl.player.serverTime - _local8.timeStamp);
                _local5.push(_local8);
                _local7++;
            };
            return (_local5);
        }
        public function get sendMessageToFriend():Object{
            var _local1:Array = this.ownData.sendMessageToFriend;
            var _local2:Object = this.renderSendMessage(_local1);
            return (_local2);
        }
        private function renderSendMessage(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.msg = _arg1[0];
            _local2.id = _arg1[1];
            if (_local2.id == _data.player.playerId){
                _local2.color = "0xF39800";
            } else {
                _local2.color = this._sendColor;
            };
            _local2.name = _arg1[2];
            _local2.showName = _ctrl.player.removeNickNameSuffix(_local2.name);
            _local2.isStart = _ctrl.player.isStartAccount;
            _local2.msgColor = ((_local2.isStart == true)) ? 191967 : 0xFFFFFF;
            _local2.playerId = _arg1[3];
            _local2.message = _arg1[4];
            _local2.eipNum = _arg1[5];
            _local2.eipIndex = _arg1[6];
            _local2.timeStamp = _arg1[7];
            return (_local2);
        }
        private function formatSendmsg(_arg1:Array):Object{
            var _local2:Object = {
                fromId:_arg1[1],
                label:_arg1[2],
                msg:_arg1[3],
                eNum:_arg1[4],
                eIndex:_arg1[5]
            };
            return (_local2);
        }
        public function get receiveMessageFromFriend():Object{
            var _local1:Array = this.ownData.receiveMessageFromFriend;
            var _local2:Object = this.renderReceiveMessage(_local1);
            return (_local2);
        }
        private function renderReceiveMessage(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.playerId = _arg1[0];
            _local2.name = _arg1[1];
            _local2.isGm = PlayerType.isGM(_arg1[2]);
            _local2.isStart = PlayerType.isStar(_arg1[3]);
            _local2.msgColor = ((_local2.isStart == true)) ? 191967 : 0xFFFFFF;
            _local2.showName = _ctrl.player.removeNickNameSuffix(_local2.name);
            _local2.color = this._sendColor;
            _local2.message = _arg1[4];
            _local2.eipNum = _arg1[5];
            _local2.eipIndex = _arg1[6];
            _local2.timeStamp = _arg1[7];
            return (_local2);
        }
        public function checkMsg():Object{
            var _local1:Object = this.ownData.checkReceiveMessage;
            return (_local1);
        }
        public function get getUnreceiveFriendList():Array{
            return (this.ownData.getUnreceiveFriendList);
        }
        public function set clearPlayerId(_arg1:int):void{
            this.ownData.clearUnreceiveId = _arg1;
        }
        public function get messageBoxList():Array{
            var _local5:Object;
            var _local1:Array = _data.friend.messageBoxList;
            var _local2:Array = [];
            var _local3:int = _local1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this.renderReceiveMessage(_local1[_local4]);
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get receiveFriendEnterState():Object{
            var _local1:Array = this.ownData.receiveFriendEnterState;
            var _local2:Object = {};
            _local2.friendId = _local1[0];
            _local2.state = _local1[1];
            return (_local2);
        }
        public function get addFriendById():Object{
            var _local1:Array = this.ownData.addFriendById;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }

    }
}//package com.controllers 
