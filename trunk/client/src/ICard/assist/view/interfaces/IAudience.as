//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IAudience {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onGetAudience(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set audienceData(_arg1:Object):void;
        function close():void;
        function set isOpenPk(_arg1:Boolean):void;
        function set onChatShow(_arg1:Function):void;
        function set onShowPerson(_arg1:Function):void;
        function set onButtleFriend(_arg1:Function):void;
        function set onMoveFriend(_arg1:Function):void;
        function set onSendFlower(_arg1:Function):void;
        function set isOnLine(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
