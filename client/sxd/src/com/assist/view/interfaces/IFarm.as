//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IFarm {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function render():void;
        function clear():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set myIngot(_arg1:int):void;
        function set cropIconUrl(_arg1:String):void;
        function set onCanPlantCrop(_arg1:Function):void;
        function set onFullStar(_arg1:Function):void;
        function set onOpenField(_arg1:Function):void;
        function set onPlantCrop(_arg1:Function):void;
        function set onFarmData(_arg1:Function):void;
        function set onPlantRole(_arg1:Function):void;
        function set onRefreshCrop(_arg1:Function):void;
        function set onHarvest(_arg1:Function):void;
        function set onFieldCdBtn(_arg1:Function):void;
        function set onBuyCoinTreeBtn(_arg1:Function):void;
        function set onShowTip(_arg1:Function):void;
        function set onFieldLevelUp(_arg1:Function):void;
        function set onIngotForFarmland(_arg1:Function):void;
        function set onBatPlant(_arg1:Function):void;
        function set onIsChristmas(_arg1:Function):void;
        function set onIsTreePlantingDay(_arg1:Function):void;
        function set cropID(_arg1:int):void;
        function get cropID():int;
        function set fieldID(_arg1:int):void;
        function get fieldID():int;
        function set roleID(_arg1:int):void;
        function get roleID():int;
        function set myLevel(_arg1:int):void;
        function get myLevel():int;
        function get isInPlanting():Boolean;
        function renderFarmData(_arg1:Array):void;
        function renderCanPlantCrop(_arg1:Object, _arg2:Array):void;
        function renderPlantRole(_arg1:Array):void;
        function renderPlantCrop(_arg1:Array):void;
        function renderRefreshCrop(_arg1:Object):void;
        function renderFullStar(_arg1:Object):void;
        function renderOpenField(_arg1:Object):void;
        function renderHarvest(_arg1:Object, _arg2:String):void;
        function renderClearFarmlandCd(_arg1:int):void;
        function renderCoinTreeCountInfo(_arg1:Object):void;
        function renderIngotForFarmland(_arg1:Object):void;
        function renderFieldLevelUp(_arg1:int):void;
        function updateFieldCd():void;
        function updateCoinTreeCd(_arg1:int):void;
        function updateCoinTreeCount(_arg1:int):void;

    }
}//package com.assist.view.interfaces 
