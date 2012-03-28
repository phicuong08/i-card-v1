//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IAchievementComplete {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set onShowAchievement(_arg1:Function):void;
        function set onShowTownCartoon(_arg1:Function):void;
        function onMcButtonMouseClick():void;
        function show(_arg1:Object):void;
        function reposition(_arg1:Number, _arg2:Number):void;

    }
}//package com.assist.view.interfaces 
