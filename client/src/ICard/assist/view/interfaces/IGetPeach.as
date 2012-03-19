//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.haloer.display.*;

    public interface IGetPeach {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function clear():void;
        function set onTip(_arg1:Function):void;
        function set onGetPeach(_arg1:Function):void;
        function set onBuyMonkeys(_arg1:Function):void;
        function peachInfo(_arg1:Object, _arg2:Boolean):void;
        function set playerInfo(_arg1:Object):void;
        function set summerWuKong(_arg1:int):void;
        function set buttenSuccess(_arg1:Object):void;
        function addWuKong(_arg1:Image):void;
        function addAnger(_arg1:Image):void;

    }
}//package com.assist.view.interfaces 
