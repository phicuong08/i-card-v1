//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;
	import flash.geom.*;
    public interface IToolbar {
		function init():void;
		function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
		function get content():Sprite;
		function set tip(_arg1:ITip):void;
		function set onExit(_arg1:Function):void;
		function set onSet(_arg1:Function):void;
		function set onGold(_arg1:Function):void;
		function set onFriend(_arg1:Function):void;
		function set onTask(_arg1:Function):void;
		function set onPack(_arg1:Function):void;
		function set onGuy(_arg1:Function):void;
		
		
    }
}//package com.assist.view.interfaces 
