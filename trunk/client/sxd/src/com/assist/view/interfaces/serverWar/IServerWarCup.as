//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.serverWar {
    import flash.display.*;
    import com.assist.view.info.*;
    import flash.text.*;
    import com.assist.view.interfaces.base.*;

    public interface IServerWarCup extends IContent {

        function init(_arg1:ServerWarInfo):void;
        function set onRecord(_arg1:Function):void;
        function set onSee(_arg1:Function):void;
        function set onRoleMsg(_arg1:Function):void;
        function set onPack(_arg1:Function):void;
        function set onUpgrade(_arg1:Function):void;
        function set onDeploy(_arg1:Function):void;
        function set onResearch(_arg1:Function):void;
        function set onFate(_arg1:Function):void;
        function set onSealSoul(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function set onBet(_arg1:Function):void;
        function set onTianBan(_arg1:Function):void;
        function set onDiBan(_arg1:Function):void;
        function set onLink(_arg1:Function):void;
        function set onChat(_arg1:Function):void;
        function get tfTime():TextField;
        function get chatMark():Sprite;
        function showMineRecord(_arg1:ServerWarInfo):void;
        function showSeeRecord(_arg1:ServerWarInfo):void;
        function reset():void;
        function closeBet():void;
        function get tfIngot():TextField;
        function get tfCoins():TextField;

    }
}//package com.assist.view.interfaces.serverWar 
