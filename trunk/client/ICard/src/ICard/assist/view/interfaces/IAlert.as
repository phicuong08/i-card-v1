//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IAlert {

        function get content():Sprite;
        function set oParent(_arg1:Sprite):void;
        function set tip(_arg1:ITip):void;
        function set yesLabel(_arg1:String):void;
        function set noLabel(_arg1:String):void;
        function set cancelLabel(_arg1:String):void;
        function set yesEnabled(_arg1:Boolean):void;
        function set noEnabled(_arg1:Boolean):void;
        function set cancelEnabled(_arg1:Boolean):void;
        function set yesLabelTip(_arg1:String):void;
        function set noLabelTip(_arg1:String):void;
        function set cancelLabelTip(_arg1:String):void;
        function set hasCheckbox(_arg1:Boolean):void;
        function get checked():Boolean;
        function get visible():Boolean;
        function show(_arg1:String, _arg2:uint=1, _arg3:Function=null):void;
        function hide():void;
        function updateContent(_arg1:String):void;
        function defaultCloseEvent():void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void;

    }
}//package com.assist.view.interfaces 
