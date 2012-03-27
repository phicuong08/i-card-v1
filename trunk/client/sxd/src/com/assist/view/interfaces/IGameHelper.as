//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IGameHelper {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set power(_arg1:int):void;
        function set level(_arg1:int):void;
        function set onCampSalaryBtn(_arg1:Function):void;
        function set onDailyQuestBtn(_arg1:Function):void;
        function set onFateFreeBtn(_arg1:Function):void;
        function set onFateIngotBtn(_arg1:Function):void;
        function set onGetPeachBtn(_arg1:Function):void;
        function set onBuyPowerBtn(_arg1:Function):void;
        function set onMissionBtn(_arg1:Function):void;
        function set onRuneBtn(_arg1:Function):void;
        function set onSportBtn(_arg1:Function):void;
        function set onFactionBlessingBtn(_arg1:Function):void;
        function set onStroyPlayBtn(_arg1:Function):void;
        function set onTakeBibleBtn(_arg1:Function):void;
        function set onSendFlowerBtn(_arg1:Function):void;
        function set onFreeSealTrainingBtn(_arg1:Function):void;
        function set onCoinTreeBtn(_arg1:Function):void;
        function set onRollCakeBtn(_arg1:Function):void;
        function set onWorshipMarsBtn(_arg1:Function):void;
        function set onPetAnimalBtn(_arg1:Function):void;
        function set onSealStoneBtn(_arg1:Function):void;
        function set onBackBtn(_arg1:Function):void;
        function set onAchievementBtn(_arg1:Function):void;
        function render():void;
        function renderGameHelper(_arg1:Object):void;
        function clear():void;
        function updateSuperSportTime(_arg1:int):void;
        function updateTakeBibleTime(_arg1:int):void;

    }
}//package com.assist.view.interfaces 
