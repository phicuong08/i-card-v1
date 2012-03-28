//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.haloer.data.*;
    import com.assist.server.*;

    public class ChatController extends com.controllers.Base {

        public var ownData:ChatData;

        public function get message():Array{
            var _local6:int;
            var _local1:Array = this.ownData.message;
            var _local2:Array = [];
            var _local3:int = _ctrl.player.serverTime;
            var _local4:int = _local1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local2[_local5] = {};
                oObject.list(_local1[_local5], _local2[_local5], ["playId", "playName", "isTester", "isStar", "msgType", "msgTxt", "eipNum", "eipIndex"]);
                _local6 = _local1[_local5][8];
                _local2[_local5].townKey = _local1[_local5][9];
                _local2[_local5].serverTime = _local3;
                _local2[_local5].sex = RoleType.getRoleGender(_local6);
                _local2[_local5].showName = _ctrl.player.removeNickNameSuffix(_local2[_local5].playName);
                _local2[_local5].nickNameSuffix = _ctrl.player.removeNickNameSuffix;
                _local2[_local5].fileColor = ((_local2[_local5].isStar == 1)) ? 191967 : 0xFFFFFF;
                _local5++;
            };
            return (_local2);
        }
        public function get chatWithPlayers():Array{
            var _local1:Array = this.ownData.chatWithPlayers;
            return (_local1);
        }
        public function get disableTalk():Object{
            var _local1:Array = this.ownData.disableTalk;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get shieldPlayerList():Array{
            var _local1:Array = this.ownData.shieldPlayerList;
            var _local2:Array = this.renderShieldList(_local1);
            return (_local2);
        }
        public function renderShieldList(_arg1:Array):Array{
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5.playId = _arg1[_local4][0];
                _local5.addTime = _arg1[_local4][1];
                _local3.push(_local5);
                _local4++;
            };
            return (_local3);
        }

    }
}//package com.controllers 
