//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.base.*;

    public interface IMiniMap extends IContent {

        function set mapName(_arg1:String):void;
        function set worldVisible(_arg1:Boolean):void;
        function set settingVisible(_arg1:Boolean):void;
        function set showVisible(_arg1:Boolean):void;
        function set hideVisible(_arg1:Boolean):void;
        function set gameHelpVisible(_arg1:Boolean):void;
        function set onWorld(_arg1:Function):void;
        function set onSetting(_arg1:Function):void;
        function set onShow(_arg1:Function):void;
        function set onHide(_arg1:Function):void;
        function set onGameHelp(_arg1:Function):void;
        function set tip(_arg1:ITip):void;

    }
}//package com.assist.view.interfaces.map 
