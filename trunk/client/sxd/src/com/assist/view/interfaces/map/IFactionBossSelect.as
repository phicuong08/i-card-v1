//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.display.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface IFactionBossSelect extends IContent, IDragTitleBar {

        function setSelectAB(_arg1:int=5, _arg2:int=6):void;
        function getTF(_arg1:int):TextField;
        function getMC(_arg1:int):MovieClip;
        function set See(_arg1:Boolean):void;
        function set onClose(_arg1:Function):void;
        function set onOk(_arg1:Function):void;

    }
}//package com.assist.view.interfaces.map 
