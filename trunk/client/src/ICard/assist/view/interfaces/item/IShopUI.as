//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.item {
    import com.assist.view.interfaces.base.*;

    public interface IShopUI extends IContent, IBoxPack, IDragTitleBar {

        function initPage(_arg1:int, _arg2:int):void;
        function set tab(_arg1:int):void;
        function get tab():int;
        function set onClose(_arg1:Function):void;
        function set onPageCilck(_arg1:Function):void;
        function set onTabCilck(_arg1:Function):void;

    }
}//package com.assist.view.interfaces.item 
