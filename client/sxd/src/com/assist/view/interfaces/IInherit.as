//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IInherit {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function init(_arg1:int):void;
        function clear():void;
        function set onClose(_arg1:Function):void;
        function set onDrugInherit(_arg1:Function):void;
        function set onDrugBeInherit(_arg1:Function):void;
        function set onInherit(_arg1:Function):void;
        function set onRoleInheritChoose(_arg1:Function):void;
        function set onRoleBeInheritChoose(_arg1:Function):void;
        function set onIngotLevelCheck(_arg1:Function):void;
        function set onShwoDialog(_arg1:Function):void;
        function renderRoleInheritList(_arg1:Array):void;
        function renderRoleBeInheritList(_arg1:Array):void;
        function renderRoleCompare(_arg1:Object, _arg2:Object, _arg3:Array):void;
        function renderInheritSuccess():void;

    }
}//package com.assist.view.interfaces 
