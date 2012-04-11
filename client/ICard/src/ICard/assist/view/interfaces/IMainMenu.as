//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IMainMenu {
		    function get content():MovieClip;
		    function set tip(_arg1:ITip):void;
				function ShowMainBut(arg1:Boolean):void;
				function set onExit(_arg1:Function):void;
				function set onSet(_arg1:Function):void;
				function set onGold(_arg1:Function):void;
				function set onFriend(_arg1:Function):void;
				function set onTask(_arg1:Function):void;
				function set onPack(_arg1:Function):void;
				function set onGuy(_arg1:Function):void;
				
				function set onBattle(_arg1:Function):void;
				function set onTrain(_arg1:Function):void;
				function set onVS(_arg1:Function):void;
				function set onRace(_arg1:Function):void;
				function set onCard(_arg1:Function):void;
				function set onShop(_arg1:Function):void;
    }
}//package com.assist.view.interfaces 
