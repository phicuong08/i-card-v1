//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import ICard.controllers.*;

	
    public class Controller extends ControllerBase {

        public function get achievement():AchievementController{
            return ((createObject(AchievementController) as AchievementController));
        }


    }
}//package com 
