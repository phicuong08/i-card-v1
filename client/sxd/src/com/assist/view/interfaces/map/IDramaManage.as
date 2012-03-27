//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import com.assist.view.interfaces.base.*;

    public interface IDramaManage extends IContent {

        function get toWar():Boolean;
        function set closeVisible(_arg1:Boolean):void;
        function initXMLUrl(_arg1:String, _arg2:String, _arg3:String, _arg4:String):void;
        function play(_arg1:Function=null, _arg2:Function=null):void;
        function actionBackMask(_arg1:Number=0):void;

    }
}//package com.assist.view.interfaces.map 
