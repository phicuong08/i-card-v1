//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.data {

    public interface IData {

        function call(_arg1:Object, _arg2:Function, _arg3:Array, _arg4:Boolean=true):void;
		function callSFS(_arg1:Object, _arg2:Function, _arg3:Array, _arg4:Boolean=true):void;
		function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void;
		function SFS_subscribeVSRoomGroup(callback_ok:Function,callback_fail:Function,onNotify:Function):void;
		function SFS_joinVSRoom(arg1:int,callback_ok:Function,callback_fail:Function):void;
		function SFS_LeaveVSRoom():void;
        function patch(_arg1:Object, _arg2:Function):void;
        function cancelPatch(_arg1:Object):void;
        function set onClose(_arg1:Function):void;
        function close():void;

    }
}//package com.assist.data 
