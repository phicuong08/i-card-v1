//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IMainMenu {
		    function get content():MovieClip;
		    
			function ShowMainBut(arg1:Boolean):void;
			
			
			function set onBattle(_arg1:Function):void;
			function set onTrain(_arg1:Function):void;
			function set onVS(_arg1:Function):void;
			function set onRace(_arg1:Function):void;
			function set onCard(_arg1:Function):void;
			function set onShop(_arg1:Function):void;
    }
}//package com.assist.view.interfaces 
