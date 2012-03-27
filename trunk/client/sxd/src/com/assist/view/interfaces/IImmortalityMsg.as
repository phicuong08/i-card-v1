//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.base.*;

    public interface IImmortalityMsg extends IContent, IDragTitleBar {

        function initData(_arg1:ImmortalityInfo):void;
        function set onClose(_arg1:Function):void;
        function set onWuLi(_arg1:Function):void;
        function set onJueJi(_arg1:Function):void;
        function set onFaShu(_arg1:Function):void;
        function set onFuYong(_arg1:Function):void;
        function get icons():Array;
        function get addList():Array;

    }
}//package com.assist.view.interfaces 
