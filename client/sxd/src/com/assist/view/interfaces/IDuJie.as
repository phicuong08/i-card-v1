//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.interfaces.base.*;

    public interface IDuJie extends IContent, IDragTitleBar {

        function init(_arg1:Object, _arg2:Object, _arg3:Array):void;
        function set onOk(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function get selectRole():Object;
        function get selectLineup():int;

    }
}//package com.assist.view.interfaces 
