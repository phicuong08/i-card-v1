//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface IActivitiesShow {

        function get content():MovieClip;
        function closePanel():void;
        function addActivity(_arg1:Object):void;
        function removeActivity(_arg1:Object):void;
        function openPanel(_arg1:Point):void;
        function set onStartActivity(_arg1:Function):void;
        function get isOnStage():Boolean;
        function get isEmpty():Boolean;
        function set notCloseViewList(_arg1:Array):void;
        function set updatePoint(_arg1:Point):void;

    }
}//package com.assist.view.interfaces 
