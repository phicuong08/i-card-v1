//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ILodge {

        function get content():MovieClip;
        function get lodgePlayer():MovieClip;
        function get fateMc():MovieClip;
        function set tip(_arg1:ITip):void;
        function close():void;
        function set loadImage(_arg1:Class):void;
        function set onClose(_arg1:Function):void;
        function set onOpenFate(_arg1:Function):void;
        function set renderIngot(_arg1:Number):void;
        function set isVip5(_arg1:Boolean):void;
        function set renderCoins(_arg1:Number):void;
        function set onFastFate(_arg1:Function):void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void;
        function setTextAnimation(_arg1:int, _arg2:String):void;
        function set fateNpcList(_arg1:Array):void;
        function set onStartFate(_arg1:Function):void;
        function set freeAppointTimes(_arg1:int):void;
        function set onBuyNpc(_arg1:Function):void;
        function set lootFateList(_arg1:Array):void;
        function set onPickUpFate(_arg1:Function):void;
        function set onSellFate(_arg1:Function):void;
        function set onAllSellFate(_arg1:Function):void;
        function set pickUpAllFate(_arg1:Array):void;
        function sellAllFate():void;
        function lootFateTempFateId(_arg1:int, _arg2:String, _arg3:int=0):void;
        function set addDesignated(_arg1:Object):void;
        function set clearDesignated(_arg1:int):void;

    }
}//package com.assist.view.interfaces 
