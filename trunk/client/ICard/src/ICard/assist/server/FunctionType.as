//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {

    public class FunctionType {

        public static const Upgrade:String = "Upgrade";
        public static const Training:String = "Training";
        public static const Deploy:String = "Deploy";
        public static const World:String = "World";
        public static const Achievement:String = "Achievement";
        public static const Medical:String = "Medical";
        public static const Research:String = "Research";
        public static const Mounts:String = "Mounts";
        public static const Friend:String = "Friend";
        public static const HorseRaces:String = "HorseRaces";
        public static const Faction:String = "Faction";
        public static const DailyQuest:String = "DailyQuest";
        public static const Farm:String = "Farm";
        public static const Sport:String = "Sport";
        public static const OfflineExp:String = "OfflineExp";
        public static const Partners:String = "Partners";
        public static const Warehouse:String = "Warehouse";
        public static const MultiMission:String = "MultiMission";
        public static const HeroMission:String = "HeroMission";
        public static const Fate:String = "Fate";
        public static const Rune:String = "Rune";
        public static const Stunt:String = "Stunt";
        public static const PK:String = "PK";
        public static const ExtraPower:String = "ExtraPower";
        public static const OnlineGift:String = "OnlineGift";
        public static const CampSalary:String = "CampSalary";
        public static const TravelEvent:String = "TravelEvent";
        public static const Practice:String = "Practice";
        public static const EquipUpgradeQueue:String = "EquipUpgradeQueue";
        public static const CampWar:String = "CampWar";
        public static const MissionPractice:String = "MissionPractice";
        public static const WorldBoss:String = "WorldBoss";
        public static const BuyPower:String = "BuyPower";
        public static const SuperSport:String = "SuperSport";
        public static const LuckyShop:String = "LuckyShop";
        public static const CoinTree:String = "CoinTree";
        public static const TakeBible:String = "TakeBible";
        public static const SendFlower:String = "SendFlower";
        public static const Tower:String = "Tower";
        public static const Inherit:String = "Inherit";
        public static const SealSoul:String = "SealSoul";
        public static const WarAttribute:String = "WarAttribute";
        public static const Robot:String = "Robot";
        public static const HeroMissionPractice:String = "HeroMissionPractice";
        public static const FirstAttcak:String = "FirstAttcak";
        public static const DuJie:String = "DuJie";
        public static const RollCake:String = "RollCake";
        public static const WorshipMars:String = "WorshipMars";
        public static const GetPeach:String = "GetPeach";
        public static const HeroesWar:String = "HeroesWar";
        public static const Zodiac:String = "Zodiac";
        public static const Body:String = "Body";
        public static const Pack:String = "Pack";
        public static const Quest:String = "Quest";
        public static const DefaultList:Array = [Body, Pack, Quest];
        public static const FullList:Array = [Body, Pack, Upgrade, Deploy, Research, Fate, SealSoul, Farm, Quest, Friend, Faction, Practice];

        private static var _List:Object = null;
        private static var _openedList:Object = {};
        private static var _playedList:Object = {};

        public static function get List():Object{
            if (_List == null){
                throw (new Error("还未赋值！"));
            };
            return (_List);
        }
        public static function set List(_arg1:Object):void{
            if (_List != null){
                throw (new Error("非法赋值"));
            };
            _List = _arg1;
        }
        public static function functionIndex(_arg1:String):int{
            var _local2:int = -1;
            var _local3:int = FullList.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (FullList[_local4] == _arg1){
                    _local2 = _local4;
                    break;
                };
                _local4++;
            };
            return (_local2);
        }
        public static function sign(_arg1:int):String{
            if (List[_arg1] == null){
                return ("");
            };
            return (List[_arg1][0]);
        }
        public static function isOpened(_arg1:String):Boolean{
            return (!((_openedList[_arg1] == null)));
        }
        public static function isPlayed(_arg1:String):Boolean{
            return (!((_playedList[_arg1] == null)));
        }
        public static function isIgnoreTip(_arg1:String):Boolean{
            return ((((((((((Partners == _arg1)) || ((OnlineGift == _arg1)))) || ((ExtraPower == _arg1)))) || ((CampSalary == _arg1)))) || ((World == _arg1))));
        }
        public static function updateOpenedList(_arg1:Array):void{
            var _local2:Object;
            var _local3:int;
            var _local4:String;
            for (_local2 in _arg1) {
                _local3 = _arg1[_local2]["id"];
                if (List[_local3] == null){
                } else {
                    _local4 = List[_local3][0];
                    _openedList[_local4] = _local3;
                    if (_arg1[_local2]["isPlayed"] == 1){
                        _playedList[_local4] = _local3;
                    };
                };
            };
        }

    }
}//package com.assist.server 
