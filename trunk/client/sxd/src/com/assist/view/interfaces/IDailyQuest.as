//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IDailyQuest {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function clear():void;
        function render():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set serverTime(_arg1:int):void;
        function get questID():int;
        function set onAbortBtn(_arg1:Function):void;
        function set onAcceptBtn(_arg1:Function):void;
        function set onCompleteBtn(_arg1:Function):void;
        function set onImmeCompleteBtn(_arg1:Function):void;
        function set onRefreshBtn(_arg1:Function):void;
        function set onFullStarBtn(_arg1:Function):void;
        function renderDailyQuestInfo(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
