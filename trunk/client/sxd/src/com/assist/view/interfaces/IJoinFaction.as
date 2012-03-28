//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IJoinFaction {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function factionData(_arg1:Array, _arg2:int, _arg3:int, _arg4:String, _arg5:Boolean):void;
        function set onCreate(_arg1:Function):void;
        function set joinFactionType(_arg1:Boolean):void;
        function set onPage(_arg1:Function):void;
        function set onApplyIng(_arg1:Function):void;
        function set onApply(_arg1:Function):void;
        function set onSendFlower(_arg1:Function):void;
        function set onRevok(_arg1:Function):void;
        function set foundFactionCoin(_arg1:String):void;
        function set onSelect(_arg1:Function):void;
        function set onPk(_arg1:Function):void;
        function set getFactionPersonList(_arg1:Array):void;
        function set onCheckFaction(_arg1:Function):void;
        function set checkFactionData(_arg1:Object):void;
        function set onPersonCheck(_arg1:Function):void;
        function set onSendMessige(_arg1:Function):void;
        function set onAddFriend(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function clear():void;
        function close():void;

    }
}//package com.assist.view.interfaces 
