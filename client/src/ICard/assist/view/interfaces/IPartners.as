//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IPartners {

        function get content():MovieClip;
        function set onCloseBtn(_arg1:Function):void;
        function clear():void;
        function render():void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function get partnersJobType():int;
        function set isOpenSport(_arg1:Boolean):void;
        function set onPartnersData(_arg1:Function):void;
        function set onPageBtn(_arg1:Function):void;
        function set roleIconUrl(_arg1:String):void;
        function set onPartnersItemBtn(_arg1:Function):void;
        function set pageCount(_arg1:int):void;
        function get pageCount():int;
        function set pageCurrent(_arg1:int):void;
        function get pageCurrent():int;
        function get partnersID():int;
        function renderPartnersList(_arg1:Array):void;
        function renderRecruitCount(_arg1:Object):void;
        function setDataBtn(_arg1:Array):void;
        function setPlayerInfo(_arg1:Object):void;

    }
}//package com.assist.view.interfaces 
