//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;

    public class PKWarController extends Base {

        public function get warData():WarData{
            return (_data.pkWar.warData);
        }
        public function get reportId():int{
            return (_data.pkWar.reportId);
        }

    }
}//package com.controllers 
