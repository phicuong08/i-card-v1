//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IFriendChat {

        function get content():MovieClip;
        function init():void;
        function set onClearFriend(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set isShowSendFlower(_arg1:Boolean):void;
        function set onSendFlower(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function set onShowPerson(_arg1:Function):void;
        function set onBlackList(_arg1:Function):void;
        function set onButtleFriend(_arg1:Function):void;
        function set onDeleteFriend(_arg1:Function):void;
        function set onAddFriend(_arg1:Function):void;
        function clear():void;
        function set getPlayerInfo(_arg1:Object):void;
        function set onlineState(_arg1:Object):void;
        function btnState(_arg1:int, _arg2:int):void;
        function set onSendChat(_arg1:Function):void;
        function getChatList(_arg1:Array, _arg2:int):void;
        function getChatData(_arg1:Object, _arg2:int):void;
        function set onEnterState(_arg1:Function):void;
        function getFriendEnterState(_arg1:int, _arg2:int):void;

    }
}//package com.assist.view.interfaces 
