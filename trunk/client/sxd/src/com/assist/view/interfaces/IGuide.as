//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IGuide {

        function get content():Sprite;
        function set text(_arg1:String):void;
        function set dir(_arg1:String):void;
        function set x(_arg1:Number):void;
        function set y(_arg1:Number):void;
        function set onClick(_arg1:Function):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
