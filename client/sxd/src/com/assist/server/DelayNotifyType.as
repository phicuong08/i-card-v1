//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class DelayNotifyType {

        private static const List:Object = {
            1:["", "", 1],
            2:["", "", 1],
            3:["", "", 1],
            6:["", "", 1],
            7:["", "", 1],
            8:["", "", 1],
            9:["", "", 1],
            10:["", "", 1],
            11:["", "", 1],
            13:["", "", 1],
            14:["", "", 2],
            15:["", "", 1],
            16:["", "", 2],
            17:["", "", 2],
            18:["", "", 1],
            19:["", "", 1],
            20:["", "", 1],
            22:["", "", 1],
            23:["", "", 1],
            25:["", "", 1],
            26:["", "", 1],
            27:["", "", 1],
            28:["", "", 1],
            29:["", "", 2],
            30:["", "", 2],
            32:["", "", 1],
            33:["", "", 2],
            34:["", "", 1],
            35:["", "", 1],
            36:["", "", 2],
            37:["", "", 1],
            38:["", "", 1],
            39:["", "", 1],
            40:["", "", 2],
            41:["", "", 1],
            42:["", "", 1],
            43:["", "", 1],
            44:["", "", 1],
            45:["", "", 1],
            46:["", "", 1],
            47:["", "", 1],
            48:["", "", 1],
            49:["", "", 3],
            50:["", "", 3],
            51:["", "", 1],
            52:["", "", 1],
            53:["", "", 1],
            54:["", "", 1],
            55:["", "", 1],
            56:["", "", 1],
            57:["", "", 1],
            58:["", "", 1],
            59:["", "", 1],
            60:["", "", 1],
            61:["", "", 1],
            62:["", "", 1],
            63:["", "", 1],
            64:["", "", 1],
            65:["", "", 1],
            66:["", "", 1],
            67:["", "", 1],
            68:["", "", 1],
            69:["", "", 1]
        };
        public static const Farm:int = 1;
        public static const AddFriend:int = 2;
        public static const ExtraPower:int = 3;
        public static const ChallengeWorldBoss:int = 6;
        public static const DefeatWorldBoss:int = 7;
        public static const HarvestLevelWarning:int = 8;
        public static const VipLevelUp:int = 9;
        public static const ChallengeWorldBossHero:int = 10;
        public static const CampWarAward:int = 11;
        public static const KickoutMember:int = 13;
        public static const SuperSport:int = 14;
        public static const JoinFactionWar:int = 15;
        public static const FactionWarRoundAward:int = 16;
        public static const FactionWarRoundAward2:int = 17;
        public static const AcceptRequest:int = 18;
        public static const MasterTransfer:int = 19;
        public static const DisbandFaction:int = 20;
        public static const DefeatWorldBossHelperAward:int = 22;
        public static const DefeatWorldBossCallerAward:int = 23;
        public static const DefeatWorldBossInTop3:int = 25;
        public static const ChallengeWorldBossInTop3:int = 26;
        public static const FactionWarTop16In:int = 27;
        public static const FactionWarTop16Out:int = 28;
        public static const TakeBibleBeRob:int = 29;
        public static const TakeBibleBeRobProtect:int = 30;
        public static const TakeBibleSuccess:int = 32;
        public static const TakeBibleProtectLose:int = 33;
        public static const TakeBibleProtectSuccess:int = 34;
        public static const TakeBibleApplyProtect:int = 35;
        public static const TakeBibleProtectFailed:int = 36;
        public static const WorldBossHelperPercentAward:int = 37;
        public static const WorldBossCallerPercentAward:int = 38;
        public static const FactionWarTop16OutToMaster:int = 39;
        public static const TakeBibleBeRobLose:int = 40;
        public static const SealSatanAward:int = 41;
        public static const SealSatanHelp:int = 42;
        public static const CalEatAward:int = 43;
        public static const JoinEatCallerAward:int = 44;
        public static const InvitJoinEat:int = 45;
        public static const AddFriendIsAdd:int = 46;
        public static const SetFactionBossTime:int = 47;
        public static const CampWar:int = 48;
        public static const ReceiveSendFlower:int = 49;
        public static const ReceiveTopFlower:int = 50;
        public static const BossRobotIngotNotEnough:int = 51;
        public static const BossRobotResult:int = 52;
        public static const CampWarAutoAward:int = 53;
        public static const CampWarAutoIngot:int = 54;
        public static const SeizeTheThrone:int = 55;
        public static const CallRulaiAward:int = 56;
        public static const WorldWarPrepare:int = 57;
        public static const HeroesWar:int = 58;
        public static const HeroesWarAutoAward:int = 59;
        public static const HeroesWarAutoIngot:int = 60;
        public static const ServerWarBetWin1:int = 61;
        public static const ServerWarBetWin2:int = 62;
        public static const ServerWarBetWin3:int = 63;
        public static const ServerWarBetLose1:int = 64;
        public static const ServerWarBetLose2:int = 65;
        public static const ServerWarBetLose3:int = 66;
        public static const WorldWarGetData1:int = 67;
        public static const WorldWarGetData2:int = 68;
        public static const WorldWarGetData3:int = 69;

        public static var System:int = 0;
        public static var Email:int = 1;
        public static var PK:int = 2;
        public static var Flower:int = 3;

        public static function getType(_arg1:int):int{
            return ((List[_arg1]) ? List[_arg1][2] : 0);
        }

    }
}//package com.assist.server 
