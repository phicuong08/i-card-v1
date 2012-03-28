//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IProgressBar {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function show(_arg1:String, _arg2:int, _arg3:Function):void;
        function clear():void;

    }
}//package com.assist.view.interfaces 
