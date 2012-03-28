//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.haloer.data.*;

    public class SendFlowerController extends Base {

        public function sendFlowerRecord():Array{
            var _local2:Object;
            var _local1:Array = this._data.sendFlower.sendFlowerRecord();
            for each (_local2 in _local1) {
                _local2["chinese_time"] = DateTime.formatFromSecond2(_local2["send_time"], this._ctrl.player.serverTime);
            };
            return (_local1);
        }
        public function sendFlowerInfo():Object{
            return (this._data.sendFlower.sendFlowerInfo());
        }
        public function sendPlayerFlower():Object{
            return (this._data.sendFlower.sendPlayerFlower());
        }
        public function sendFlowerRanking():Array{
            return (this._data.sendFlower.sendFlowerRanking());
        }

    }
}//package com.controllers 
