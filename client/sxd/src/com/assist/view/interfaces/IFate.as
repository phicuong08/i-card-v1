//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IFate {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set fatePower(_arg1:int):void;
        function set onClose(_arg1:Function):void;
        function set isVip5(_arg1:Boolean):void;
        function set loadImage(_arg1:Class):void;
        function close():void;
        function set onMergeAll(_arg1:Function):void;
        function reposition(_arg1:Point):void;
        function hideShive():void;
        function set onOpenLodge(_arg1:Function):void;
        function set onCheckPlayer(_arg1:Function):void;
        function getPlayerList(_arg1:Array, _arg2:int):void;
        function set getFateGridList(_arg1:Array):void;
        function set getPlayerFate(_arg1:Array):void;
        function set onSendType(_arg1:Function):void;
        function set onBuyFateGrid(_arg1:Function):void;
        function upPlayerLive():void;
        function preload():void;
        function set isShowExchange(_arg1:Boolean):void;
        function FragmentNum(_arg1:int):void;
        function set onExchange(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
