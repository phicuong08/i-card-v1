//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.utils.*;
    import ICard.datas.*;
    import ICard.assist.*;
    import ICard.assist.data.*;
    import ICard.protocols.*;

    public class Data extends DataBase implements IData {

        private var _callbackList:Object;
        private var _ignoreList:Object;

        public function Data():void{
            this._callbackList = {};
            this._ignoreList = {};
            super();
        }
        public function get sample():SampleData{
            return ((createObject(SampleData) as SampleData));
        }
        public function get player():PlayerData{
            return ((createObject(PlayerData) as PlayerData));
        }
        public function get town():TownData{
            return ((createObject(TownData) as TownData));
        }
        public function get quest():QuestData{
            return ((createObject(QuestData) as QuestData));
        }
        public function get mission():MissionData{
            return ((createObject(MissionData) as MissionData));
        }
        public function get friend():FriendData{
            return ((createObject(FriendData) as FriendData));
        }
        public function get deploy():DeployData{
            return ((createObject(DeployData) as DeployData));
        }
        public function get dujie():DuJieData{
            return ((createObject(DuJieData) as DuJieData));
        }
        public function get heroMission():HeroMissionData{
            return ((createObject(HeroMissionData) as HeroMissionData));
        }
        public function get item():ItemData{
            return ((createObject(ItemData) as ItemData));
        }
        public function get rolemsg():RoleMsgData{
            return ((createObject(RoleMsgData) as RoleMsgData));
        }
        public function get rollCake():RollCakeData{
            return ((createObject(RollCakeData) as RollCakeData));
        }
        public function get research():ResearchData{
            return ((createObject(ResearchData) as ResearchData));
        }
        public function get upgrade():UpgradeData{
            return ((createObject(UpgradeData) as UpgradeData));
        }
        public function get chat():ChatData{
            return ((createObject(ChatData) as ChatData));
        }
        public function get partners():PartnersData{
            return ((createObject(PartnersData) as PartnersData));
        }
        public function get multiMission():MultiMissionData{
            return ((createObject(MultiMissionData) as MultiMissionData));
        }
        public function get farm():FarmData{
            return ((createObject(FarmData) as FarmData));
        }
        public function get dailyQuest():DailyQuestData{
            return ((createObject(DailyQuestData) as DailyQuestData));
        }
        public function get faction():FactionData{
            return ((createObject(FactionData) as FactionData));
        }
        public function get factionWarMap():FactionWarMapData{
            return ((createObject(FactionWarMapData) as FactionWarMapData));
        }
        public function get rune():RuneData{
            return ((createObject(RuneData) as RuneData));
        }
        public function get pkWar():PKWarData{
            return ((createObject(PKWarData) as PKWarData));
        }
        public function get notify():NotifyData{
            return ((createObject(NotifyData) as NotifyData));
        }
        public function get travelEvent():TravelEventData{
            return ((createObject(TravelEventData) as TravelEventData));
        }
        public function get worldBoss():WorldBossData{
            return ((createObject(WorldBossData) as WorldBossData));
        }
        public function get fate():FateData{
            return ((createObject(FateData) as FateData));
        }
        public function get campWar():CampWarData{
            return ((createObject(CampWarData) as CampWarData));
        }
        public function get heroesWar():HeroesWarData{
            return ((createObject(HeroesWarData) as HeroesWarData));
        }
        public function get missionPractice():MissionPracticeData{
            return ((createObject(MissionPracticeData) as MissionPracticeData));
        }
        public function get vip():VipData{
            return ((createObject(VipData) as VipData));
        }
        public function get SuperSport():SuperSportData{
            return ((createObject(SuperSportData) as SuperSportData));
        }
        public function get luckyShop():LuckyShopData{
            return ((createObject(LuckyShopData) as LuckyShopData));
        }
        public function get takeBible():TakeBibleData{
            return ((createObject(TakeBibleData) as TakeBibleData));
        }
        public function get sendFlower():SendFlowerData{
            return ((createObject(SendFlowerData) as SendFlowerData));
        }
        public function get sealSoul():SealSoulData{
            return ((createObject(SealSoulData) as SealSoulData));
        }
        public function get tower():TowerData{
            return ((createObject(TowerData) as TowerData));
        }
        public function get inherit():InheritData{
            return ((createObject(InheritData) as InheritData));
        }
        public function get serverWar():ServerWarData{
            return ((createObject(ServerWarData) as ServerWarData));
        }
        public function get achievement():AchievementData{
            return ((createObject(AchievementData) as AchievementData));
        }
        public function get getPeach():GetPeachData{
            return ((createObject(GetPeachData) as GetPeachData));
        }
        public function get worshipMars():WorshipMarsData{
            return ((createObject(WorshipMarsData) as WorshipMarsData));
        }
        public function get redEnvelopes():RedEnvelopesData{
            return ((createObject(RedEnvelopesData) as RedEnvelopesData));
        }
        public function get zodiac():ZodiacData{
            return ((createObject(ZodiacData) as ZodiacData));
        }
        public function get consumeAlertSetting():ConsumeAlertSettingData{
            return ((createObject(ConsumeAlertSettingData) as ConsumeAlertSettingData));
        }
        public function get practice():PracticeData{
            return ((createObject(PracticeData) as PracticeData));
        }
        override public function init(_arg1:View, _arg2:Controller):void{
            super.init(_arg1, _arg2);
            Mod_Item.register(this);
            Mod_Mission.register(this);
            Mod_Player.register(this);
            Mod_Quest.register(this);
            Mod_Town.register(this);
            Mod_Role.register(this);
            Mod_Research.register(this);
            Mod_Chat.register(this);
            Mod_Partners.register(this);
            Mod_Friend.register(this);
            Mod_Deploy.register(this);
            Mod_Faction.register(this);
            Mod_Farm.register(this);
            Mod_MultiMission.register(this);
            Mod_Rune.register(this);
            Mod_PK.register(this);
            Mod_Notify.register(this);
            Mod_TravelEvent.register(this);
            Mod_Fate.register(this);
            Mod_CampWar.register(this);
            Mod_HeroesWar.register(this);
            Mod_WorldBoss.register(this);
            Mod_MissionPractice.register(this);
            Mod_WarReport.register(this);
            Mod_Vip.register(this);
            Mod_SuperSport.register(this);
            Mod_FactionWar.register(this);
            Mod_TakeBible.register(this);
            Mod_SendFlower.register(this);
            Mod_SealSoul.register(this);
            Mod_Tower.register(this);
            Mod_Inherit.register(this);
            Mod_HeroMission.register(this);
            Mod_ServerWar.register(this);
            Mod_DuJie.register(this);
            Mod_RollCake.register(this);
            Mod_Achievement.register(this);
            Mod_GetPeach.register(this);
            Mod_WorshipMars.register(this);
            Mod_RedEnvelopes.register(this);
            Mod_Zodiac.register(this);
            Mod_Practice.register(this);
            Helper.backtrace("connecting", URI.domain, URI.serverPort);
            this.connect(((URI.ip) || (URI.domain)), ((URI.port) || (URI.serverPort)));
        }
        override protected function parseSocketData(_arg1:ByteArray):void{
            var modId:* = 0;
            var funId:* = 0;
            var id:* = null;
            var p:* = null;
            var p1:* = null;
            var buffer:* = _arg1;
            modId = buffer.readUnsignedByte();
            funId = buffer.readUnsignedByte();
            if ((((modId == 120)) && ((funId == 156)))){
                buffer.position = 0;
                buffer.uncompress();
                modId = buffer.readUnsignedByte();
                funId = buffer.readUnsignedByte();
            };
            var term:* = Protocol.concat(modId, funId);
            var callback:* = this._callbackList[term];
            if (this._ignoreList[term]){
                Helper.recordInteraction(Helper.RESPONSE, modId, funId, [buffer]);
                callback(buffer);
                dispatch(modId, funId);
                return;
            };
            var result:* = [];
            for (id in Mod.Modules) {
                if (parseInt(id) == modId){
                    try {
                        result = this.analyze(Mod.Modules[id], modId, funId, buffer);
                    } catch(e) {
                        _view.alert.confirm(((((("[" + modId) + ",") + funId) + "]") + e));
                        p = Protocol.lookupProtocol(modId, funId);
                        Helper.error("[response]接口不匹配：", Protocol.getProtocolDescription(p["request"]), "\n", e);
                        return;
                    };
                };
            };
            Helper.recordInteraction(Helper.RESPONSE, modId, funId, result);
            if ((callback is Function)){
                callback(result);
            } else {
                p1 = Protocol.lookupProtocol(modId, funId);
                throw (new Error(((("\n\t" + "没有注册接口回调方法：") + Protocol.getProtocolDescription(p1["request"])) + "\n\t------")));
            };
            dispatch(modId, funId);
            removeNotAllow(modId, funId);
        }
        public function registerDataCallback(_arg1:Object, _arg2:Function, _arg3:Boolean=false):void{
            var _local4:uint = _arg1["module"];
            var _local5:uint = _arg1["action"];
            var _local6:String = Protocol.concat(_local4, _local5);
            if (this._callbackList[_local6]){
                throw (new Error("指定的协议重复注册回调方法！"));
            };
            this._callbackList[_local6] = _arg2;
            if (_arg3){
                this._ignoreList[_local6] = _arg3;
            };
        }
        private function analyze(_arg1:Class, _arg2:uint, _arg3:uint, _arg4:ByteArray):Array{
            var _local9:Object;
            var _local5:Array = [];
            var _local6:Array = _arg1["Actions"];
            var _local7:int = _local6.length;
            var _local8:int;
            while (_local8 < _local7) {
                _local9 = _arg1[_local6[_local8]];
                if (_local9["action"] == _arg3){
                    _local5 = Protocol.analyze(_arg4, _local9["response"]);
                    break;
                };
                _local8++;
            };
            return (_local5);
        }

    }
}//package com 
