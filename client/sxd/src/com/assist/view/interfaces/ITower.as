//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.base.*;

    public interface ITower extends IContent, IDragTitleBar {

        function initData(_arg1:TowerInfo):void;
        function updateInfo(_arg1:int=0):void;
        function set onWar(_arg1:Function):void;
        function set onAuto(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onReset(_arg1:Function):void;
        function set onStop(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function set onGoToNext(_arg1:Function):void;
        function set onTownClick(_arg1:Function):void;
        function set hideTowerVisible(_arg1:Boolean):void;
        function get autoSellL():Boolean;
        function get autoSellZ():Boolean;

    }
}//package com.assist.view.interfaces 
