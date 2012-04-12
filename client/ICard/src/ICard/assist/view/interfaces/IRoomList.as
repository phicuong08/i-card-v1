//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IRoomList {

        function get content():MovieClip;
				function InitCallback(arg1:Function,arg2:Function,arg3:Function,arg4:Function):void;
				function UpdateRoom(id:int,owner:String,slotInfo:String,
															joinAble:Boolean,watchAble:Boolean,started:Boolean):void;
    }
}//package com.assist.view.interfaces 
