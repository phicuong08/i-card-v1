//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IFriendList {

        function get content():MovieClip;
        function get width():Number;
        function get height():Number;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set getPlayerData(_arg1:Object):void;
        function set onInvitation(_arg1:Function):void;
        function set isShowInvitation(_arg1:Boolean):void;
        function set getFriendList(_arg1:Array):void;
        function set onMsgOpen(_arg1:Function):void;
        function set onFriend(_arg1:Function):void;
        function set onOpenFriendType(_arg1:String):void;
        function set isOpenPk(_arg1:Boolean):void;
        function set onAudience(_arg1:Function):void;
        function set isOpenSendFlower(_arg1:Boolean):void;
        function set onSendFlower(_arg1:Function):void;
        function set onRecent(_arg1:Function):void;
        function set isMerge(_arg1:Boolean):void;
        function set onBlackList(_arg1:Function):void;
        function set isOnLine(_arg1:Object):void;
        function set onShowPerson(_arg1:Function):void;
        function set friendMsgNum(_arg1:Object):void;
        function set onButtleFriend(_arg1:Function):void;
        function set onAddInfo(_arg1:Function):void;
        function set onDeleteFriend(_arg1:Function):void;
        function set onMoveFriend(_arg1:Function):void;
        function set addFriendInfo(_arg1:String):void;
        function close():void;
        function set onClose(_arg1:Function):void;
        function set onChatShow(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
