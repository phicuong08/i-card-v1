//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface ILogin {

        function get content():MovieClip;
        function set onLogin(_arg1:Function):void;
		function set onReg(_arg1:Function):void;
		function get usrName():String;
		function get usrPwd():String;

    }
}//package com.assist.view.interfaces 
