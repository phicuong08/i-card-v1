//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IChooseRoles {

        function get content():Sprite;
        function set chooseRolesUrl(_arg1:String):void;
        function set tip(_arg1:ITip):void;
        function set onStart(_arg1:Function):void;
        function set error(_arg1:String):void;
        function init(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void;
        function clear():void;
        function set weiBoNickName(_arg1:String):void;
        function set weiBoGender(_arg1:String):void;

    }
}//package com.assist.view.interfaces 
