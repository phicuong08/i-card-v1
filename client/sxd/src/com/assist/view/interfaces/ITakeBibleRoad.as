//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface ITakeBibleRoad {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set onClose(_arg1:Function):void;
        function set onOpenReady(_arg1:Function):void;
        function set callRuLaiState(_arg1:Object):void;
        function set vipLevel(_arg1:int):void;
        function set isShowBaiMa(_arg1:Boolean):void;
        function set onShowBaiMa(_arg1:Function):void;
        function clear():void;
        function get isCdTime():Boolean;
        function set onMaxSpeedUp(_arg1:Function):void;
        function set isUserProtection(_arg1:int):void;
        function set getStartTime(_arg1:String):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function isUserSpeedUp():void;
        function set renderIngot(_arg1:Number):void;
        function set renderCoins(_arg1:Number):void;
        function TakeBibleRoadData(_arg1:Object):void;
        function set onSpeedUp(_arg1:Function):void;
        function set takeBibleStatus(_arg1:int):void;
        function set getSystemInfo(_arg1:Object):void;
        function set onTextLink(_arg1:Function):void;
        function set cdTime(_arg1:Object):void;
        function set onRefreshCdTime(_arg1:Function):void;
        function returnTakeBibleRoadData(_arg1:Object):void;
        function set onClearCdTime(_arg1:Function):void;
        function set onRob(_arg1:Function):void;
        function set onPlayerData(_arg1:Function):void;
        function set getTakeBibleTeamList(_arg1:Array):void;
        function set onMouseOver(_arg1:Function):void;
        function set onMouseOut(_arg1:Function):void;
        function set getTakeBibleTeamData(_arg1:Object):void;
        function set playerData(_arg1:Object):void;
        function clearTeam(_arg1:int, _arg2:Boolean):void;
        function set onMoveEnd(_arg1:Function):void;
        function set changeTime(_arg1:Object):void;
        function set onRuLaiReady(_arg1:Function):void;
        function set getRuLaiData(_arg1:Object):void;
        function set getStartRuLaiData(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
