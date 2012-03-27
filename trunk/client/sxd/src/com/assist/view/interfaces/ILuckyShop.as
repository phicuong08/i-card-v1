//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ILuckyShop {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function get itemID():int;
        function render():void;
        function clear():void;
        function renderItemList(_arg1:Array):void;
        function renderRefreshInfo(_arg1:Object):void;
        function renderLuckyRecordList(_arg1:Array):void;
        function renderBuyLuckyShopItem():void;
        function renderRefreshFail():void;
        function updateCdTime(_arg1:int):void;
        function set onCloseBtn(_arg1:Function):void;
        function set onRefreshBtn(_arg1:Function):void;
        function set onBuyBtn(_arg1:Function):void;
        function set onTextLink(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
