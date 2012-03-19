//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.geom.*;

    public interface ITip {

        function toString():String;
        function get stageOffset():Point;
        function set oParent(_arg1:Sprite):void;
        function get targets():Dictionary;
        function addChild(_arg1:DisplayObject):DisplayObject;
        function addChildAt(_arg1:DisplayObject, _arg2:int):DisplayObject;
        function addTarget(_arg1:DisplayObject, _arg2=null):void;
        function addTargetMoreTips(_arg1:DisplayObject, ... _args):void;
        function addFixedTarget(_arg1:DisplayObject, _arg2, _arg3:Point, _arg4:Boolean=true):void;
        function removeTarget(_arg1:DisplayObject):void;
        function updateTarget(_arg1:DisplayObject=null):void;
        function hide():void;
        function clickToOpen(_arg1, _arg2:Event=null):Sprite;
        function hideOpened():void;
        function textTip(_arg1:DisplayObject, _arg2:String, _arg3:uint=0xFFFF00, _arg4:int=18):void;

    }
}//package com.assist.view.interfaces 
