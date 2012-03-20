//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import ICard.controllers.*;

	
    public class ControllerMgr extends ControllerBaseMgr {

        public function get achievement():AchievementController{
            return ((createObject(AchievementController) as AchievementController));
        }


    }
}//package com 
