//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.factionWar {
    import com.assist.view.interfaces.map.*;

    public interface IFactionWarMap extends IMap {

        function set onWar(_arg1:Function):void;
        function initFactionList(_arg1:Array):void;
        function startFactionWar():void;
        function updatePlayerWarState(_arg1:int):void;

    }
}//package com.assist.view.interfaces.factionWar 
