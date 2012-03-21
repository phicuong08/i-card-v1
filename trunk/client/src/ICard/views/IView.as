//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {

    public interface IView {

        function get sign():String;
        function get inStage():Boolean;
        function get inStageWithTip():Boolean;
        function get ignoreKeyboardEvent():Boolean;
        function show():void;
        function close():void;
        function clear():void;

    }
}//package com.views 
