//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IPanelLoading {

        function get content():MovieClip;
        function setLoadingProgress(_arg1:int, _arg2:int=1, _arg3:int=1):void;
        function setLoadingText(_arg1:String):void;
        function init():void;

    }
}//package com.assist.view.interfaces 
