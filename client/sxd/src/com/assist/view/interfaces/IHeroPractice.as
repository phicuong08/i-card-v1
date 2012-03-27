//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IHeroPractice {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set onClose(_arg1:Function):void;
        function set titleName(_arg1:String):void;
        function set onShowTip(_arg1:Function):void;
        function clear():void;
        function set onStartPractice(_arg1:Function):void;
        function set onContinuePractice(_arg1:Function):void;
        function set onQuitPractice(_arg1:Function):void;
        function set onQuickly(_arg1:Function):void;
        function set getPracticeInfoList(_arg1:Array):void;
        function set getPracticeInfoDownTimer(_arg1:int):void;
        function set getCurrentPower(_arg1:int):void;
        function set onIsQuickly(_arg1:Function):void;
        function set packNum(_arg1:int):void;
        function newBattleStart():void;
        function set cdTimer(_arg1:int):void;
        function set onStop(_arg1:Function):void;
        function set onPowerTip(_arg1:Function):void;
        function set continuePracticeInfo(_arg1:Object):void;
        function set autoBuyPowerState(_arg1:Boolean):void;
        function set onAutoBuyPower(_arg1:Function):void;
        function set onAutoBuyAward(_arg1:Function):void;
        function set autoBuyAwardState(_arg1:Boolean):void;
        function set isShowCheck(_arg1:Boolean):void;
        function set getLostPowerNum(_arg1:int):void;
        function set getBattleInfoList(_arg1:Array):void;
        function set onTextLink(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
