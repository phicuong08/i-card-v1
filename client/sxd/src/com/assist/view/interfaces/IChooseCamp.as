//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IChooseCamp {

        function get content():MovieClip;
        function set onGotoTown(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function close():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;

    }
}//package com.assist.view.interfaces 
