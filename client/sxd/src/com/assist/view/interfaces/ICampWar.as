//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface ICampWar {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set onJoinWar(_arg1:Function):void;
        function set onExitWar(_arg1:Function):void;
        function set onIngotInspire(_arg1:Function):void;
        function set onSkillInspire(_arg1:Function):void;
        function set onTextLink(_arg1:Function):void;
        function set drag(_arg1:IDrag):void;
        function set tip(_arg1:ITip):void;
        function set playerLevel(_arg1:int):void;
        function set playerID(_arg1:int):void;
        function get WarReportType():int;
        function get autoJoin():Boolean;
        function clear():void;
        function render():void;
        function renderShuShanInfo(_arg1:Object):void;
        function renderKunLunInfo(_arg1:Object):void;
        function renderWinningList(_arg1:Object):void;
        function renderPlayerCampWarInfo(_arg1:Object):void;
        function renderCampWarEndTime(_arg1:String):void;
        function renderWarReportList(_arg1:Array, _arg2:Array):void;
        function renderWarReport(_arg1:Array, _arg2:Array, _arg3:Array):void;
        function renderJoinWar(_arg1:int):void;
        function renderExitWar():void;
        function renderCanJoinWar():void;
        function renderIntegral(_arg1:Object):void;
        function renderCampLevelArea(_arg1:Array):void;
        function renderBuyBuffSuccess(_arg1:String):void;
        function renderBuyBuffFail(_arg1:String):void;
        function updateSkill(_arg1:int):void;
        function renderBuff(_arg1:Object):void;
        function loadBtnCartoon(_arg1:Array):void;
        function renderPlayer(_arg1:Object, _arg2:String):void;
        function renderPlayerList(_arg1:Array, _arg2:String):void;
        function renderAutoJoin():void;
        function setShuShanPlayerList():void;
        function setKunLunPlayerList():void;

    }
}//package com.assist.view.interfaces 
