//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.view.info.*;

    public class TowerController extends Base {

        public function get towerInfo():TowerInfo{
            return (_data.tower.info);
        }
        public function get warData():WarData{
            return (_data.tower.warData);
        }
        public function get warSoulId():int{
            return (_data.tower.warSoulId);
        }
        public function get warExp():int{
            return (_data.tower.warExp);
        }
        public function get warFame():int{
            return (_data.tower.warFame);
        }
        public function get warCoin():int{
            return (_data.tower.warCoin);
        }
        public function get result():int{
            return (_data.tower.result);
        }
        public function get isPass():Boolean{
            return (_data.tower.isPass);
        }
        public function get warAura():int{
            return (_data.tower.warAura);
        }

    }
}//package com.controllers 
