//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.datas.*;
    import com.assist.view.info.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class PlayerController extends com.controllers.Base {

        public var ownData:PlayerData;
        public var isEnterHeroMission:Boolean = false;
        private var _f:int = 0;
        private var _s:int = 0;
        private var _fStr:String = "";
        private var _sStr:String = "";

        public function get factionId():int{
            return (this.ownData.playerInfo.factionId);
        }
        public function get factionName():String{
            return (this.ownData.playerInfo.factionName);
        }
        public function get logined():int{
            return (this.ownData.logined);
        }
        public function get playerInfo():PlayerInfo{
            return (this.ownData.playerInfo);
        }
        public function get playerId():int{
            return (this.ownData.playerId);
        }
        public function get isMinorAccount():int{
            return (this.ownData.isMinorAccount);
        }
        public function get enableTime():int{
            return (this.ownData.enableTime);
        }
        public function get createdRole():int{
            return (this.ownData.createdRole);
        }
        public function get nickname():String{
            return (this.ownData.nickname);
        }
        public function get originNickName():String{
            return (this.ownData.originNickName);
        }
        public function get practiceChangeList():Array{
            return (this.ownData.practiceChangeList);
        }
        public function set practiceChangeList(_arg1:Array):void{
            this.ownData.practiceChangeList = _arg1;
        }
        public function get buyPower():Object{
            var _local1:Array = this.ownData.buyPower;
            var _local2:Object = {};
            _local2.buyNum = _local1[0];
            _local2.buyIngot = _local1[1];
            _local2.msg = _local1[2];
            _local2.recoveryPower = _local1[3];
            this.buyPowerInfo(_local2);
            return (_local2);
        }
        public function get buyPowerData():Object{
            var _local1:Array = this.ownData.buyPowerData;
            var _local2:Object = {};
            _local2.buyNum = _local1[0];
            _local2.buyIngot = _local1[1];
            _local2.recoveryPower = _local1[2];
            this.buyPowerInfo(_local2);
            return (_local2);
        }
        private function buyPowerInfo(_arg1:Object):void{
            if (_arg1.buyNum == -1){
                _arg1.buyTimes = PlayerControllerLang.NoLimit;
            } else {
                _arg1.buyTimes = _arg1.buyNum;
            };
            if (_arg1.buyIngot <= 0){
                _arg1.info = PlayerControllerLang.CantBuyPower;
                return;
            };
            if (_data.player.ingot >= _arg1.buyIngot){
                if (_arg1.buyNum == 0){
                    _arg1.info = PlayerControllerLang.CantBuyPower;
                } else {
                    _arg1.info = Lang.sprintf(PlayerControllerLang.RecoveryPower, _arg1.recoveryPower, _arg1.buyIngot);
                };
            } else {
                _arg1.info = PlayerControllerLang.NoIngotBuyPower;
            };
        }
        public function setNewMapId(_arg1:int):void{
            _data.player.bossMapId = 0;
            _data.player.mapId = _arg1;
            var _local2:String = TownType.getSign(_arg1);
            if (_local2 == TownType.JiHuiSuo){
                _data.player.jihuisuoId = _arg1;
            } else {
                if ((((((_local2 == TownType.BossChiYanShou)) || ((_local2 == TownType.BossQingTianMu)))) || ((_local2 == TownType.BossDaoBaTu)))){
                    _data.player.bossMapId = _arg1;
                } else {
                    if (_local2 == TownType.BaiHuFactionWar){
                    } else {
                        _data.player.jihuisuoId = 0;
                        _data.player.townMapId = _arg1;
                    };
                };
            };
        }
        public function get townMapId():int{
            return (this.ownData.townMapId);
        }
        public function get mapId():int{
            return (this.ownData.mapId);
        }
        public function get bossMapId():int{
            return (this.ownData.bossMapId);
        }
        public function get jihuisuoId():int{
            return (this.ownData.jihuisuoId);
        }
        public function get mounts():int{
            return (this.ownData.mounts);
        }
        public function get mainRoleId():int{
            return (this.ownData.mainRoleId);
        }
        public function get mainPlayerRoleId():int{
            return (this.ownData.mainPlayerRoleId);
        }
        public function get campId():int{
            return (this.ownData.campId);
        }
        public function set campId(_arg1:int):void{
            this.ownData.campId = _arg1;
            TownType.campSign = FactionType.campSign(_arg1);
        }
        public function get townKey():int{
            return (this.ownData.townKey);
        }
        public function get updatePlayerDataForTownList():Array{
            return (this.ownData.updatePlayerDataForTownList);
        }
        public function get functionList():Array{
            return (this.ownData.functionList);
        }
        public function get campResult():int{
            return (this.ownData.campResult);
        }
        public function get isTester():Boolean{
            return (((((((this.isCommonTester) || (this.isAdvancedTester))) || (this.isGM))) || (this.isTrainer)));
        }
        public function get isCommonTester():Boolean{
            return (PlayerType.isCommonTester(this.ownData.tester));
        }
        public function get isAdvancedTester():Boolean{
            return (PlayerType.isAdvancedTester(this.ownData.tester));
        }
        public function get isGM():Boolean{
            return (PlayerType.isGM(this.ownData.tester));
        }
        public function get isTrainer():Boolean{
            return (PlayerType.isTrainer(this.ownData.tester));
        }
        public function get lastPlayVersion():int{
            return (this.ownData.lastPlayVersion);
        }
        public function get level():int{
            return (this.ownData.level);
        }
        public function get ingot():int{
            return ((VIPType.enabled) ? this.ownData.ingot : 0);
        }
        public function get ingotString():String{
            var _local1:int = (VIPType.enabled) ? this.ownData.ingot : 0;
            if (_local1 > 99999){
                return ((int((_local1 / 10000)) + PlayerControllerLang.Wang));
            };
            return ((_local1 + ""));
        }
        public function get ingotChange():int{
            return (this.ownData.ingotChange);
        }
        public function get coins():Number{
            return (this.ownData.coins);
        }
        public function get coinsString():String{
            if (this.coins > 99999){
                return ((int((this.coins / 10000)) + PlayerControllerLang.Wang));
            };
            return ((this.coins + ""));
        }
        public function get coinChange():Number{
            return (this.ownData.coinChange);
        }
        public function get health():int{
            return (this.ownData.health);
        }
        public function get maxHealth():int{
            return (this.ownData.maxHealth);
        }
        public function get power():int{
            return (this.ownData.power);
        }
        public function get experience():Number{
            return (this.ownData.experience);
        }
        public function get maxExperience():Number{
            return (this.ownData.maxExperience);
        }
        public function get vipLevel():int{
            return (this.ownData.vipLevel);
        }
        public function get avatar():int{
            return (this.ownData.avatar);
        }
        public function get avatarCD():int{
            return (this.ownData.avatarCD);
        }
        public function get packNum():int{
            return (this.ownData.packNum);
        }
        public function get upLevelRoles():Array{
            return (this.ownData.upRoleList);
        }
        public function get functionLock():int{
            return (this.ownData.functionLock);
        }
        public function get hasNewFunction():Boolean{
            return (this.ownData.hasNewFunction);
        }
        public function set hasNewFunction(_arg1:Boolean):void{
            this.ownData.hasNewFunction = _arg1;
        }
        public function get hasQuestState():Boolean{
            return (this.ownData.hasQuestState);
        }
        public function set hasQuestState(_arg1:Boolean):void{
            this.ownData.hasQuestState = _arg1;
        }
        public function set campSalaryEnabled(_arg1:Boolean):void{
            this.ownData.campSalaryEnabled = _arg1;
        }
        public function get campSalaryEnabled():Boolean{
            return (this.ownData.campSalaryEnabled);
        }
        public function get campSalaryCoin():int{
            return (this.ownData.campSalaryCoin);
        }
        public function get campSalaryStatus():int{
            return (this.ownData.campSalaryStatus);
        }
        public function get getPlayerCampSalary():int{
            return (this.ownData.getPlayerCampSalary);
        }
        public function get fame():int{
            return (this.ownData.fame);
        }
        public function get fameChange():int{
            return (this.ownData.fameChange);
        }
        public function get fameLevel():int{
            return (this.ownData.fameLevel);
        }
        public function get missionKey():int{
            return (this.ownData.missionKey);
        }
        public function get otherPlayerLv():int{
            return (this.ownData.otherPlayerLv);
        }
        public function get extraPower():int{
            return (this.ownData.extraPower);
        }
        public function get maxExtraPower():int{
            return (this.ownData.maxExtraPower);
        }
        public function get dayQuestState():int{
            return (this.ownData.dayQuestState);
        }
        public function get finishDayQuest():int{
            return (this.ownData.finishDayQuest);
        }
        public function get canIncenseCount():int{
            return (this.ownData.canIncenseCount);
        }
        public function get skill():int{
            return (this.ownData.skill);
        }
        public function get skillChange():int{
            return (this.ownData.skillChange);
        }
        public function get getGameAssistantInfo():Object{
            return (this.ownData.getGameAssistantInfo);
        }
        public function get backTimesResult():Object{
            return (this.ownData.backTimesResult);
        }
        public function get isSendIngotReceiveShowVip():Boolean{
            return (this.ownData.isSendIngotReceiveShowVip);
        }
        public function get playerInfoContrastData():Object{
            return (this.ownData.playerInfoContrastData);
        }
        public function get statePoint():int{
            return (this.ownData.statePoint);
        }
        public function get giftItemId():int{
            return (this.ownData.giftItemId);
        }
        public function set giftItemId(_arg1:int):void{
            this.ownData.giftItemId = _arg1;
        }
        public function isChanged(_arg1:int):Boolean{
            var _local2:int;
            switch (_arg1){
                case Mod_Player_Base.PLAYER_LEVEL:
                    _local2 = this.level;
                    break;
                case Mod_Player_Base.PLAYER_INGOT:
                    _local2 = this.ingot;
                    break;
                case Mod_Player_Base.PLAYER_COINS:
                    _local2 = this.coins;
                    break;
                case Mod_Player_Base.PLAYER_HEALTH:
                    _local2 = this.health;
                    break;
                case Mod_Player_Base.PLAYER_MAX_HEALTH:
                    _local2 = this.maxHealth;
                    break;
                case Mod_Player_Base.PLAYER_POWER:
                    _local2 = this.power;
                    break;
                case Mod_Player_Base.PLAYER_EXPERIENCE:
                    _local2 = this.experience;
                    break;
                case Mod_Player_Base.PLAYER_MAX_EXPERIENCE:
                    _local2 = this.maxExperience;
                    break;
                case Mod_Player_Base.PLAYER_TRANSPORT:
                    _local2 = this.mounts;
                    break;
                case Mod_Player_Base.PLAYER_AVATAR:
                    _local2 = this.avatar;
                    break;
                case Mod_Player_Base.PLAYER_AVATAR_CD:
                    _local2 = this.avatarCD;
                    break;
                case Mod_Player_Base.PLAYER_PACK_EMPTY_NUM:
                    _local2 = this.packNum;
                    break;
                case Mod_Player_Base.GET_ONLINE_GIFT:
                    _local2 = this.ownData.isGetOnlineGift;
                    break;
                case Mod_Player_Base.ONLINE_GIFT:
                    _local2 = this.ownData.onlineGiftTime;
                    break;
                case Mod_Player_Base.VIP_LEVEL:
                    _local2 = this.ownData.vipLevel;
                    break;
                case Mod_Player_Base.CAMP_SALARY:
                    _local2 = this.ownData.campSalaryCoin;
                    break;
                case Mod_Player_Base.PLAYER_DAY_QUEST:
                    _local2 = this.ownData.dayQuestState;
                    break;
                case Mod_Player_Base.FINISH_DAY_QUEST:
                    _local2 = this.ownData.finishDayQuest;
                    break;
                case Mod_Player_Base.CAN_INCENSE_COUNT:
                    _local2 = this.ownData.canIncenseCount;
                    break;
                case Mod_Player_Base.PLAYER_SKILL:
                    _local2 = this.ownData.skill;
                    break;
                case Mod_Player_Base.FAME:
                    _local2 = this.ownData.fame;
                    break;
                case Mod_Player_Base.PLAYER_TOWN_KEY:
                    _local2 = this.ownData.townKey;
                    break;
                case Mod_Player_Base.STATE_POINT:
                    _local2 = this.ownData.statePoint;
                    break;
            };
            var _local3:Boolean;
            if (((!((this.ownData.oldDatas[_arg1] == null))) && (!((this.ownData.oldDatas[_arg1] == _local2))))){
                _local3 = true;
                this.ownData.oldDatas[_arg1] = _local2;
            };
            return (_local3);
        }
        public function get afficheList():Array{
            var _local1:Array = this.ownData.afficheList;
            var _local2:Array = this.renderAfficheList(_local1[0]);
            return (_local2);
        }
        public function get warningAffiche():String{
            var _local1:Array = this.ownData.warningAffiche;
            var _local2:String = _local1[0];
            return (_local2);
        }
        private function renderAfficheList(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.id = _arg1[_local4][0];
                _local5.html = _arg1[_local4][1];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get hasWarCdTime():Object{
            var _local1:Object = {};
            _local1.cdTimer = this.renderTime(this.ownData.warCdTime);
            _local1.hasWarTime = (this.ownData.warCdTime > 0);
            return (_local1);
        }
        private function renderTime(_arg1:int):String{
            var _local2:int = _arg1;
            if ((_local2 / 60) > 0){
                this._f = Math.floor((_local2 / 60));
                _local2 = (_local2 - (this._f * 60));
            };
            this._s = _local2;
            this._fStr = (this._f + "");
            this._sStr = (this._s + "");
            if (this._f < 10){
                this._fStr = ("0" + this._f);
            };
            if (this._s < 10){
                this._sStr = ("0" + this._s);
            };
            var _local3:String = ((this._fStr + ":") + this._sStr);
            return (_local3);
        }
        public function get delayMessage():Array{
            return (this.ownData.delayMessage);
        }
        public function get validateIdCard():int{
            return (this.ownData.validateIdCard);
        }
        public function get againstWallowsNotify():int{
            return (this.ownData.againstWallowsNotify);
        }
        public function get againstWallowsInfo():int{
            return (this.ownData.againstWallowsInfo);
        }
        public function get onlineGiftTime():int{
            var _local1:int = (new Date().getTime() / 1000);
            return ((this.ownData.onlineGiftTime - _local1));
        }
        public function get isGetOnlineGift():int{
            return (this.ownData.isGetOnlineGift);
        }
        public function get onlineGift():Object{
            return (this.giftData(this.ownData.onlineGift));
        }
        public function get nextOnlineGift():Object{
            return (this.giftData(this.ownData.nextOnlineGift));
        }
        private function giftData(_arg1:Object):Object{
            var _local2:Object;
            for each (_local2 in _arg1["online_gift_list"]) {
                if (_local2["type"] == 5){
                    _local2["item_info"] = {
                        name:ItemType.getName(_local2["item_id"]),
                        color:ItemType.getItemColor(_local2["item_id"])
                    };
                };
            };
            return (_arg1);
        }
        public function get serverTime():int{
            var _local1:Number = (new Date().getTime() / 1000);
            return ((_local1 - this.ownData.diffServerTime));
        }
        public function get diffServerTime():int{
            return (this.ownData.diffServerTime);
        }
        public function get isStartAccount():Boolean{
            return ((this.ownData.startAccount == 1));
        }
        public function get inSelfCampTown():Boolean{
            var _local1:String = FactionType.campSign(this.campId);
            var _local2:String = TownType.getSign(this.mapId);
            var _local3:int = FactionType.campId(_local2);
            return ((_local1 == _local2));
        }
        public function get inSelfTown():Boolean{
            var _local1:String = FactionType.campSign(this.campId);
            var _local2:String = TownType.getSign(this.mapId);
            var _local3:int = FactionType.campId(_local2);
            return ((((_local3 == 0)) || ((_local1 == _local2))));
        }
        public function get isCampTown():Boolean{
            var _local1:String = TownType.getSign(this.mapId);
            return ((FactionType.campId(_local1) > 0));
        }
        public function removeNickNameSuffix(_arg1:String):String{
            return (this.ownData.removeNickNameSuffix(_arg1));
        }

    }
}//package com.controllers 
