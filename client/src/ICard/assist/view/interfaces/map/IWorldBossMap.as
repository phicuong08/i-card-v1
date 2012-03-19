//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.display.*;

    public interface IWorldBossMap extends IMap {

        function set onMapClick(_arg1:Function):void;
        function set onWar(_arg1:Function):void;
        function set fuhuoMC(_arg1:MovieClip):void;
        function set zhangAiVisible(_arg1:Boolean):void;
        function movePlayerToBoss():void;
        function warClose(_arg1:Boolean):void;
        function updatePlayerState(_arg1:int):void;
        function bossKill():void;
        function bossMoveto(_arg1:int, _arg2:int):void;

    }
}//package com.assist.view.interfaces.map 
