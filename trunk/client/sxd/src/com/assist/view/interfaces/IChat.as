//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IChat {

        function set playerId(_arg1:int):void;
        function set nickName(_arg1:String):void;
        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set onOpenGm(_arg1:Function):void;
        function clear():void;
        function set isOpenActivity(_arg1:Boolean):void;
        function set isOpenFaction(_arg1:Boolean):void;
        function getShieldPlayerInfo(_arg1:String, _arg2:int):String;
        function isShieldPlayer(_arg1:Object):Boolean;
        function isSendTrue(_arg1:Object, _arg2:int, _arg3:int):Boolean;
        function wordsLimit(_arg1:Object):Boolean;
        function set sendSelf(_arg1:Object):void;
        function set changeChat(_arg1:int):void;
        function set getRemoveSuffixData(_arg1:Function):void;
        function set getChatData(_arg1:Array):void;
        function directlyChatData(_arg1:String, _arg2:int, _arg3:Boolean):void;
        function set onSendChat(_arg1:Function):void;
        function set onTextLink(_arg1:Function):void;
        function addMainShow(_arg1:String, _arg2:int, _arg3:Boolean):void;
        function set visibleFunction(_arg1:int):void;
        function set onCheckData(_arg1:Function):void;
        function set onSendFriendChat(_arg1:Function):void;
        function set getReceivePostList(_arg1:Array):void;
        function set getTownPlaySay(_arg1:Array):void;
        function set visiblePost(_arg1:Boolean):void;
        function set onSendTownFile(_arg1:Function):void;
        function set getPunishmentPostList(_arg1:String):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function set changePoint(_arg1:int):void;
        function set chatVisible(_arg1:Boolean):void;
        function get chatVisible():Boolean;

    }
}//package com.assist.view.interfaces 
