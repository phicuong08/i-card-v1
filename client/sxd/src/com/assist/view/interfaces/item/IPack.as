//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.item {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IPack extends IContent, IBoxPack, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onBtn1(_arg1:Function):void;
        function set onBtn2(_arg1:Function):void;
        function set onBtn3(_arg1:Function):void;
        function get Btn1():DisplayObject;
        function get Btn2():DisplayObject;
        function get Btn3():DisplayObject;
        function get BtnClose():DisplayObject;
        function updateBoxCount(_arg1:int):void;

    }
}//package com.assist.view.interfaces.item 
