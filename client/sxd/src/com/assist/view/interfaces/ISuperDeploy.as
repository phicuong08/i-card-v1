//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ISuperDeploy {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set playerLevel(_arg1:int):void;
        function set playerSkill(_arg1:int):void;
        function set isPlayLevelUpCartoon(_arg1:Boolean):void;
        function set onLevelUp(_arg1:Function):void;
        function set onUpDeploy(_arg1:Function):void;
        function set onDownDeploy(_arg1:Function):void;
        function set onSaveShowOrder(_arg1:Function):void;
        function clear():void;
        function init():void;
        function renderDeploy(_arg1:Array, _arg2:Array, _arg3:Boolean):void;
        function renderDeployResearch(_arg1:Object):void;
        function clearRoleIcon():void;
        function clearDeployGrid():void;

    }
}//package com.assist.view.interfaces 
