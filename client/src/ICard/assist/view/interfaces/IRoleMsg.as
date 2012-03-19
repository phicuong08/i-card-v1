//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.item.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface IRoleMsg extends IContent, IBoxPack, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onLabel(_arg1:Function):void;
        function set onTraining(_arg1:Function):void;
        function set onFate(_arg1:Function):void;
        function set onFire(_arg1:Function):void;
        function set onGenSui(_arg1:Function):void;
        function set onDanYao(_arg1:Function):void;
        function set onFlower(_arg1:Function):void;
        function set onChuanCheng(_arg1:Function):void;
        function set onSeeRoleInfo(_arg1:Function):void;
        function set onYaoQing(_arg1:Function):void;
        function set onDuJie(_arg1:Function):void;
        function set onDuJieAdd(_arg1:Function):void;
        function get selected():RoleInfo;
        function initHeroNameList(_arg1:Array):void;
        function updateRoleMsg():void;
        function set onTip(_arg1:Function):void;
        function get btnTraining():DisplayObject;
        function get mcFate():Sprite;
        function get btnDueJie():DisplayObject;
        function get tfFate():TextField;
        function get mcFame():Sprite;
        function get bodyCanvas():Sprite;
        function resetDuJie():void;
        function updateDuJie(_arg1:int, _arg2:String, _arg3:int):void;
        function get dujieAddBtn():DisplayObject;
        function get dujieBtn():DisplayObject;

    }
}//package com.assist.view.interfaces 
