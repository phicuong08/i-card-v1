//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IResearch {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function init():void;
        function clear():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set dialog(_arg1:IAlert):void;
        function set onLevelUpBtn(_arg1:Function):void;
        function set iconUrl(_arg1:String):void;
        function get researchID():int;
        function set onResearchData(_arg1:Function):void;
        function set mySkill(_arg1:int):void;
        function get mySkill():int;
        function set myLevel(_arg1:int):void;
        function renderGetResearchData(_arg1:Array):void;
        function renderLevelUpBtnClick(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
