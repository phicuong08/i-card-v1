//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.base.*;

    public interface IWorldFrame extends IContent {

        function pass(_arg1:int):void;
        function set playerInfo(_arg1:PlayerInfo):void;
        function updateBodyUrl(_arg1:String=null):void;
        function move(_arg1:int, _arg2:int):void;
        function moveTo(_arg1:int, _arg2:int, _arg3:int=0):void;
        function set dir(_arg1:int):void;
        function get dir():int;

    }
}//package com.assist.view.interfaces.map 
