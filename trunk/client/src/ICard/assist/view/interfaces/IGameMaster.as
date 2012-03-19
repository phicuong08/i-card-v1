//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IGameMaster {

        function get content():Sprite;
        function set nickName(_arg1:String):void;
        function set bbsUrl(_arg1:String):void;
        function set remainSubmitTimes(_arg1:int):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set alert(_arg1:IAlert):void;
        function set onClose(_arg1:Function):void;
        function init(_arg1:int):void;
        function clear():void;
        function set onSubmit(_arg1:Function):void;
        function set renderSubmitBug(_arg1:Array):void;
        function set onGetBugList(_arg1:Function):void;
        function set onSubmitAssess(_arg1:Function):void;
        function renderSubmitAssessComplete(_arg1:int):void;
        function set renderBugList(_arg1:Array):void;

    }
}//package com.assist.view.interfaces 
