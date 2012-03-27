//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.datas.*;

    public class NotifyData extends Base {

        private var _pkAward:Array;
        private var _getGoodFate:Array;
        public var missionAwardList:Array;
        public var reelList:Array;
        private var intRoleCount:int;
        private var aryResearch:Array;
        private var intRoleID:int;
        public var getBuyGoodStuffInLuckyShop:Object;
        public var giftObjList:Array;
        public var eq_PlayerId:int;
        public var eq_ItemId:int;
        public var MissionPracticeStatus:Array;
        private var reg1:RegExp;
        private var reg2:RegExp;
        private var _takeBible:Array;
        private var _takeBibleBerobbed:Array;
        public var gameTimer:Object;
        public var sendFlowerInfo:Object;
        public var passTowerMsg:Array;
        public var RulaiStatus:Array;
        public var rollCake:Array;
        public var serverWarWinnerMsg:String = "";
        public var firstLoginChat:String = "";
        public var firstLoginWorld:String = "";
        public var petBaoJi:String = "";
        public var zodiacEntryNotify:Object;
        public var studyStuntNotify:Object;

        public function NotifyData(){
            this.missionAwardList = [];
            this.reelList = [];
            this.aryResearch = [];
            this.getBuyGoodStuffInLuckyShop = {};
            this.giftObjList = [];
            this.reg1 = /\[(.+?)\]/g;
            this.reg2 = /\<(.+?)\>/g;
            this.gameTimer = {};
            this.sendFlowerInfo = {};
            this.passTowerMsg = [];
            this.zodiacEntryNotify = {};
            this.studyStuntNotify = {};
            super();
        }
        public function get pkAward():Array{
            return (this._pkAward);
        }
        public function get getGoodFate():Array{
            return (this._getGoodFate);
        }
        public function mission_award(_arg1:Array):void{
            var _local2:Object = {};
            this.missionAwardList.push(_local2);
            _local2.player_id = _arg1[0];
            _local2.nickname = _data.player.removeNickNameSuffix(_arg1[1]);
            _local2.mission_id = _arg1[2];
            _local2.item_id = _arg1[3];
            _local2.ingot = _arg1[4];
            _local2.boss_id = _arg1[5];
        }
        public function pk_award(_arg1:Array):void{
            this._pkAward = _arg1;
        }
        public function complete_reel_production(_arg1:Array):void{
            var _local2:Object = {};
            this.reelList.push(_local2);
            _local2.player_id = _arg1[0];
            _local2.nickname = _data.player.removeNickNameSuffix(_arg1[1]);
            _local2.reel_id = _arg1[2];
            _local2.item_id = _arg1[3];
            _local2.qlv = _arg1[4];
            _local2.gold_id = _arg1[5];
            _local2.playerItemid = int(_arg1[6]);
        }
        public function role_num_notify(_arg1:Array):void{
            this.intRoleCount = _arg1[0];
        }
        public function getRoleCount():int{
            return (this.intRoleCount);
        }
        public function new_research_notify(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this.aryResearch = [];
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["id", "name"]);
                this.aryResearch.push(_local2);
            };
        }
        public function getNewResearch():Array{
            return (this.aryResearch);
        }
        public function new_partners_notify(_arg1:Array):void{
            this.intRoleID = _arg1[0];
        }
        public function getNewPartnersId():int{
            return (this.intRoleID);
        }
        public function update_lucky_shop_item(_arg1:Array):void{
        }
        public function buy_good_stuff_in_lucky_shop(_arg1:Array):void{
            this.getBuyGoodStuffInLuckyShop = {};
            oObject.list(_arg1, this.getBuyGoodStuffInLuckyShop, ["player_id", "player_name", "item_id"]);
        }
        public function update_player_super_gift(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.giftObjList = [];
            for each (_local2 in _arg1[0]) {
                _local3 = {};
                oObject.list(_local2, _local3, ["player_gift_id", "type", "gift_id", "message"]);
                _local3.sign = (ActivityType.GiftStr + _local3.type);
                _local3.message = _local3.message.replace(this.reg2, this.regfun2);
                _local3.message = _local3.message.replace(this.reg1, this.regfun1);
                _local3.message = (("<font color='#ffffff'>" + _local3.message) + "</font>");
                this.giftObjList[_local3.sign] = _local3;
            };
        }
        public function notify_get_good_fate(_arg1:Array):void{
            this._getGoodFate = _arg1;
        }
        public function change_equip(_arg1:Array):void{
            this.eq_PlayerId = _arg1[0];
            this.eq_ItemId = _arg1[1];
            var _local2:PlayerInfo = _data.town.getPlayerInfo(this.eq_PlayerId);
            _local2.signSuffix = ItemType.getItemSuffix(this.eq_ItemId);
        }
        public function disband_faction_notify(_arg1:Array):void{
        }
        public function kickout_member_notify(_arg1:Array):void{
        }
        public function notify_player_mission_practice_status(_arg1:Array):void{
            this.MissionPracticeStatus = _arg1;
        }
        private function regfun1(... _args):String{
            var _local2:String = _args[1];
            var _local3:String = "";
            var _local4:Array = _local2.split(",");
            if (_local4.length > 1){
                _local3 = _local4.pop();
                if (((((!((_local3.charAt(0) == "\""))) || (!((_local3.charAt(1) == "#"))))) || (!((_local3.charAt((_local3.length - 1)) == "\""))))){
                    _local4.push(_local3);
                    _local3 = "";
                };
                _local2 = _local4.join(",");
            };
            if (_local3 == ""){
                return ((("<font color=\"#fff200\">" + _local2) + "</font>"));
            };
            return ((((("<font color=" + _local3) + ">") + _local2) + "</font>"));
        }
        private function regfun2(... _args):String{
            var _local2:String = _args[1];
            
            var _local4:Array = _local2.split("_");
            return  this.getServerWar(int(_local4[0]), int(_local4[1]), int(_local4[2]), int(_local4[3]));
            
        }
        private function getServerWar(_arg1:int, _arg2:int, _arg3:int, _arg4:int):String{
            var _local5:String = _data.serverWar.info.getGroupName(_arg3);
            if (_arg1 == Mod_ServerWar_Base.RACE_TYPE_STAGE_SELECT_RACE){
                _local5 = (NotifyDataLang.ServerWarType1 + _local5);
            } else {
                if (_arg1 == Mod_ServerWar_Base.RACE_TYPE_STAGE_RACE){
                    _local5 = (NotifyDataLang.ServerWarType2 + _local5);
                };
            };
            if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_16){
                _local5 = (_local5 + NotifyDataLang.Page32);
            } else {
                if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_8){
                    _local5 = (_local5 + NotifyDataLang.Page16);
                } else {
                    if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_4){
                        _local5 = (_local5 + NotifyDataLang.Page8);
                    } else {
                        if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_2){
                            _local5 = (_local5 + NotifyDataLang.Page4);
                        } else {
                            if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_1){
                                _local5 = (_local5 + NotifyDataLang.Page2);
                            } else {
                                if (_arg4 == Mod_ServerWar_Base.SERVER_WAR_1_COMPLETE){
                                    _local5 = (_local5 + NotifyDataLang.Page1);
                                };
                            };
                        };
                    };
                };
            };
            return (Lang.sprintf(NotifyDataLang.CongratulationPage, HtmlText.yellow2((("【" + _local5) + "】"))));
        }
        private function getLinkPlayer(_arg1:int, _arg2:String):String{
            var _local3:String = ((((TextLinkType.Player + "_") + _arg1) + "_") + _arg2);
            return ((((("<font color=\"#fff200\"><a href=\"event:" + _local3) + "\"><u>") + _arg2) + "</u></a></font>"));
        }
        public function get takeBible():Array{
            return (this._takeBible);
        }
        public function get takeBibleBerobbed():Array{
            return (this._takeBibleBerobbed);
        }
        public function player_take_bible(_arg1:Array):void{
            this._takeBible = _arg1;
        }
        public function player_take_bible_berobbed(_arg1:Array):void{
            this._takeBibleBerobbed = _arg1;
        }
        public function game_timer(_arg1:Array):void{
            this.gameTimer = {};
            oObject.list(_arg1, this.gameTimer, ["timer_type"]);
        }
        public function send_flower(_arg1:Array):void{
            this.sendFlowerInfo = {};
            oObject.list(_arg1, this.sendFlowerInfo, ["send_player_nickname", "receive_player_nickname", "flower_count", "award_fame", "receive_player_sex"]);
            this.sendFlowerInfo["send_player_nickname"] = this._data.player.removeNickNameSuffix(this.sendFlowerInfo["send_player_nickname"]);
            this.sendFlowerInfo["receive_player_nickname"] = this._data.player.removeNickNameSuffix(this.sendFlowerInfo["receive_player_nickname"]);
        }
        public function pass_tower(_arg1:Array):void{
            var _local2:String;
            if (_arg1[2] == 1){
                _local2 = Lang.sprintf(NotifyDataLang.PassTower, _data.player.removeNickNameSuffix(_arg1[0]), _data.tower.info.daoName[_arg1[1]], (int(_arg1[1]) * 10));
                this.passTowerMsg.push(HtmlText.format(_local2, 0xFFF200, 24, "", true));
            };
        }
        public function update_rulai_status(_arg1:Array):void{
            this.RulaiStatus = _arg1;
        }
        public function roll_cake(_arg1:Array):void{
            this.rollCake = _arg1;
        }
        public function update_server_war_step(_arg1:Array):void{
            _data.serverWar.info.serverState = _arg1[0];
        }
        public function have_new_server_war_report(_arg1:Array):void{
        }
        public function server_war_winner(_arg1:Array):void{
            var _local2:String = (("【" + _data.player.removeNickNameSuffix(_arg1[3])) + "】");
            if (_arg1[0] == Mod_ServerWar_Base.RACE_TYPE_STAGE_SELECT_RACE){
                this.serverWarWinnerMsg = HtmlText.format(Lang.sprintf(NotifyDataLang.CongratulationWinType1, _local2), 0xFFF200, 25);
            } else {
                _local2 = ((_arg1[1] + _arg1[2]) + _local2);
                this.serverWarWinnerMsg = HtmlText.format(Lang.sprintf(NotifyDataLang.CongratulationWinType2, _local2), 0xFFF200, 25);
            };
        }
        public function world_war_top_login(_arg1:Array):void{
            var _local2:String = (("【" + _data.player.removeNickNameSuffix(_arg1[0])) + "】");
            _local2 = Lang.sprintf(NotifyDataLang.OnlineNotification, _local2);
            this.firstLoginChat = HtmlText.yellow2(_local2);
            this.firstLoginWorld = HtmlText.format(_local2, 0xFFF200, 24, "", true);
        }
        public function get_pet_animal_exp(_arg1:Array):void{
            this.petBaoJi = Lang.sprintf(NotifyDataLang.PetBaoJi, _arg1[0]);
            this.petBaoJi = HtmlText.format(this.petBaoJi, 0xFFF200, 26);
        }
        public function zodiac_entry_notify(_arg1:Array):void{
            this.zodiacEntryNotify = {};
            oObject.list(_arg1, this.zodiacEntryNotify, ["nickname", "zodiac_leve"]);
            this.zodiacEntryNotify["nickname"] = this._data.player.removeNickNameSuffix(this.zodiacEntryNotify["nickname"]);
        }
        public function study_stunt_notify(_arg1:Array):void{
            this.studyStuntNotify = {};
            oObject.list(_arg1, this.studyStuntNotify, ["nickname", "stunt_id"]);
            this.studyStuntNotify["nickname"] = this._data.player.removeNickNameSuffix(this.studyStuntNotify["nickname"]);
            this.studyStuntNotify["stunt_name"] = StudyStuntType.getName(this.studyStuntNotify["stunt_id"]);
        }

    }
}//package com.datas 
