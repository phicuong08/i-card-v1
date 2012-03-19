//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.base.*;

    public interface IDramaManage extends IContent {

        function get toWar():Boolean;
        function initXMLUrl(_arg1:String, _arg2:String, _arg3:String, _arg4:String):void;
        function play(_arg1:Boolean, _arg2:Function=null, _arg3:Function=null):void;
        function set closeVisible(_arg1:Boolean):void;

    }
}//package com.assist.view.interfaces.map 
