//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.interfaces.base.*;

    public interface ITraining extends IContent, IDragTitleBar {

        function initShow(_arg1:String, _arg2:int, _arg3:String, _arg4:int):void;
        function setOldProperty(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int):void;
        function setNewProperty(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int):void;
        function clearNewProperty():void;
        function playSaveOK():void;
        function set radioIdx(_arg1:int):void;
        function get radioIdx():int;
        function set onClose(_arg1:Function):void;
        function set onPeiyang(_arg1:Function):void;
        function set onSave(_arg1:Function):void;
        function set onCancel(_arg1:Function):void;
        function set coin(_arg1:int):void;
        function set radio(_arg1:int):void;
        function showPeiyang():void;
        function showSave():void;

    }
}//package com.assist.view.interfaces 
