//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IMyFaction {

        function get content():MovieClip;
        function clear():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set getFactionData(_arg1:Object):void;
        function set onSendFlower(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onTanHe(_arg1:Function):void;
        function set onOpenJoinFaction(_arg1:Function):void;
        function set onOpenSsembly(_arg1:Function):void;
        function set onShowPerson(_arg1:Function):void;
        function set onShowLog(_arg1:Function):void;
        function set onReturnTown(_arg1:Function):void;
        function set isInAssembly(_arg1:Boolean):void;
        function set onShowAudit(_arg1:Function):void;
        function set onAllRefuse(_arg1:Function):void;
        function set onPk(_arg1:Function):void;
        function set onPersonCheck(_arg1:Function):void;
        function set onSendMessige(_arg1:Function):void;
        function set onQuit(_arg1:Function):void;
        function set onAddFriend(_arg1:Function):void;
        function set onAppointJob(_arg1:Function):void;
        function set onkickoutMember(_arg1:Function):void;
        function set onDismissJob(_arg1:Function):void;
        function set getFactionPersonList(_arg1:Array):void;
        function set getFactionLogList(_arg1:Array):void;
        function set getFactionApplyList(_arg1:Array):void;
        function set onTextLink(_arg1:Function):void;
        function set onRefuse(_arg1:Function):void;
        function set onThrough(_arg1:Function):void;
        function set onTransferFaction(_arg1:Function):void;
        function set disMissBool(_arg1:String):void;
        function set onDismissSure(_arg1:Function):void;
        function set onDescInfo(_arg1:Function):void;
        function set onNoticeInfo(_arg1:Function):void;
        function set onGroupNumber(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
