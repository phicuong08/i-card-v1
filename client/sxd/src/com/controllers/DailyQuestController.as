//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class DailyQuestController extends Base {

        public function getDayQuestList():Object{
            return (this._data.dailyQuest.getDayQuestList());
        }
        public function acceptDayQuest():Object{
            return (this._data.dailyQuest.acceptDayQuest());
        }
        public function giveupDayQuest():Object{
            return (this._data.dailyQuest.giveupDayQuest());
        }
        public function refreshDayQuest():Object{
            return (this._data.dailyQuest.refreshDayQuest());
        }
        public function nowCompleteDay():Object{
            return (this._data.dailyQuest.nowCompleteDay());
        }
        public function getAwardDay():Object{
            return (this._data.dailyQuest.getAwardDay());
        }
        public function refreshStarDayQuest():Object{
            return (this._data.dailyQuest.refreshStarDayQuest());
        }
        public function get finishAllDayQuest():Object{
            return (this._data.dailyQuest.finishAllDayQuest());
        }

    }
}//package com.controllers 
