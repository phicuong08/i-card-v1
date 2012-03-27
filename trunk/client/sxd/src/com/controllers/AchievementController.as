//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class AchievementController extends Base {

        public function get inLoadAchievementTypeData():Boolean{
            return (this._data.achievement.inLoadAchievementTypeData);
        }
        public function get getPlayerAchievementList():Array{
            return (this._data.achievement.getPlayerAchievementList);
        }
        public function get notifyCompleteAchievement():Array{
            return (this._data.achievement.notifyCompleteAchievement);
        }

    }
}//package com.controllers 
