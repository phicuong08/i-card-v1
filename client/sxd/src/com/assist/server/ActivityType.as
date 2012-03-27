//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.lang.client.com.assist.server.*;

    public class ActivityType {

        public static const FactionAll:String = "FactionAll";
        public static const FactionBlessing:String = "FactionBlessing";
        public static const FactionSeal:String = "FactionSeal";
        public static const FactionWar:String = "FactionWar";
        public static const FactionEat:String = "FactionEat";
        public static const FactionBoss:String = "FactionBoss";
        public static const BossDaoBaTu:String = "BossDaoBaTu";
        public static const FactionRollCake:String = "FactionRollCake";
        public static const HeroesWar:String = "HeroesWar";
        public static const RedEnvelopes:String = "RedEnvelopes";
        public static const GameHelper:String = "GameHelper";
        private static const BossBaiZe:Object = {
            type:FunctionType.WorldBoss,
            name:ActivityTypeLang.BossName,
            textTile:ActivityTypeLang.BossBaiZeTextTile,
            info:ActivityTypeLang.BossBaiZeInfo,
            openTimer:"16:00",
            timer:16
        };
        private static const BossQingTianMu:Object = {
            type:FunctionType.WorldBoss,
            name:ActivityTypeLang.BossName,
            textTile:ActivityTypeLang.BossQingTianMuTile,
            info:ActivityTypeLang.BossQingTianMuInfo,
            openTimer:"16:00",
            timer:16
        };
        private static const BossChiYanShou:Object = {
            type:FunctionType.WorldBoss,
            name:ActivityTypeLang.BossName,
            textTile:ActivityTypeLang.BossChiYanShouTile,
            info:ActivityTypeLang.BossChiYanShouInfo,
            openTimer:"11:00",
            timer:11
        };
        private static const BossQingLong:Object = {
            type:FunctionType.WorldBoss,
            name:ActivityTypeLang.BossName,
            textTile:ActivityTypeLang.BossQingLongTile,
            info:ActivityTypeLang.BossQingLongInfo,
            openTimer:"23:00",
            timer:23
        };
        private static const CampWar:Object = {
            type:FunctionType.CampWar,
            name:ActivityTypeLang.CampWarTile,
            textTile:ActivityTypeLang.CampWarTile,
            info:ActivityTypeLang.CampWarInfo,
            openTimer:"",
            timer:0
        };
        private static const HeroesWarData:Object = {
            type:HeroesWar,
            name:ActivityTypeLang.HeroesWarTile,
            textTile:ActivityTypeLang.HeroesWarTile,
            info:ActivityTypeLang.HeroesWarInfo,
            openTimer:"",
            timer:0
        };
        private static const MultiMission:Object = {
            type:FunctionType.MultiMission,
            name:ActivityTypeLang.MultiMissionTile,
            textTile:ActivityTypeLang.MultiMissionTile,
            info:ActivityTypeLang.MultiMissionInfo,
            openTimer:"",
            timer:0
        };
        private static const FactionBlessingData:Object = {
            type:FactionBlessing,
            name:ActivityTypeLang.FactionBlessingTile,
            textTile:ActivityTypeLang.FactionBlessingTile,
            explain:ActivityTypeLang.FactionBlessingExplain,
            info:ActivityTypeLang.FactionBlessingInfo,
            factionInfo:ActivityTypeLang.FactionBlessingFactionInfo,
            awardType:ActivityTypeLang.FactionBlessingAwardType,
            openLevel:1
        };
        private static const FactionWarData:Object = {
            type:FactionWar,
            name:ActivityTypeLang.FactionWarTile,
            textTile:ActivityTypeLang.FactionWarTile,
            explain:ActivityTypeLang.FactionWarExplain,
            info:ActivityTypeLang.FactionWarInfo,
            factionInfo:ActivityTypeLang.FactionWarInfo,
            awardType:ActivityTypeLang.FactionWarExplain,
            openLevel:2
        };
        private static const FactionSealData:Object = {
            type:FactionSeal,
            name:ActivityTypeLang.FactionSealTile,
            textTile:ActivityTypeLang.FactionSealTile,
            explain:ActivityTypeLang.FactionSealExplain,
            info:ActivityTypeLang.FactionSealInfo,
            factionInfo:ActivityTypeLang.FactionSealFactionInfo,
            awardType:ActivityTypeLang.FactionSealAwardType,
            openLevel:3
        };
        private static const BossDaoBaTuData:Object = {
            type:BossDaoBaTu,
            name:ActivityTypeLang.BossDaoBaName,
            textTile:ActivityTypeLang.BossDaoBaTuTile,
            explain:ActivityTypeLang.BossDaoBaTuExplain,
            info:ActivityTypeLang.BossDaoBaTuInfo,
            factionInfo:ActivityTypeLang.BossDaoBaTuFactionInfo,
            awardType:ActivityTypeLang.BossDaoBaTuAwardType,
            openLevel:4
        };
        private static const FactionEatData:Object = {
            type:FactionEat,
            name:ActivityTypeLang.FactionEatName,
            textTile:ActivityTypeLang.FactionEatTile,
            explain:ActivityTypeLang.FactionEatExplain,
            info:ActivityTypeLang.FactionEatInfo,
            factionInfo:ActivityTypeLang.FactionEatFactionInfo,
            awardType:ActivityTypeLang.FactionEatAwardType,
            openLevel:5
        };
        private static const FactionRollCakeData:Object = {
            type:FactionRollCake,
            name:ActivityTypeLang.FactionRollCakeName,
            textTile:ActivityTypeLang.FactionRollCakeTile,
            explain:ActivityTypeLang.FactionRollCakeExplain,
            info:ActivityTypeLang.FactionRollCakeInfo,
            factionInfo:ActivityTypeLang.FactionRollCakeFactionInfo,
            awardType:ActivityTypeLang.FactionRollCakeAwardType,
            openLevel:5
        };
        private static const activityData:Object = {
            BossBaiZe:BossBaiZe,
            BossQingTianMu:BossQingTianMu,
            BossChiYanShou:BossChiYanShou,
            BossQingLong:BossQingLong,
            CampWar:CampWar,
            HeroesWar:HeroesWarData,
            MultiMission:MultiMission,
            FactionBlessing:FactionBlessingData,
            FactionWar:FactionWarData,
            FactionSeal:FactionSealData,
            BossDaoBaTu:BossDaoBaTuData,
            FactionEat:FactionEatData,
            FactionRollCake:FactionRollCakeData
        };
        public static const factionActivityList:Array = ["FactionBlessing", "FactionWar", "FactionSeal", "BossDaoBaTu", "FactionEat", "FactionRollCake"];
        public static const factionWindowList:Array = ["FactionBlessing", "FactionSeal", "FactionWar", "FactionEat", "FactionRollCake", "BossDaoBaTu"];
        public static const GiftStr:String = "GiftType";
        public static const Gift1:String = "GiftType1";
        public static const Gift2:String = "GiftType2";
        public static const Gift3:String = "GiftType3";
        public static const Gift4:String = "GiftType4";
        public static const Gift5:String = "GiftType5";
        public static const Gift6:String = "GiftType6";
        public static const Gift7:String = "GiftType7";
        public static const Gift8:String = "GiftType8";
        public static const Gift9:String = "GiftType9";
        public static const Gift10:String = "GiftType10";
        public static const Gift11:String = "GiftType11";
        public static const Gift12:String = "GiftType12";
        public static const Gift13:String = "GiftType13";
        public static const Gift14:String = "GiftType14";
        public static const Gift15:String = "GiftType15";
        public static const Gift16:String = "GiftType16";
        public static const Gift17:String = "GiftType17";
        public static const Gift18:String = "GiftType18";
        public static const Gift19:String = "GiftType19";
        public static const Gift20:String = "GiftType20";
        public static const FactionWarInto:String = "FactionWarInto";
        public static const FactionWarSignUp:String = "FactionWarSignUp";
        public static const FactionWarSee:String = "FactionWarSee";
        public static const FactionWarGift:String = "FactionWarGift";
        public static const ServerWar:String = "ServerWar";
        public static const ActivityFunction:String = "ActivityFunction";
        public static const ActivityAward:String = "ActivityAward";
        public static const ActivitysList:Array = [ActivityFunction, ActivityAward];
        private static const _activityBoxList:Array = [{
            sign:FunctionType.SuperSport,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.Farm,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.HeroMission,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.TakeBible,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.Tower,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.Zodiac,
            isDisappear:0,
            type:ActivityFunction
        }, {
            sign:FunctionType.DailyQuest,
            isDisappear:1,
            type:ActivityFunction
        }, {
            sign:FunctionType.RollCake,
            isDisappear:1,
            type:ActivityFunction
        }, {
            sign:FunctionType.GetPeach,
            isDisappear:1,
            type:ActivityFunction
        }, {
            sign:FunctionType.WorshipMars,
            isDisappear:1,
            type:ActivityFunction
        }, {
            sign:FunctionType.CampSalary,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift4,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:FunctionType.SealSoul,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift10,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift5,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift6,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift11,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift12,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift2,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift3,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift13,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift14,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift15,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift16,
            isDisappear:1,
            type:ActivityAward
        }, {
            sign:Gift17,
            isDisappear:1,
            type:ActivityAward
        }];

        public static var _factionLevel:int = 0;

        public static function set FactionLevel(_arg1:int):void{
            _factionLevel = _arg1;
        }
        public static function get FactionLevel():int{
            return (_factionLevel);
        }
        public static function getTypeToSign(_arg1:String):String{
            return (((activityData[_arg1]["type"]) || ("")));
        }
        public static function getNameToSign(_arg1:String):String{
            return (((activityData[_arg1]["name"]) || ("")));
        }
        public static function getTextTileToSign(_arg1:String):String{
            return (((activityData[_arg1]["textTile"]) || ("")));
        }
        public static function getInfoToSign(_arg1:String):String{
            return (((activityData[_arg1]["info"]) || ("")));
        }
        public static function getOpenTimerToSign(_arg1:String):String{
            return (((activityData[_arg1]["openTimer"]) || ("")));
        }
        public static function getTimerToSign(_arg1:String):String{
            return (((activityData[_arg1]["timer"]) || ("")));
        }
        public static function getOpenLevelToSign(_arg1:String):int{
            return (((activityData[_arg1]["openLevel"]) || (0)));
        }
        public static function getExplainToSign(_arg1:String):String{
            return (((activityData[_arg1]["explain"]) || ("")));
        }
        public static function getAwardTypeToSign(_arg1:String):String{
            return (((activityData[_arg1]["awardType"]) || ("")));
        }
        public static function getFactionInfoToSign(_arg1:String):String{
            return (((activityData[_arg1]["factionInfo"]) || ("")));
        }
        public static function getObj(_arg1:String):Object{
            return (activityData[_arg1]);
        }
        public static function getActivityListForType(_arg1:String):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _activityBoxList.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _activityBoxList[_local4];
                if (_local5.type == _arg1){
                    _local5.lock = _local4;
                    _local2.push(_local5);
                };
                _local4++;
            };
            return (_local2);
        }
        public static function getActivityDataForSign(_arg1:String):Object{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _activityBoxList.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _activityBoxList[_local4];
                if (_local5.sign == _arg1){
                    _local5.lock = _local4;
                    return (_local5);
                };
                _local4++;
            };
            return ({});
        }
        public static function checkIsActivityBoxForSign(_arg1:String):Boolean{
            var _local4:Object;
            var _local2:int = _activityBoxList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _activityBoxList[_local3];
                if (_local4.sign == _arg1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }

    }
}//package com.assist.server 
