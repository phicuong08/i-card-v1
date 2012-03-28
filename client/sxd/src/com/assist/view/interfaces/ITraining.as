//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface ITraining extends IContent, IDragTitleBar {

        function playSaveOK():void;
        function get radioIdx():int;
        function set onClose(_arg1:Function):void;
        function set onPeiyang(_arg1:Function):void;
        function set onSave(_arg1:Function):void;
        function set onCancel(_arg1:Function):void;
        function set radio(_arg1:int):void;
        function set headIcon(_arg1:Sprite):void;
        function get tfCoin():TextField;
        function get tfIngot1():TextField;
        function get tfIngot2():TextField;
        function get tfIngot3():TextField;
        function get tfIngot4():TextField;
        function get tfName():TextField;
        function get tfLv():TextField;
        function setProperty(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:String, _arg6:String, _arg7:int, _arg8:int, _arg9:int, _arg10:Boolean):void;

    }
}//package com.assist.view.interfaces 
