//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
    import ICard.assist.*;
    import ICard.haloer.data.*;
    import ICard.assist.server.*;

    public class AchievementData extends Base {

        private var _aryGetPlayerAchievementList:Array;
        private var _aryNotifyCompleteAchievement:Array;
        public var inLoadAchievementTypeData:Boolean = false;

        public function AchievementData(){
            this._aryGetPlayerAchievementList = [];
            this._aryNotifyCompleteAchievement = [];
            super();
        }
        public function get getPlayerAchievementList():Array{
            return (this._aryGetPlayerAchievementList);
        }
        public function get notifyCompleteAchievement():Array{
            var _local1:Array = this._aryNotifyCompleteAchievement.slice();
            this._aryNotifyCompleteAchievement = [];
            return (_local1);
        }
        private function getAchievementAllData():Array{
            var _local3:Object;
            var _local4:int;
            var _local1:Array = AchievementType.getAchievementIds();
            var _local2:Array = [];
            for each (_local4 in _local1) {
                _local3 = {};
                _local3["achievement_id"] = _local4;
                this.getAchievementInfo(_local3);
                _local2.push(_local3);
            };
            return (_local2);
        }
        private function getAchievementInfo(_arg1:Object):void{
            _arg1["tag_id"] = AchievementType.getAchievementTagId(_arg1["achievement_id"]);
            _arg1["tag_name"] = AchievementType.getAchievementTagName(_arg1["tag_id"]);
            _arg1["content"] = AchievementType.getContent(_arg1["achievement_id"]);
            _arg1["name"] = AchievementType.getName(_arg1["achievement_id"]);
            _arg1["point"] = AchievementType.getPoint(_arg1["achievement_id"]);
            _arg1["sign"] = AchievementType.getSign(_arg1["achievement_id"]);
            _arg1["sort_order"] = AchievementType.getSortOrder(_arg1["achievement_id"]);
            _arg1["complete_total"] = AchievementType.getTotal(_arg1["achievement_id"]);
            _arg1["special_award"] = AchievementType.getSpecialAward(_arg1["achievement_id"]);
            _arg1["completed_number"] = 0;
            _arg1["complete_date"] = 0;
            _arg1["url"] = ((URI.achievementUrl + _arg1["sign"]) + ".png");
        }
        public function get_player_achievement_list(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            var _local4:Object;
            this._aryGetPlayerAchievementList = this.getAchievementAllData();
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["achievement_id", "completed_number", "complete_date"]);
                for each (_local4 in this._aryGetPlayerAchievementList) {
                    if (_local4["achievement_id"] != _local2["achievement_id"]){
                    } else {
                        _local4["completed_number"] = _local2["completed_number"];
                        _local4["complete_date"] = _local2["complete_date"];
                        break;
                    };
                };
            };
            this._aryGetPlayerAchievementList.sortOn("sort_order", Array.NUMERIC);
        }
        public function notify_complete_achievement(_arg1:Array):void{
            var callBack:* = null;
            var result:* = _arg1;
            callBack = function ():void{
                var _local1:Object;
                for each (_local1 in _aryNotifyCompleteAchievement) {
                    getAchievementInfo(_local1);
                };
                inLoadAchievementTypeData = false;
            };
            var objAchievement:* = {};
            oObject.list(result, objAchievement, ["player_id", "player_nickname", "achievement_id"]);
            this._aryNotifyCompleteAchievement.push(objAchievement);
            if (this.inLoadAchievementTypeData){
                return;
            };
            this.inLoadAchievementTypeData = true;
            AchievementType.loadData(callBack);
        }

    }
}//package com.datas 
