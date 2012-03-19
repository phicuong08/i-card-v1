//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.item.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface IRoleMsgSee extends IContent, IBoxPack, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onLabel(_arg1:Function):void;
        function set onSeeRoleInfo(_arg1:Function):void;
        function set onStrength(_arg1:Function):void;
        function set onFlowers(_arg1:Function):void;
        function get selected():RoleInfo;
        function initHeroNameList(_arg1:Array):void;
        function updateRoleMsg():void;
        function set onTip(_arg1:Function):void;
        function get bodyCanvas():Sprite;
        function get mcFlowers():Sprite;
        function get mcFate():Sprite;
        function get mcFateText():TextField;
        function get tfDuJie():TextField;

    }
}//package com.assist.view.interfaces 
