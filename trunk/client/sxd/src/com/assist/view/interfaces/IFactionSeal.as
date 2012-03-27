//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.haloer.display.*;

    public interface IFactionSeal {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set playerID(_arg1:int):void;
        function set onCloseBtn(_arg1:Function):void;
        function set onCallPlayerBtn(_arg1:Function):void;
        function set onCallNpcBtn(_arg1:Function):void;
        function set onJoinBtn(_arg1:Function):void;
        function render():void;
        function clear():void;
        function renderFactionSealInfo(_arg1:Array, _arg2:int, _arg3:Boolean):void;
        function renderSealingCartoon(_arg1:Image):void;
        function renderSealedCartoon(_arg1:Image, _arg2:Function):void;

    }
}//package com.assist.view.interfaces 
