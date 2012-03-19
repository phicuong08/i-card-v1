//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
    import flash.utils.*;
    import ICard.assist.view.info.*;
    import ICard.assist.*;
    import ICard.haloer.data.*;
    import ICard.protocols.*;
    import ICard.assist.server.*;

    public class PlayerData extends Base {

        public var playerInfo:PlayerInfo;
        public var logined:int = 1;
        public var playerId:int;
        public var isMinorAccount:int;
        public var enableTime:int;
        public var createdRole:int;
        public var nickname:String;
        public var originNickName:String;
        public var level:int;
        public var ingot:int;
        public var ingotChange:int;
        public var coins:Number;
        public var coinChange:Number;
        public var skill:int;
        public var skillChange:int;
        public var health:int;
        public var maxHealth:int;
        public var power:int;
        public var experience:Number;
        public var maxExperience:Number;
        public var tester:int;
        public var missionKey:int;
        public var lastPlayVersion:int;
        public var mapId:int;
        public var townMapId:int;
        public var jihuisuoId:int;
        public var bossMapId:int;
        public var vipLevel:int;
        public var avatar:int = 0;
        public var avatarCD:int = 0;
        public var mainPlayerRoleId:int;
        public var mainRoleId:int;
        public var campId:int;
        public var townKey:int;
        public var medical:int;
        public var medicalMax:int;
        public var mounts:int = -1;
        public var packNum:int = 1;
        public var upRoleList:Array;
        public var statePoint:int = 0;
        public var giftItemId:int = 0;
        public var healthUpdateSys:int;
        public var healthUpdateMedical:int;
        public var healthUpdateMedicalEmpty:int;
        public var otherPlayerLv:int = 0;
        public var oldDatas:Object;
        public var updatePlayerDataForTownList:Array;
        private var _buyPower:Array;
        private var _buyPowerData:Array;
        public var hasNewFunction:Boolean = false;
        public var functionList:Array;
        public var delayMessage:Array;
        public var campResult:int;
        public var hasQuestState:Boolean;
        public var freeMedicalEnabled:Boolean;
        public var campSalaryEnabled:Boolean;
        public var campSalaryStatus:int;
        public var campSalaryCoin:int;
        public var getPlayerCampSalary:int;
        public var onlineGift:Object;
        public var nextOnlineGift:Object;
        public var isGetOnlineGift:int = -2;
        public var onlineGiftTime:int;
        public var fame:int;
        public var fameChange:int;
        public var fameLevel:int;
        public var extraPower:int;
        public var maxExtraPower:int;
        public var validateIdCard:int;
        public var againstWallowsNotify:int;
        public var againstWallowsInfo:int;
        public var diffServerTime:int;
        public var warCdTime:int;
        public var dayQuestState:int;
        public var finishDayQuest:int = 1;
        public var canIncenseCount:int;
        private var _afficheList:Array;
        private var _warningAffiche:Array;
        public var startAccount:int;
        public var getGameAssistantInfo:Object;
        public var backTimesResult:Object;
        public var isSendIngotReceiveShowVip:Boolean;
        public var playerInfoContrastData:Object;
        public var practiceChangeList:Array;

        public function PlayerData(){
            this.playerInfo = new PlayerInfo(true);
            this.upRoleList = [];
            this.oldDatas = {};
            this.updatePlayerDataForTownList = [];
            this.functionList = [];
            this.delayMessage = [];
            this.onlineGift = {};
            this.nextOnlineGift = {};
            this.getGameAssistantInfo = {};
            this.backTimesResult = {};
            this.practiceChangeList = [];
            super();
        }
        public function get buyPower():Array{
            return (this._buyPower);
        }
        public function get buyPowerData():Array{
            return (this._buyPowerData);
        }
        public function get afficheList():Array{
            return (this._afficheList);
        }
        public function get warningAffiche():Array{
            return (this._warningAffiche);
        }
        public function login(_arg1:Array):void{
            this.logined = _arg1[0];
            this.playerId = _arg1[1];
            this.playerInfo.id = this.playerId;
            this.enableTime = ((_arg1[3]) || (0));
        }
        public function get_player_info(_arg1:Array):void{
            this.format_player_info(_arg1);
        }
        public function player_first_init(_arg1:Array):void{
            this.createdRole = _arg1[0];
        }
        public function update_player_data(_arg1:Array):void{
            this.format_player_data(_arg1[0]);
        }
        public function update_player_data_for_town(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.updatePlayerDataForTownList = [];
            _arg1 = _arg1[0];
            for each (_local2 in _arg1) {
                _local3 = {
                    id:_local2[0],
                    type:_local2[1],
                    value:_local2[2]
                };
                this.updatePlayerDataForTownList.push(_local3);
            };
        }
        public function buy_power(_arg1:Array):void{
            this._buyPower = _arg1;
        }
        public function get_buy_power_data(_arg1:Array):void{
            this._buyPowerData = _arg1;
        }
        public function get_player_function(_arg1:Array):void{
            this.functionList = this.format_get_player_function(_arg1);
        }
        public function sign_play_player_function(_arg1:Array):void{
            this.format_sign_play_player_function(_arg1);
        }
        public function receive_player_delay_notify_message(_arg1:Array):void{
            var _local2:Object;
            var _local4:Array;
            this.delayMessage = [];
            var _local3:Date = new Date();
            if ((_arg1[0] as Array).length > 0){
                for each (_local4 in _arg1[0]) {
                    _local2 = {};
                    oObject.list(_local4, _local2, ["message", "id"]);
                    _local2["message"] = (_local2["message"] as String).replace(/&lt;/g, "<");
                    _local2["message"] = (_local2["message"] as String).replace(/&gt;/g, ">");
                    _local2["message"] = (_local2["message"] as String).replace(/&amp;/g, "&");
                    this.delayMessage.push(_local2);
                };
            };
        }
        public function set_player_camp(_arg1:Array):void{
            this.campResult = _arg1[0];
        }
        public function validate_id_card(_arg1:Array):void{
            this.validateIdCard = _arg1[0];
        }
        public function against_wallows_notify(_arg1:Array):void{
            this.againstWallowsNotify = _arg1[0];
        }
        public function against_wallows_info(_arg1:Array):void{
            this.againstWallowsInfo = _arg1[0];
            this.isMinorAccount = _arg1[1];
        }
        public function server_time(_arg1:Array):void{
            var _local2:Number = (new Date().getTime() / 1000);
            this.diffServerTime = (_local2 - _arg1[0]);
        }
        public function get_other_player_info(_arg1:Array):void{
            this.otherPlayerLv = _arg1[0];
        }
        public function get_player_camp_salary(_arg1:Array):void{
            this.campSalaryStatus = _arg1[0];
            this.getPlayerCampSalary = _arg1[1];
        }
        public function player_get_online_gift(_arg1:Array):void{
            var _local3:Object;
            var _local4:Array;
            var _local2:Array = [];
            for each (_local4 in _arg1[1]) {
                _local3 = {};
                oObject.list(_local4, _local3, ["type", "item_id", "value"]);
                _local2.push(_local3);
            };
            this.onlineGift["result"] = _arg1[0];
            this.onlineGift["online_gift_list"] = _local2;
            this.onlineGift["next_time_stamp"] = _arg1[2];
        }
        public function get_player_current_online_gift(_arg1:Array):void{
            var _local3:Array;
            var _local4:Object;
            var _local2:Array = [];
            for each (_local3 in _arg1[1]) {
                _local4 = {};
                oObject.list(_local3, _local4, ["type", "item_id", "value"]);
                _local2.push(_local4);
            };
            this.nextOnlineGift["time_stamp"] = _arg1[0];
            this.nextOnlineGift["online_gift_list"] = _local2;
        }
        public function get_affiche_list(_arg1:Array):void{
            this._afficheList = _arg1;
        }
        public function get_warning_affiche(_arg1:Array):void{
            this._warningAffiche = _arg1;
        }
        public function player_info_contrast(_arg1:Array):void{
            var _local2:Array = _arg1[0][0];
            var _local3:Object = {};
            _local3.playerId = _local2[0];
            _local3.rankIng = _local2[1];
            _local3.factionName = _local2[2];
            _local3.combat = _local2[3];
            _local3.fame = _local2[4];
            _local3.skill = _local2[5];
            _local3.achievmentPoints = _local2[6];
            _local3.firstAttack = _local2[7];
            _local3.statePoint = _local2[8];
            _local3.flowerCount = _local2[9];
            this.playerInfoContrastData = _local3;
        }
        private function format_player_info(_arg1:Array):void{
            oObject.list(_arg1, this, ["nickname", "level", "ingot", "coins", "health", "maxHealth", "power", "experience", "maxExperience", "townMapId", "bossMapId", "jihuisuoId", "mounts", "vipLevel", "avatar", "avatarCD", "mainPlayerRoleId", "mainRoleId", "campId", "townKey", "fame", "fameLevel", "extraPower", "maxExtraPower", "tester", "lastPlayVersion", "missionKey", "startAccount"]);
            this.originNickName = this.nickname;
            this.nickname = this.removeNickNameSuffix(this.nickname);
            this.avatarCD = ((this.avatarCD * 1000) + getTimer());
            _data.town.setPlayerMount(this.mounts, this.playerId);
            _data.town.setPlayerAvatar(this.avatar, this.playerId);
            if (URI.vipHidden){
                this.vipLevel = -1;
            };
            VIPType.level = this.vipLevel;
            MissionType.lock = this.missionKey;
            TownType.lock = this.townKey;
            TownType.campSign = FactionType.campSign(this.campId);
        }
        private function format_player_data(_arg1:Array):void{
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this.updatePlayerData(_arg1[_local3][0], _arg1[_local3][1]);
                _local3++;
            };
        }
        private function updatePlayerData(_arg1:int, _arg2:Number):void{
            var _local3:int;
            switch (_arg1){
                case Mod_Player_Base.PLAYER_LEVEL:
                    this.oldDatas[_arg1] = this.level;
                    this.level = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_INGOT:
                    this.oldDatas[_arg1] = this.ingot;
                    this.ingotChange = (_arg2 - this.ingot);
                    this.ingot = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_COINS:
                    this.oldDatas[_arg1] = this.coins;
                    this.coinChange = (_arg2 - this.coins);
                    this.coins = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_HEALTH:
                    this.oldDatas[_arg1] = this.health;
                    this.health = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_MAX_HEALTH:
                    this.oldDatas[_arg1] = this.maxHealth;
                    this.maxHealth = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_POWER:
                    this.oldDatas[_arg1] = this.power;
                    this.power = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_EXPERIENCE:
                    this.oldDatas[_arg1] = this.experience;
                    this.experience = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_MAX_EXPERIENCE:
                    this.oldDatas[_arg1] = this.maxExperience;
                    this.maxExperience = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_MEDICAL:
                    this.oldDatas[_arg1] = this.medical;
                    this.medical = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_INIT_MEDICAL:
                    this.oldDatas[_arg1] = this.medicalMax;
                    this.medicalMax = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_TRANSPORT:
                    this.oldDatas[_arg1] = this.mounts;
                    this.mounts = _arg2;
                    _data.town.setPlayerMount(this.mounts, this.playerId);
                    break;
                case Mod_Player_Base.PLAYER_AVATAR:
                    this.oldDatas[_arg1] = this.avatar;
                    this.avatar = _arg2;
                    _data.town.setPlayerAvatar(this.avatar, this.playerId);
                    break;
                case Mod_Player_Base.PLAYER_AVATAR_CD:
                    this.oldDatas[_arg1] = this.avatarCD;
                    this.avatarCD = ((_arg2 * 1000) + getTimer());
                    break;
                case Mod_Player_Base.PLAYER_PACK_EMPTY_NUM:
                    this.oldDatas[_arg1] = this.packNum;
                    this.packNum = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_FUNCTION:
                    this.hasNewFunction = true;
                    break;
                case Mod_Player_Base.PLAYER_QUEST_STATE:
                    this.hasQuestState = true;
                    break;
                case Mod_Player_Base.PLAYER_ROLE_LEVEL:
                    this.upRoleList[_arg2] = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_TOWN_KEY:
                    this.oldDatas[_arg1] = this.townKey;
                    this.townKey = _arg2;
                    TownType.lock = _arg2;
                    break;
                case Mod_Player_Base.HEALTH_UP_SYS:
                    this.oldDatas[_arg1] = this.healthUpdateSys;
                    this.healthUpdateSys = (Math.random() * 100000);
                    break;
                case Mod_Player_Base.HEALTH_UP_MEDICAL:
                    this.oldDatas[_arg1] = this.healthUpdateMedical;
                    this.healthUpdateMedical = (Math.random() * 100000);
                    break;
                case Mod_Player_Base.HEALTH_UP_MEDICAL_EMPTY:
                    this.oldDatas[_arg1] = this.healthUpdateMedicalEmpty;
                    this.healthUpdateMedicalEmpty = (Math.random() * 100000);
                    break;
                case Mod_Player_Base.FREE_MEDICAL:
                    this.freeMedicalEnabled = (_arg2 == 1);
                    break;
                case Mod_Player_Base.CAMP_SALARY:
                    this.campSalaryEnabled = (_arg2 > 0);
                    this.oldDatas[_arg1] = this.campSalaryCoin;
                    this.campSalaryCoin = _arg2;
                    break;
                case Mod_Player_Base.FAME:
                    this.fameChange = (_arg2 - this.fame);
                    this.fame = _arg2;
                    break;
                case Mod_Player_Base.FAME_LEVEL:
                    this.fameLevel = _arg2;
                    break;
                case Mod_Player_Base.EXTRA_POWER:
                    this.extraPower = _arg2;
                    break;
                case Mod_Player_Base.MAX_EXTRA_POWER:
                    this.maxExtraPower = _arg2;
                    break;
                case Mod_Player_Base.ONLINE_GIFT:
                    _local3 = (new Date().getTime() / 1000);
                    this.oldDatas[_arg1] = this.onlineGiftTime;
                    this.onlineGiftTime = (_arg2 + _local3);
                    break;
                case Mod_Player_Base.GET_ONLINE_GIFT:
                    this.oldDatas[_arg1] = this.isGetOnlineGift;
                    this.isGetOnlineGift = _arg2;
                    break;
                case Mod_Player_Base.VIP_LEVEL:
                    if (URI.vipHidden == false){
                        this.oldDatas[_arg1] = this.vipLevel;
                        this.vipLevel = _arg2;
                        VIPType.level = this.vipLevel;
                    };
                    break;
                case Mod_Player_Base.PLAYER_DAY_QUEST:
                    this.oldDatas[_arg1] = this.dayQuestState;
                    this.dayQuestState = _arg2;
                    break;
                case Mod_Player_Base.FINISH_DAY_QUEST:
                    this.oldDatas[_arg1] = this.finishDayQuest;
                    this.finishDayQuest = _arg2;
                    break;
                case Mod_Player_Base.CAN_INCENSE_COUNT:
                    this.oldDatas[_arg1] = this.canIncenseCount;
                    this.canIncenseCount = _arg2;
                    break;
                case Mod_Player_Base.PLAYER_SKILL:
                    this.oldDatas[_arg1] = this.skill;
                    this.skillChange = (_arg2 - this.skill);
                    this.skill = _arg2;
                    break;
                case Mod_Player_Base.MAX_MISSION_LOCK:
                    this.missionKey = _arg2;
                    MissionType.lock = _arg2;
                    break;
                case Mod_Player_Base.STATE_POINT:
                    this.oldDatas[_arg1] = this.statePoint;
                    this.statePoint = _arg2;
                    break;
                case Mod_Player_Base.QUEST_GIFT_BAG:
                    this.giftItemId = _arg2;
                    break;
            };
        }
        private function format_get_player_function(_arg1:Array):Array{
            var _local3:String;
            var _local4:Object;
            _arg1 = _arg1[0];
            var _local2:Array = [];
            for (_local3 in _arg1) {
                _local4 = {};
                oObject.list(_arg1[_local3], _local4, ["id", "isPlayed"]);
                _local2.push(_local4);
            };
            return (_local2);
        }
        private function format_sign_play_player_function(_arg1:Array):Array{
            return ([]);
        }
        public function practice_notify(_arg1:Array):void{
            var _local3:PlayerInfo;
            var _local2:Object = {
                notify_type:_arg1[0],
                data:_arg1[1]
            };
            if (_arg1[0] == Mod_Player_Base.UPDATE_PRACTICE){
                if (_arg1[1] > 0){
                    this.playerInfo.practice = Mod_Town_Base.ON_PRACTICE;
                    this.playerInfo.practiceExp = (this.playerInfo.practiceExp + _arg1[1]);
                    this.practiceChangeList.push(this.playerInfo);
                };
            } else {
                _local3 = _data.town.getPlayerInfo(_arg1[1]);
                this.practiceChangeList.push(_local3);
                if (_arg1[0] == Mod_Player_Base.START_PRACTICE){
                    _local3.practice = Mod_Town_Base.ON_PRACTICE;
                } else {
                    if (_arg1[0] == Mod_Player_Base.FINISHED_PRACTICE){
                        _local3.practice = Mod_Town_Base.FINISHED_PRACTICE;
                    } else {
                        _local3.practice = Mod_Town_Base.OFF_PRACTICE;
                    };
                };
            };
        }
        public function get_practice_data(_arg1:Array):void{
            this.playerInfo.practiceTime = (getTimer() + (_arg1[2] * 1000));
            this.playerInfo.practiceWar = _arg1[3];
            this.playerInfo.practiceExp = _arg1[4];
            this.playerInfo.practiceSpeedNum = _arg1[5];
            this.playerInfo.practiceExpOne = _arg1[6];
        }
        public function get_player_war_cd_time(_arg1:Array):void{
            this.warCdTime = _arg1[0];
        }
        public function get_game_assistant_info(_arg1:Array):void{
            var _local3:Array;
            var _local4:Object;
            this.getGameAssistantInfo = {};
            oObject.list(_arg1, this.getGameAssistantInfo, ["sports_rank", "combat", "fame", "skill", "role_number", "max_role_number", "day_quest_number", "day_quest_finish", "buy_power_chance", "buy_power_value", "buy_power_ingot", "ingot_rune_chance", "camp_salary", "is_get_camp_salary", "free_fate_chance", "incense_chance", "medical_number", "next_medical_time", "medical_item_id", "super_sports_chance", "super_sports_cd_time", "takebible_chance", "takebible_arrival_remain", "send_flower_chance", "free_reset_chance", "coin_tree_chance", "buy_coin_tree_count_chance", "achievement_points", "state_point", "roll_cake_count", "worship_mars_times", "buy_fate_npc_times"]);
            this.getGameAssistantInfo["medical_item_name"] = ItemType.getName(this.getGameAssistantInfo["medical_item_id"]);
            var _local2:Array = [];
            for each (_local3 in (_arg1[(_arg1.length - 1)] as Array)) {
                _local4 = {};
                oObject.list(_local3, _local4, ["back_times_type", "ingot", "is_can_back"]);
                _local4["is_can_back"] = ((_local4["is_can_back"] == 0)) ? true : false;
                _local2.push(_local4);
            };
            this.getGameAssistantInfo["back_times_list"] = _local2;
        }
        public function back_times(_arg1:Array):void{
            oObject.list(_arg1, this.backTimesResult, ["result", "back_times_type"]);
        }
        public function send_ingot_receive_show_vip(_arg1:Array):void{
            this.isSendIngotReceiveShowVip = (_arg1[0] == Mod_Player_Base.YES);
        }
        public function removeNickNameSuffix(_arg1:String):String{
            return (_arg1.replace(new RegExp((URI.nickNameSuffix(true) + "$")), ""));
        }

    }
}//package com.datas 
