//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IZodiac {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set myLevel(_arg1:int):void;
        function get myLevel():int;
        function clear():void;
        function init():void;
        function renderZodiacInfo(_arg1:Object, _arg2:Boolean=false):void;
        function renderChallengeSuccess(_arg1:Object, _arg2:Object):void;
        function set onStartWar(_arg1:Function):void;
        function set onGoldOilShop(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
