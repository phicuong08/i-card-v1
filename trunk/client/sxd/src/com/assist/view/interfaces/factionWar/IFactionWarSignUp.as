//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.factionWar {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IFactionWarSignUp extends IContent, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onSignUp(_arg1:Function):void;
        function set onSee(_arg1:Function):void;
        function set btnSignUpVisible(_arg1:Boolean):void;
        function set TFNumMsg(_arg1:String):void;
        function get btnWin1():DisplayObject;
        function get btnWin2():DisplayObject;

    }
}//package com.assist.view.interfaces.factionWar 
