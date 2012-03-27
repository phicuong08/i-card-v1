//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IRune {

        function get content():MovieClip;
        function set onRuneSure(_arg1:Function):void;
        function set onBatchRune(_arg1:Function):void;
        function set onSetAutoRune(_arg1:Function):void;
        function set isVip6(_arg1:Boolean):void;
        function set isVip10(_arg1:Boolean):void;
        function set batchRuneData(_arg1:Object):void;
        function set autoRuneInfo(_arg1:Object):void;
        function set runeInfo(_arg1:String):void;
        function set sureBtnShow(_arg1:Boolean):void;
        function set upGrade(_arg1:int):void;
        function set onClose(_arg1:Function):void;
        function close():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;

    }
}//package com.assist.view.interfaces 
