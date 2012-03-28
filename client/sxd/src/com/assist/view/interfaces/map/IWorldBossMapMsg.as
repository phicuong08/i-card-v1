//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IWorldBossMapMsg extends IContent {

        function reposition():void;
        function reset():void;
        function get btnExp():DisplayObject;
        function get btnIngot():DisplayObject;
        function get btnReset():DisplayObject;
        function get btnCancel():DisplayObject;
        function get btnAutoJoin():MovieClip;
        function get mcAutoWar():MovieClip;
        function set killRank(_arg1:Array):void;
        function set bossName(_arg1:String):void;
        function set bossFrame(_arg1:int):void;
        function set lift(_arg1:int):void;
        function set liftMax(_arg1:int):void;
        function addHurtList(_arg1:Array):void;
        function set msgString(_arg1:String):void;
        function set timeString(_arg1:String):void;
        function set guwuString(_arg1:String):void;

    }
}//package com.assist.view.interfaces.map 
