//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;

    public class VipController extends com.controllers.Base {

        public var ownData:VipData;

        public function get playerVipLevel():int{
            return (this.ownData.playerVipLevel);
        }
        public function get moneyToNextLevel():int{
            return (this.ownData.moneyToNextLevel);
        }

    }
}//package com.controllers 
