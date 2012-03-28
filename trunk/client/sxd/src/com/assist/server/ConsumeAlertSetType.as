//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class ConsumeAlertSetType {

        private static const Data:Object = {
            1:["强化清除冷却时间", 0],
            2:["奇术清除冷却时间", 0],
            3:["招财神符批量使用", 6],
            4:["药园元宝刷新种子", 0],
            5:["药园购买满星种子", 5],
            6:["药园清除冷却时间", 0],
            7:["药园元宝购买仙露", 2],
            8:["药园元宝升级土地", 4],
            9:["药园满星批量种植", 6],
            10:["竞技场买挑战次数", 1],
            11:["竞技场清冷却时间", 0],
            12:["日常任务元宝刷新", 2],
            13:["丹药元宝直接制作", 4],
            14:["丹药元宝直接服用", 4],
            15:["装备元宝直接制作", 4],
            16:["阵营战的元宝鼓舞", 3],
            17:["普通副本加速扫荡", 0],
            18:["世界BOSS元宝复活", 0],
            19:["世界BOSS浴火重生", 3],
            20:["世界BOSS元宝鼓舞", 3],
            21:["猎命元宝召唤NPC", 5],
            22:["英雄副本加速扫荡", 0],
            23:["英雄副本元宝重置", 3],
            24:["仙旅奇缘清除冷却", 0],
            25:["七星封魔召唤散仙", 0],
            26:["护送取经元宝加速", 4],
            27:["护送取经刷新使者", 0],
            28:["护送取经元宝鼓舞", 4],
            29:["护送取经立即到达", 4],
            30:["护送取经召唤唐僧", 4],
            31:["清除拦截冷却时间", 0],
            32:["护送取经召唤如来", 0],
            33:["灵件属性元宝洗炼", 0],
            34:["灵件属性元宝激活", 0],
            35:["灵件属性批量洗炼", 5],
            36:["六道轮回爬塔刷新", 3],
            37:["六道轮回爬塔加速", 0],
            38:["找回昨天免费洗炼", 0],
            39:["找回昨天门派俸禄", 0],
            40:["找回昨天日常任务", 0],
            41:["找回昨天帮派祭神", 0],
            42:["找回昨天护送取经", 0],
            43:["找回昨天免费猎命", 0],
            44:["找回昨天元宝猎命", 5],
            45:["找回昨天赠送鲜花", 0],
            46:["找回昨天购买仙露", 0],
            47:["找回昨天吉星高照", 0],
            48:["找回昨天拜祭关公", 0],
            49:["吉星高照逆天改运", 4],
            50:["练功元宝加速1次", 0],
            51:["练功元宝批量加速", 0],
            52:["找回昨天的摘仙桃", 0],
            53:["神秘商人元宝刷新", 3],
            54:["找回昨天灵石领取", 0],
            55:["每日两倍领取灵石", 3],
            56:["每日三倍领取灵石", 3],
            57:["找回昨天龙王培养", 0]
        };
        public static const UpgradeClearCdTime:int = 1;
        public static const ResearchClearCdTime:int = 2;
        public static const BatchRune:int = 3;
        public static const FarmRefreshHerbsSeed:int = 4;
        public static const FarmGetTopHerbsSeed:int = 5;
        public static const FarmClearFarmlandCD:int = 6;
        public static const BuyCoinTreeCount:int = 7;
        public static const FarmFieldLevelUp:int = 8;
        public static const FarmBatPlant:int = 9;
        public static const AddChallenge:int = 10;
        public static const SportClearCd:int = 11;
        public static const RefreshDailyQuest:int = 12;
        public static const RefineZhiZhuo1001:int = 13;
        public static const ImmortalityCookie:int = 14;
        public static const RefineZhiZhuo1002:int = 15;
        public static const CampWarIngotBuyBuff:int = 16;
        public static const MissionPracticeQuickly:int = 17;
        public static const BossCookie1:int = 18;
        public static const BossCookie4:int = 19;
        public static const BossCookie3:int = 20;
        public static const BuyFateNpc:int = 21;
        public static const HeroPracticeQuickly:int = 22;
        public static const BuyHeroChallenge:int = 23;
        public static const TravelEventCD:int = 24;
        public static const FactionSealCallNpc:int = 25;
        public static const TakeBibleSpeedUp:int = 26;
        public static const TakeBibleRefreshAngel:int = 27;
        public static const TakeBibleInspire:int = 28;
        public static const TakeBibleMaxSpeedUp:int = 29;
        public static const SummerTS:int = 30;
        public static const TakeBibleClearCd:int = 31;
        public static const CallRuLai:int = 32;
        public static const SoulSuccinct:int = 33;
        public static const SoulActivation:int = 34;
        public static const SoulTraining2:int = 35;
        public static const TowerViewReset:int = 36;
        public static const TowerViewAuto:int = 37;
        public static const BackFreeSealTraining:int = 38;
        public static const BackCampSalary:int = 39;
        public static const BackDailyQuest:int = 40;
        public static const BackFactionBlessing:int = 41;
        public static const BackTakeBible:int = 42;
        public static const BackFateFree:int = 43;
        public static const BackFateIngot:int = 44;
        public static const BackSendFlower:int = 45;
        public static const BackCoinTree:int = 46;
        public static const BackRollCake:int = 47;
        public static const BackWorshipMars:int = 48;
        public static const RobelRedirection:int = 49;
        public static const practiceSpeed1:int = 50;
        public static const practiceSpeed24:int = 51;
        public static const BackGetPeach:int = 52;
        public static const RefreshLuckyShop:int = 53;
        public static const BackSealStone:int = 54;
        public static const GetSealStoneTwo:int = 55;
        public static const GetSealStoneThree:int = 56;
        public static const BackPetAnimal:int = 57;

        public static function getDescription(_arg1:int):String{
            return ((Data[_arg1]) ? Data[_arg1][0] : "");
        }
        public static function getVIP(_arg1:int):int{
            return ((Data[_arg1]) ? Data[_arg1][1] : 0);
        }

    }
}//package com.assist.server 
