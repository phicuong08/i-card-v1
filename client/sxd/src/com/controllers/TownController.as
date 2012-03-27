//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.assist.view.info.*;

    public class TownController extends com.controllers.Base {

        public function getPlayerInfo(_arg1:int):PlayerInfo{
            return (_data.town.getPlayerInfo(_arg1));
        }
        public function get entownList():Array{
            var _local1:Array = _data.town.entownList;
            _data.town.entownList = [];
            return (_local1);
        }
        public function get moveList():Array{
            var _local1:Array = _data.town.moveList;
            _data.town.moveList = [];
            return (_local1);
        }
        public function get leaveList():Array{
            var _local1:Array = _data.town.leaveList;
            _data.town.leaveList = [];
            return (_local1);
        }
        public function get followList():Array{
            var _local1:Array = _data.town.followList;
            _data.town.followList = [];
            return (_local1);
        }
        public function get result():int{
            return (_data.town.result);
        }
        public function get playercount():int{
            return (_data.town.playercount);
        }
        public function get count():int{
            return (_data.town.count);
        }
        public function clearPlayer():void{
            _data.town.clearPlayer();
        }
        public function set maxCount(_arg1:int):void{
            TownData.maxCount = _arg1;
        }
        public function get maxCount():int{
            return (TownData.maxCount);
        }

    }
}//package com.controllers 
