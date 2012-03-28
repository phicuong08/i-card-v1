//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IFriendMessage {

        function get content():MovieClip;
        function init():void;
        function clear():void;
        function set changeEndPoint(_arg1:int):void;
        function set additionalHeight(_arg1:int):void;
        function set onOpenFriend(_arg1:Function):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function set geMessageList(_arg1:Array):void;
        function set geMessageData(_arg1:Object):void;
        function set addSingularMissage(_arg1:Object):void;
        function set clearAble(_arg1:int):void;
        function set onOpenFriendList(_arg1:Function):void;
        function set onShowMost(_arg1:Function):void;
        function set onClearAll(_arg1:Function):void;
        function clearMostMessage():void;

    }
}//package com.assist.view.interfaces 
