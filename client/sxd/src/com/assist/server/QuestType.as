//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class QuestType {

        public static const FavoriteQuestId:int = 263;
        public static const PartnersQuestId:int = 21;
        public static const PartnersQuestId2:int = 224;
        public static const BeginnerQuestId:int = 1;
        public static const BeginnerItemId:int = 2;
        public static const BeginnerAutoWayId:int = 2;
        public static const BeginnerUpgradeId:int = 2;
        public static const BeginnerTrainingId:int = 15;
        public static const BeginnerFateIdByShuShan:int = 70;
        public static const BeginnerFateIdByKunLun:int = 71;
        public static const SlaveQuestLock:uint = 2900;
        public static const EliteQuestLock:uint = 5300;
        public static const Master:int = 1;
        public static const Slave:int = 2;
        public static const Daily:int = 3;
        public static const Elite:int = 4;
        public static const LevelLimit:int = -1;
        public static const Acceptable:int = 0;
        public static const Accepted:int = 1;
        public static const Completed:int = 2;

        private static var _Types:Object = {
            1:"主线",
            2:"支线",
            3:"每日",
            4:"精英"
        };
        private static var _Quests:Object = null;

        public static function get Quests():Object{
            if (_Quests == null){
                throw (new Error("还未赋值！"));
            };
            return (_Quests);
        }
        public static function set Quests(_arg1:Object):void{
            if (_Quests != null){
                throw (new Error("非法赋值"));
            };
            _Quests = _arg1;
        }
        public static function getTypeName(_arg1:int):String{
            return (((_Types[_arg1]) || ("")));
        }
        public static function getType(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][0] : 0);
        }
        public static function getLock(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][1] : 0);
        }
        public static function getLevel(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][2] : 0);
        }
        public static function getTitle(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][3] : "");
        }
        public static function getContent(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][4] : "");
        }
        public static function getConditions(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][5] : "");
        }
        public static function getTownText(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][6] : "");
        }
        public static function getBeginNPCId(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][7] : 0);
        }
        public static function getEndNPCId(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][8] : 0);
        }
        public static function getAwardExperience(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][9] : 0);
        }
        public static function getAwardCoins(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][10] : 0);
        }
        public static function getAwardItemId(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][11] : 0);
        }
        public static function getIsTalkQuest(_arg1:int):Boolean{
            return ((Quests[_arg1]) ? Quests[_arg1][12] : false);
        }
        public static function getAcceptTalk(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][13] : "");
        }
        public static function getAcceptedTalk(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][14] : "");
        }
        public static function getCompletedTalk(_arg1:int):String{
            return ((Quests[_arg1]) ? Quests[_arg1][15] : "");
        }
        public static function getMissionId(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][16] : 0);
        }
        public static function getAwardItemCount(_arg1:int):int{
            return ((Quests[_arg1]) ? Quests[_arg1][17] : 0);
        }
        public static function getAwardItemIdByRoleId(_arg1:int, _arg2:int):int{
            var _local4:String;
            var _local3:int;
            if (17 == _arg1){
                _local4 = RoleType.getJobSignByRoleId(_arg2);
                if (RoleType.FeiYu == _local4){
                    _local3 = 367;
                } else {
                    if (RoleType.JianLing == _local4){
                        _local3 = 366;
                    } else {
                        if (RoleType.WuSheng == _local4){
                            _local3 = 365;
                        };
                    };
                };
            } else {
                _local3 = getAwardItemId(_arg1);
            };
            return (_local3);
        }

    }
}//package com.assist.server 
