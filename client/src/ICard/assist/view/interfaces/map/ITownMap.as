//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.display.*;
    import com.assist.view.info.*;

    public interface ITownMap extends IMap {

        function set onBuildClick(_arg1:Function):void;
        function set onNpcSpeak(_arg1:Function):void;
        function set onPortal(_arg1:Function):void;
        function set onNpcRange(_arg1:Function):void;
        function set onMapClick(_arg1:Function):void;
        function set miniMap(_arg1:IMiniMap):void;
        function moveToPortal(_arg1:Boolean):void;
        function moveToNPCAtId(_arg1:int):void;
        function setNpcGetVisible(_arg1:int, _arg2:Boolean):void;
        function setNPCHead(_arg1:int, _arg2:int):NPCInfo;
        function resetNPCHead(_arg1:Object):void;
        function getBuildTarget(_arg1:int):Sprite;
        function set otherCount(_arg1:int):void;

    }
}//package com.assist.view.interfaces.map 
