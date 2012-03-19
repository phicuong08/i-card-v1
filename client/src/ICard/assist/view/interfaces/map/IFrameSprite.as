//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.base.*;

    public interface IFrameSprite extends IContent {

        function pass(_arg1:int):void;
        function initUrl(_arg1:String, _arg2:String, _arg3:Function=null):void;
        function set dir(_arg1:int):void;
        function get dir():int;
        function set shadowVisible(_arg1:Boolean):void;
        function set bodyFilters(_arg1:Array):void;

    }
}//package com.assist.view.interfaces.map 
