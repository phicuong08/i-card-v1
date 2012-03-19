//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.factionWar {
    import com.assist.view.interfaces.base.*;

    public interface IFactionMapMsg extends IContent {

        function reset():void;
        function toWait(_arg1:int):void;
        function toWar(_arg1:int):void;
        function toEnd(_arg1:Boolean, _arg2:Array):void;
        function addMsgShow(_arg1:String):void;
        function set TFName1(_arg1:String):void;
        function set TFLv1(_arg1:int):void;
        function set TFNum1(_arg1:int):void;
        function set TFName2(_arg1:String):void;
        function set TFLv2(_arg1:int):void;
        function set TFNum2(_arg1:int):void;
        function set TopIdx(_arg1:int):void;
        function set WinIdx(_arg1:int):void;
        function set onRankOK(_arg1:Function):void;
        function set onCancel(_arg1:Function):void;
        function set onCup(_arg1:Function):void;
        function set factionCount(_arg1:int):void;
        function reposition(_arg1:int, _arg2:int):void;

    }
}//package com.assist.view.interfaces.factionWar 
