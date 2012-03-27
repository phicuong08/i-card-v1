//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.*;
    import com.haloer.data.*;
    import com.assist.server.*;

    public class SendFlowerData extends Base {

        private var _arySendFlowerRecord:Array;
        private var _objSendFlowerInfo:Object;
        private var _objSendPlayerFlower:Object;
        private var _arySendFlowerRanking:Array;

        public function SendFlowerData(){
            this._arySendFlowerRecord = [];
            this._objSendFlowerInfo = {};
            this._objSendPlayerFlower = {};
            this._arySendFlowerRanking = [];
            super();
        }
        public function sendFlowerRecord():Array{
            return (this._arySendFlowerRecord);
        }
        public function sendFlowerInfo():Object{
            return (this._objSendFlowerInfo);
        }
        public function sendPlayerFlower():Object{
            return (this._objSendPlayerFlower);
        }
        public function sendFlowerRanking():Array{
            return (this._arySendFlowerRanking);
        }
        private function sortBySendTime(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["send_time"];
            var _local4:int = _arg2["send_time"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        private function sortByFlowerCount(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["flower_count"];
            var _local4:int = _arg2["flower_count"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        public function player_send_flower_info(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this._objSendFlowerInfo = {};
            this._arySendFlowerRecord = [];
            oObject.list(_arg1, this._objSendFlowerInfo, ["result", "player_id", "nickname", "role_id", "max_player_id", "max_nickname", "max_flower_count", "total_flower_count", "is_can_send"]);
            this._objSendFlowerInfo["nickname_new"] = this._data.player.removeNickNameSuffix(this._objSendFlowerInfo["nickname"]);
            this._objSendFlowerInfo["max_nickname_new"] = this._data.player.removeNickNameSuffix(this._objSendFlowerInfo["max_nickname"]);
            this._objSendFlowerInfo["url"] = ((URI.iconsUrl + RoleType.getRoleSign(this._objSendFlowerInfo["role_id"])) + ".png");
            for each (_local2 in _arg1[9]) {
                _local3 = {};
                oObject.list(_local2, _local3, ["player_id", "nickname", "role_id", "flower_type", "send_time"]);
                _local3["nickname_new"] = this._data.player.removeNickNameSuffix(_local3["nickname"]);
                _local3["url"] = ((URI.iconsUrl + RoleType.getRoleSign(_local3["role_id"])) + ".png");
                this._arySendFlowerRecord.push(_local3);
            };
            this._arySendFlowerRecord.sort(this.sortBySendTime);
        }
        public function send_player_flower(_arg1:Array):void{
            this._objSendPlayerFlower = {result:_arg1[0]};
        }
        public function send_flower_ranking(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this._arySendFlowerRanking = [];
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["player_id", "nickname", "role_id", "flower_count"]);
                _local2["nickname_new"] = this._data.player.removeNickNameSuffix(_local2["nickname"]);
                _local2["sex"] = ((RoleType.getRoleGender(_local2["role_id"]) == "Nv")) ? 1 : 2;
                this._arySendFlowerRanking.push(_local2);
            };
        }

    }
}//package com.datas 
