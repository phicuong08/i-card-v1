//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.serverWar {
    import flash.display.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface IServerWarSignUp extends IContent, IDragTitleBar {

        function set onSignUp(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function get tfSignUp():TextField;
        function get tfRule():TextField;
        function get tfGift():TextField;
        function get tfTitle():TextField;
        function get tfRuleHead():TextField;
        function get btnSignup():DisplayObject;
        function get tfServerWar():TextField;
        function initSeeWorld(_arg1:String, _arg2:Array, _arg3:Sprite):void;

    }
}//package com.assist.view.interfaces.serverWar 
