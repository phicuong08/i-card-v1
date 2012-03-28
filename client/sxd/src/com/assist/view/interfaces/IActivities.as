//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IActivities {

        function get content():MovieClip;
        function set buttonEffect(_arg1:Class):void;
        function set tip(_arg1:ITip):void;
        function set activityVisible(_arg1:Boolean):void;
        function set diffTime(_arg1:int):void;
        function getActivityPoint(_arg1:String):Point;
        function isAutoOpen(_arg1:Boolean):void;
        function autoActivityClick(_arg1:String):void;
        function set onActivityStart(_arg1:Function):void;
        function set onActivityTimerClick(_arg1:Function):void;
        function visibleBtnEffect(_arg1:String, _arg2:String, _arg3:Boolean):void;
        function set activityRuneNum(_arg1:int):void;
        function addActivity(_arg1:String):void;
        function removeActivity(_arg1:String):void;
        function activityTip(_arg1:String, _arg2:String):void;
        function isLoaderActivitie(_arg1:String):Boolean;
        function activityTimer(_arg1:String, _arg2:Object):void;
        function hideActivityTimer(_arg1:String, _arg2:String):void;
        function set onMinute(_arg1:Function):void;
        function playOpenFunctionMc(_arg1:Array):void;
        function set functionOpenPlayEnd(_arg1:Function):void;
        function clear():void;
        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;

    }
}//package com.assist.view.interfaces 
