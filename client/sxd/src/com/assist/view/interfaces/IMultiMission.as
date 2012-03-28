//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IMultiMission {

        function get content():MovieClip;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function clear():void;
        function set onShowJoinTeamLimity(_arg1:Function):void;
        function set visibleSystemInfo(_arg1:Boolean):void;
        function set openFastJoin(_arg1:Boolean):void;
        function set renderSystemInfo(_arg1:String):void;
        function set onMinTarget(_arg1:Function):void;
        function set onTip(_arg1:Function):void;
        function set onClear(_arg1:Function):void;
        function set getJoinLimit(_arg1:Array):void;
        function set onJoinTeamLimit(_arg1:Function):void;
        function set getJoinTeamList(_arg1:Array):void;
        function set getJoinTeamData(_arg1:Object):void;
        function set onJoin(_arg1:Function):void;
        function set dropTeam(_arg1:int):void;
        function set getTeamMemberNum(_arg1:Object):void;
        function set getCreateLimit(_arg1:Array):void;
        function set onCreateTeam(_arg1:Function):void;
        function set getTeamListData(_arg1:Object):void;
        function set isAutoStart(_arg1:Boolean):void;
        function set onLeftTeam(_arg1:Function):void;
        function set onStart(_arg1:Function):void;
        function set onAutoStart(_arg1:Function):void;
        function set onKickedOutMember(_arg1:Function):void;
        function set onTeamLabel(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
