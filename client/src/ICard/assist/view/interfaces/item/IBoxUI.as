//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.item {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IBoxUI extends IContent {

        function set id(_arg1:int):void;
        function get icon():Sprite;
        function set lock(_arg1:Boolean):void;
        function set num(_arg1:String):void;
        function set itemName(_arg1:String):void;
        function set itemPrice(_arg1:String):void;
        function set lockLight(_arg1:Boolean):void;
        function set light(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces.item 
