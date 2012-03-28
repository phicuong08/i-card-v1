//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IDeploy {

        function get content():MovieClip;
        function playerData(_arg1:Array):void;
        function set isShowSequence(_arg1:Boolean):void;
        function set onShowSequence(_arg1:Function):void;
        function set deforeShowSequence(_arg1:Boolean):void;
        function set isOpenResearch(_arg1:Boolean):void;
        function set onClearCdTimer(_arg1:Function):void;
        function set onUpLevelHandler(_arg1:Function):void;
        function set downTimer(_arg1:int):void;
        function deployInfo(_arg1:Array):void;
        function openDeploy(_arg1:Array):void;
        function set getFirstAttack(_arg1:int):void;
        function set onUpDeploy(_arg1:Function):void;
        function set onDownDeploy(_arg1:Function):void;
        function set onDefault(_arg1:Function):void;
        function set onDeploy(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function clear():void;
        function set onClose(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
