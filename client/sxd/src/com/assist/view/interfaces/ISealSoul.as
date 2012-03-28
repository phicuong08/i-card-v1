//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface ISealSoul {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function reposition(_arg1:Point):void;
        function set onOpenSoulShop(_arg1:Function):void;
        function clear():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onChange(_arg1:Function):void;
        function set isSave(_arg1:Boolean):void;
        function isLockOn(_arg1:int, _arg2:Boolean):void;
        function set onMove(_arg1:Function):void;
        function set getSuccinctNum(_arg1:int):void;
        function set getStoneNum(_arg1:int):void;
        function set onSaveSoul(_arg1:Function):void;
        function set showTip(_arg1:Function):void;
        function set onSuccinct(_arg1:Function):void;
        function set getOpenNum(_arg1:int):void;
        function set onLock(_arg1:Function):void;
        function set onUnLock(_arg1:Function):void;
        function set onActivation(_arg1:Function):void;
        function set onBuy(_arg1:Function):void;
        function set onShowChat(_arg1:Function):void;
        function set isLevel5(_arg1:Boolean):void;
        function init():void;
        function set onShowBatchTraining(_arg1:Function):void;
        function set onHideBatchTraining(_arg1:Function):void;
        function hideTraining():void;
        function set onCloseTraining(_arg1:Function):void;
        function set onSave(_arg1:Function):void;
        function set onTraining(_arg1:Function):void;
        function set getbatchTrainingList(_arg1:Array):void;
        function buyLoadData():void;
        function LoadData():void;
        function resetLive():void;
        function set onCheckPlayer(_arg1:Function):void;
        function getPlayerList(_arg1:Array, _arg2:int):void;
        function set getWeaponList(_arg1:Array):void;
        function set getPlayerWeaponInfo(_arg1:Object):void;
        function set getJobToSealSoul(_arg1:String):void;
        function set getSealSoulList(_arg1:Array):void;

    }
}//package com.assist.view.interfaces 
