//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.base.*;

    public interface IMiniMap extends IContent {

        function resetMap(_arg1:int, _arg2:int):void;
        function set mapName(_arg1:String):void;
        function set sublineInfo(_arg1:String):void;
        function removeAll():void;
        function moveMine(_arg1:Number, _arg2:Number):void;
        function addNPC(_arg1:Number, _arg2:Number, _arg3:int, _arg4:String):void;
        function setNpcQuest(_arg1:int, _arg2:Boolean):void;
        function setAllNpcQuest(_arg1:Object):void;
        function addPortal(_arg1:Number, _arg2:Number, _arg3:int):void;
        function addMine(_arg1:Number, _arg2:Number, _arg3:String):void;
        function set sublineVisible(_arg1:Boolean):void;
        function set worldVisible(_arg1:Boolean):void;
        function set settingVisible(_arg1:Boolean):void;
        function set showVisible(_arg1:Boolean):void;
        function set hideVisible(_arg1:Boolean):void;
        function set onLine(_arg1:Function):void;
        function set onWorld(_arg1:Function):void;
        function set onSetting(_arg1:Function):void;
        function set onShow(_arg1:Function):void;
        function set onHide(_arg1:Function):void;
        function set tip(_arg1:ITip):void;

    }
}//package com.assist.view.interfaces.map 
