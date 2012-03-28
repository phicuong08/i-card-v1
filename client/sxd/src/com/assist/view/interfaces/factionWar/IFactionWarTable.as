//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.factionWar {
    import flash.display.*;
    import com.assist.view.interfaces.base.*;

    public interface IFactionWarTable extends IContent, IDragTitleBar {

        function set onInto(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set cupObj(_arg1:Object):void;
        function set onSeeClick(_arg1:Function):void;
        function set buttonEffect(_arg1:Sprite):void;
        function set heroRank(_arg1:Array):void;
        function set heroRankTip(_arg1:String):void;
        function set onTextLink(_arg1:Function):void;
        function set intoVisible(_arg1:Boolean):void;
        function get jueSaiBtn():DisplayObject;

    }
}//package com.assist.view.interfaces.factionWar 
