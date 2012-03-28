//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.haloer.net.*;
    import flash.geom.*;
    import com.assist.data.mission.*;

    public interface IWar {

        function set isAdvancedTester(_arg1:Boolean):void;
        function get content():Sprite;
        function set inGame(_arg1:Boolean):void;
        function set isStrategy(_arg1:Boolean):void;
        function set warType(_arg1:String):void;
        function set tip(_arg1:ITip):void;
        function set alert(_arg1:IAlert):void;
        function get width():Number;
        function get height():Number;
        function set playerId(_arg1:int):void;
        function set nickName(_arg1:String):void;
        function set roleId(_arg1:int):void;
        function set playerRoleId(_arg1:int):void;
        function set mainRoleStunt(_arg1:Object):void;
        function set warData(_arg1:WarData):void;
        function set warIcon(_arg1:Bitmap):void;
        function set background(_arg1:BitmapData):void;
        function set warResources(_arg1:File):void;
        function set roleBitmapDatas(_arg1:Object):void;
        function set assetsUrl(_arg1:String):void;
        function set iconsUrl(_arg1:String):void;
        function get iconsUrl():String;
        function set goodsIconUrl(_arg1:String):void;
        function get goodsIconUrl():String;
        function set reportUrl(_arg1:String):void;
        function set autoClose(_arg1:Boolean):void;
        function set copyReportEnabled(_arg1:Boolean):void;
        function set onSendChat(_arg1:Function):void;
        function set onCopy(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onWin(_arg1:Function):void;
        function set sportDetailUrl(_arg1:String):void;
        function set sportDetailData(_arg1:Object):void;
        function set onSportDetail(_arg1:Function):void;
        function set onSportDetailLink(_arg1:Function):void;
        function set sportReportUrl(_arg1:String):void;
        function set sportAwardText(_arg1:String):void;
        function set autoWar(_arg1:Boolean):void;
        function init():void;
        function replay():void;
        function close():void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;

    }
}//package com.assist.view.interfaces 
