//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.interfaces.base.*;

    public interface IPetLong extends IContent, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onCoin(_arg1:Function):void;
        function set onIngot(_arg1:Function):void;
        function set onUpLv(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function set playerVip(_arg1:int):void;
        function updatePet(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int, _arg7:int, _arg8:Boolean, _arg9:Boolean, _arg10:Boolean):void;

    }
}//package com.assist.view.interfaces 
