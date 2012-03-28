//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class GetPeachController extends Base {

        public function get buyMonkeys():Object{
            var _local1:Array = _data.getPeach.buyMonkeys;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get peachInfo():Object{
            var _local1:Array = _data.getPeach.peachInfo;
            var _local2:Object = {};
            _local2.peachLv = _local1[0];
            _local2.fruitLv = (70 + (_local2.peachLv * 5));
            var _local3:int = PeachType.getExp(_local2.peachLv);
            _local2.getExp = _local3;
            var _local4:int = (_local2.peachLv + 1);
            _local2.levelMax = (_local2.peachLv >= PeachType.MaxLevel);
            var _local5:int = (_local2.levelMax) ? PeachType.MaxLevel : _local4;
            var _local6:int = PeachType.getExp(_local5);
            _local2.nextExp = _local6;
            if (_local3 > 10000){
                _local2.getExp = (Math.floor((_local3 / 10000)) + GetPeachControllerLang.Wan);
                _local2.nextExp = (Math.floor((_local6 / 10000)) + GetPeachControllerLang.Wan);
            };
            _local2.peachNum = _local1[1];
            return (_local2);
        }
        public function get playerInfo():Object{
            var _local1:Array = _data.getPeach.playerInfo;
            var _local2:Object = {};
            _local2.playerCount = _local1[0];
            _local2.haveMonkeyNum = _local1[1];
            _local2.canBuyCount = _local1[2];
            return (_local2);
        }
        public function get warResult():int{
            return (_data.getPeach.warResult);
        }
        public function get warExp():int{
            return (_data.getPeach.warExp);
        }
        public function get warData():WarData{
            return (_data.getPeach.warData);
        }
        public function get warAura():int{
            return (_data.getPeach.warAura);
        }

    }
}//package com.controllers 
