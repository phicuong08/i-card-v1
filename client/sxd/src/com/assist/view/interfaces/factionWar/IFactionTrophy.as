//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.factionWar {
    import com.assist.view.interfaces.base.*;

    public interface IFactionTrophy extends IContent, IDragTitleBar {

        function set onOK(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function get select1():String;
        function get select2():String;
        function get select3():String;
        function resetSelect(_arg1:Array):void;

    }
}//package com.assist.view.interfaces.factionWar 
