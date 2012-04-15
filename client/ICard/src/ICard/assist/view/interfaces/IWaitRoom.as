//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IWaitRoom {
        	function get content():MovieClip;
			function UpdatePlayerList(players:Array):void;
			function set onInvite(_arg1:Function):void;
		    
		    function set onBye(_arg1:Function):void;
		    
		    function set onLock(_arg1:Function):void;
		    
		    function set onStart(_arg1:Function):void;
    }
}//package com.assist.view.interfaces 
