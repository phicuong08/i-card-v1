//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.view.info.*;

    public class WorldBossMapController extends Base {

        public function get bossList():Array{
            return (_data.worldBoss.bossList);
        }
        public function getBossObjAtTownId(_arg1:int):BossInfo{
            var _local2:BossInfo;
            for each (_local2 in _data.worldBoss.bossList) {
                if (_local2.mapId == _arg1){
                    return (_local2);
                };
            };
            return (null);
        }
        public function set nowBoss(_arg1:BossInfo):void{
            _data.worldBoss.nowBoss = _arg1;
        }
        public function get result():int{
            return (_data.worldBoss.result);
        }
        public function get notifyBoss():BossInfo{
            return (_data.worldBoss.notifyBoss);
        }
        public function get combatBuff():int{
            return (_data.worldBoss.combatBuff);
        }
        public function get warStatus():int{
            return (_data.worldBoss.warStatus);
        }
        public function get warData():WarData{
            var _local1:WarData = new WarData();
            _local1.format([0, 0, 0, _data.worldBoss.warData]);
            return (_local1);
        }
        public function get awards():Object{
            var _local1:Object = {};
            var _local2:Array = _data.worldBoss.awards;
            var _local3:int;
            while (_local3 < _local2.length) {
                switch (parseInt(_local2[_local3][0])){
                    case 0:
                        _local1["coin"] = _local2[_local3][1];
                        break;
                    case 1:
                        _local1["exp"] = _local2[_local3][1];
                        break;
                    case 2:
                        _local1["fame"] = _local2[_local3][1];
                        break;
                    case 10:
                        _local1["hurt"] = _local2[_local3][1];
                        break;
                };
                _local3++;
            };
            return (_local1);
        }

    }
}//package com.controllers 
