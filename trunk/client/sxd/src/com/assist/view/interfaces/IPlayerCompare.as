//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IPlayerCompare {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function clear():void;
        function init(_arg1:String, _arg2:String):void;
        function renderResearchCompare(_arg1:Array, _arg2:Array):void;
        function renderFirstAttack(_arg1:Object, _arg2:Object):void;
        function renderAttrib(_arg1:Object, _arg2:Object):void;
        function renderFate(_arg1:Object, _arg2:Object):void;
        function renderRoleList(_arg1:Array, _arg2:Array):void;
        function set onResearchCompare(_arg1:Function):void;
        function set onFirstAttackCompare(_arg1:Function):void;
        function set onAttribCompare(_arg1:Function):void;
        function set onFateCompare(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
