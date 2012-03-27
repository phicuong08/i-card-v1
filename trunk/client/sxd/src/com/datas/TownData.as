//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.view.info.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;

    public class TownData extends Base {

        public static var maxCount:int = 500;

        public var allList:Array;
        public var showCount:int = 0;
        public var count:int = 0;
        public var result:int;
        public var playercount:int = 0;
        public var showList:Array;
        public var entownList:Array;
        public var moveList:Array;
        public var leaveList:Array;
        public var followList:Array;
        public var factionId:int = 0;

        public function TownData(){
            this.allList = [];
            this.showList = [];
            this.entownList = [];
            this.moveList = [];
            this.leaveList = [];
            this.followList = [];
            super();
        }
        public function getPlayerInfo(_arg1:int):PlayerInfo{
            return (((this.allList[_arg1]) || ((this.allList[_arg1] = new PlayerInfo()))));
        }
        public function enter_town(_arg1:Array):void{
            var _local2:PlayerInfo = (PlayerInfo.info = _data.player.playerInfo);
            this.allList[_local2.id] = _local2;
            this.result = _arg1.shift();
            if (this.result != Mod_Town_Base.SUCCESS){
                this.entownList[_arg1[0]] = _arg1[0];
                return;
            };
            var _local3:Object = {};
            oObject.list(_arg1, _local3, ["player_id", "role_id", "follow_role_id", "nickname", "position_x", "position_y", "transport", "avatar", "camp_id", "equip_item_id", "warState", "practice_status", "is_on_mission_practice", "faction_id", "faction_name", "is_star", "is_world_war_top", "player_pet_animal_lv", "player_pet_animal_stage"]);
            _local2 = this.parsePlayer(_local3);
            if (_local2.isMine){
                this.factionId = _local2.factionId;
                _local2.factionColor = 8438377;
            };
            this.count++;
        }
        public function move_to(_arg1:Array):void{
            var _local2:int = _arg1[0];
            var _local3:PlayerInfo = (this.allList[_local2] as PlayerInfo);
            if (_local3 != null){
                _local3.x = _arg1[3];
                _local3.y = _arg1[4];
                _local3.practice = Mod_Town_Base.OFF_PRACTICE;
            };
            if ((this.showList[_local2] is PlayerInfo)){
                this.moveList[_local2] = _local2;
            };
        }
        public function leave_town(_arg1:Array):void{
            var _local2:int = _arg1[0];
            if ((this.allList[_local2] is PlayerInfo)){
                this.count--;
            };
            if ((this.showList[_local2] is PlayerInfo)){
                this.leaveList[_local2] = _local2;
                this.showCount--;
                delete this.showList[_local2];
            };
        }
        public function get_players(_arg1:Array):void{
            var _local3:Array;
            var _local4:Object;
            _arg1 = _arg1[0];
            this.count = _arg1.length;
            var _local2:int = _data.player.playerInfo.id;
            for each (_local3 in _arg1) {
                if (_local3[0] != _local2){
                    _local4 = {};
                    oObject.list(_local3, _local4, ["player_id", "role_id", "follow_role_id", "nickname", "position_x", "position_y", "transport", "avatar", "camp_id", "equip_item_id", "warState", "practice_status", "is_on_mission_practice", "faction_id", "faction_name", "is_star", "is_world_war_top", "player_pet_animal_lv", "player_pet_animal_stage"]);
                    this.parsePlayer(_local4);
                };
            };
        }
        public function player_follow_role_change(_arg1:Array):void{
            var _local2:int = _arg1[0];
            if ((this.allList[_local2] is PlayerInfo)){
                (this.allList[_local2] as PlayerInfo).followRoleId = _arg1[1];
            };
            if ((this.showList[_local2] is PlayerInfo)){
                this.followList[_local2] = _local2;
            };
        }
        public function player_count(_arg1:Array):void{
            this.playercount = _arg1[0];
        }
        private function parsePlayer(_arg1:Object):PlayerInfo{
            var _local2:int = _arg1.player_id;
            var _local3:PlayerInfo = ((this.allList[_local2]) || (new PlayerInfo()));
            _local3.followRoleId = _arg1.follow_role_id;
            _local3.id = _local2;
            _local3.roleId = _arg1.role_id;
            _local3.name = _arg1.nickname;
            _local3.x = _arg1.position_x;
            _local3.y = _arg1.position_y;
            _local3.warState = _arg1.warState;
            _local3.starUser = _arg1.is_star;
            _local3.topUser = _arg1.is_world_war_top;
            _local3.signSuffix = ItemType.getItemSuffix(_arg1.equip_item_id);
            _local3.practice = _arg1.practice_status;
            _local3.factionId = int(_arg1.faction_id);
            _local3.factionName = _arg1.faction_name;
            _local3.factionColor = ((_local3.factionId)==this.factionId) ? 8438377 : 0xEEEEEE;
            _local3.petLv = _arg1.player_pet_animal_lv;
            _local3.petStar = _arg1.player_pet_animal_stage;
            var _local4:String = RoleType.getRoleSign(_local3.roleId);
            _local3.sign = _local4;
            _local3.fullHeadUrl = ((URI.iconsUrl + _local4) + ".png");
            this.allList[_local3.id] = _local3;
            this.setPlayerMount(_arg1.transport, _local2);
            this.setPlayerAvatar(_arg1.avatar, _local2);
            if ((((this.showList[_local2] == null)) && (((_local3.isMine) || ((this.showCount < maxCount)))))){
                this.entownList[_local2] = _local2;
                this.showList[_local2] = _local3;
                this.showCount++;
            };
            _local3.name = _data.player.removeNickNameSuffix(_local3.name);
            _local3.factionName = _data.player.removeNickNameSuffix(_local3.factionName);
            return (_local3);
        }
        public function clearPlayer():void{
            this.showList = [];
            this.allList = [];
            this.entownList = [];
            this.moveList = [];
            this.leaveList = [];
            this.showCount = 0;
            this.count = 0;
            var _local1:PlayerInfo = _data.player.playerInfo;
            this.allList[_local1.id] = _local1;
        }
        public function setPlayerMount(_arg1:int, _arg2:int):void{
            var _local3:PlayerInfo = (this.allList[_arg2] as PlayerInfo);
            if (_local3 == null){
                return;
            };
            _local3.setMount(_arg1);
        }
        public function setPlayerAvatar(_arg1:int, _arg2:int):void{
            var _local3:PlayerInfo = (this.allList[_arg2] as PlayerInfo);
            if (_local3 == null){
                return;
            };
            _local3.setAvatar(_arg1);
        }

    }
}//package com.datas 
