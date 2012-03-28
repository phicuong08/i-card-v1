//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.base.*;

    public interface IDramaPlayBack extends IContent, IDragTitleBar {

        function initData(_arg1:Function, _arg2:Function, _arg3:XML):void;
        function set onClose(_arg1:Function):void;
        function set onSelect(_arg1:Function):void;

    }
}//package com.assist.view.interfaces.map 
