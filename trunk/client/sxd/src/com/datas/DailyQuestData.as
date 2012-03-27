//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class DailyQuestData extends Base {

        private var _aryDayQuestList:Array;
        private var _aryDayAcceptQuest:Array;
        private var _aryDayGiveupQuest:Array;
        private var _aryDayQuestRefresh:Array;
        private var _aryDayNowComplete:Array;
        private var _aryDayGetAward:Array;
        private var _aryDayQuestRefreshStar:Array;
        private var _objFinishAllDayQuest:Object;

        public function DailyQuestData(){
            this._aryDayQuestList = [];
            this._aryDayAcceptQuest = [];
            this._aryDayGiveupQuest = [];
            this._aryDayQuestRefresh = [];
            this._aryDayNowComplete = [];
            this._aryDayGetAward = [];
            this._aryDayQuestRefreshStar = [];
            this._objFinishAllDayQuest = {};
            super();
        }
        public function getDayQuestList():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayQuestList[0][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayQuestList[0][0][4]);
            return (_local1);
        }
        public function acceptDayQuest():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayAcceptQuest[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayAcceptQuest[1][0][4]);
            _local1["result"] = this._aryDayAcceptQuest[0];
            return (_local1);
        }
        public function giveupDayQuest():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayGiveupQuest[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayGiveupQuest[1][0][4]);
            _local1["result"] = this._aryDayGiveupQuest[0];
            return (_local1);
        }
        public function refreshDayQuest():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayQuestRefresh[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayQuestRefresh[1][0][4]);
            _local1["result"] = this._aryDayQuestRefresh[0];
            return (_local1);
        }
        public function nowCompleteDay():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayNowComplete[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayNowComplete[1][0][4]);
            _local1["result"] = this._aryDayNowComplete[0];
            return (_local1);
        }
        public function getAwardDay():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayGetAward[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayGetAward[1][0][4]);
            _local1["result"] = this._aryDayGetAward[0];
            return (_local1);
        }
        public function refreshStarDayQuest():Object{
            var _local1:Object = this.setDayQuestInfo(this._aryDayQuestRefreshStar[1][0]);
            _local1["list"] = this.setDayQuestList(this._aryDayQuestRefreshStar[1][0][4]);
            _local1["result"] = this._aryDayQuestRefreshStar[0];
            return (_local1);
        }
        public function finishAllDayQuest():Object{
            return (this._objFinishAllDayQuest);
        }
        private function setDayQuestInfo(_arg1:Array):Object{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["complete_quest_count", "star_count", "updata_button", "complete_button"]);
            return (_local2);
        }
        private function setDayQuestList(_arg1:Array):Array{
            var _local3:Object;
            var _local4:Array;
            var _local2:Array = [];
            for each (_local4 in _arg1) {
                _local3 = {};
                oObject.list(_local4, _local3, ["quest_id", "need_count", "complete_count", "star", "skill", "item_id", "item_count", "state", "is_talk_quest"]);
                _local3["title"] = QuestType.getTitle(_local3["quest_id"]);
                _local3["content"] = QuestType.getContent(_local3["quest_id"]);
                _local3["conditions"] = QuestType.getConditions(_local3["quest_id"]);
                if (_local3["item_id"] != 0){
                    _local3["item_name"] = ItemType.getName(_local3["item_id"]);
                    _local3["color"] = ItemType.getItemColor(_local3["item_id"]);
                };
                _local2.push(_local3);
            };
            _local2.sortOn(["state", "quest_id"], Array.DESCENDING);
            return (_local2);
        }
        public function day_quest_list(_arg1:Array):void{
            this._aryDayQuestList = _arg1;
        }
        public function day_accept_quest(_arg1:Array):void{
            this._aryDayAcceptQuest = _arg1;
        }
        public function day_giveup_quest(_arg1:Array):void{
            this._aryDayGiveupQuest = _arg1;
        }
        public function day_quest_refresh(_arg1:Array):void{
            this._aryDayQuestRefresh = _arg1;
        }
        public function day_now_complete(_arg1:Array):void{
            this._aryDayNowComplete = _arg1;
        }
        public function day_get_award(_arg1:Array):void{
            this._aryDayGetAward = _arg1;
        }
        public function day_quest_refresh_star(_arg1:Array):void{
            this._aryDayQuestRefreshStar = _arg1;
        }
        public function finish_all_day_quest(_arg1:Array):void{
            this._objFinishAllDayQuest = {};
            this._objFinishAllDayQuest["state"] = _arg1[0];
        }

    }
}//package com.datas 
