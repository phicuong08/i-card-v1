//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface IUpgrade {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function render(_arg1:int, _arg2:int):void;
        function clear():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onLevelUpBtn(_arg1:Function):void;
        function set onEquipmentData(_arg1:Function):void;
        function set onFinishTimeBtn(_arg1:Function):void;
        function set onShowInsufficientCoins(_arg1:Function):void;
        function set finishTimer(_arg1:Object):void;
        function set onIngotUpgrade(_arg1:Function):void;
        function set onUpgradeAndClearCd(_arg1:Function):void;
        function set currentRoleID(_arg1:int):void;
        function get currentRoleID():int;
        function set pageCount(_arg1:int):void;
        function get pageCount():int;
        function set pageCurrent(_arg1:int):void;
        function get pageCurrent():int;
        function set previousEquipID(_arg1:int):void;
        function get previousEquipID():int;
        function get equipmentID():int;
        function set myLevel(_arg1:int):void;
        function set myCoins(_arg1:Number):void;
        function get isUpgradeAndClearCD():Boolean;
        function set isUpgradeAndClearCD(_arg1:Boolean):void;
        function renderEquipmentList(_arg1:Array):void;
        function renderUpgradeSuccess(_arg1:Object):void;
        function renderUpgradeUnSucess():void;
        function renderFinishTimeBtnClick():void;
        function renderFinishTimeBtnTip(_arg1:int):void;
        function renderRoleList(_arg1:Array):void;
        function showUpgrageMessage(_arg1:String, _arg2:uint):void;
        function updateCoins():void;
        function renderPerfectUpgrade(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces 
