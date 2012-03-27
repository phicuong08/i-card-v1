//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;

    public class DuJieController extends Base {

        public function get dujieState():int{
            return (_data.dujie.dujieState);
        }
        public function get pointState():int{
            return (_data.dujie.pointState);
        }
        public function get playerRoleId():int{
            return (_data.dujie.playerRoleId);
        }
        public function get playerRoleLv():int{
            return (_data.dujie.playerRoleLv);
        }
        public function get dujieName():String{
            return (_data.dujie.dujieName);
        }
        public function get result():int{
            return (_data.dujie.result);
        }
        public function get pointTip():String{
            return (_data.dujie.pointTip);
        }
        public function get dujieTip():String{
            return (_data.dujie.dujieTip);
        }
        public function get warData():WarData{
            return (_data.dujie.warData);
        }
        public function get addHealth():int{
            return (_data.dujie.addHealth);
        }
        public function get roleId():int{
            return (_data.dujie.roleId);
        }
        public function get spiritStateId():int{
            return (_data.dujie.spiritStateId);
        }
        public function get spiritStateLevel():int{
            return (_data.dujie.spiritStateLevel);
        }
        public function get awardAura():int{
            return (_data.dujie.awardAura);
        }

    }
}//package com.controllers 
