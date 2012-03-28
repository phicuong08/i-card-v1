//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.view.info.*;

    public class ServerWarController extends Base {

        public function get info():ServerWarInfo{
            return (this._data.serverWar.info);
        }
        public function get result():int{
            return (this._data.serverWar.result);
        }

    }
}//package com.controllers 
