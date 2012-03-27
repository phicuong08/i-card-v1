//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IHeroMission {

        function get content():MovieClip;
        function set onClose(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set isShowPractice(_arg1:Boolean):void;
        function set onPractice(_arg1:Function):void;
        function autoMissionId(_arg1:int, _arg2:String, _arg3:int):void;
        function set onRefresh(_arg1:Function):void;
        function set getRefreshData(_arg1:Object):void;
        function clear():void;
        function set onStartMission(_arg1:Function):void;
        function set onChangeTown(_arg1:Function):void;
        function set getTownIdList(_arg1:Array):void;
        function set getTownInfo(_arg1:Object):void;
        function set onRefreshHeroMission(_arg1:Function):void;
        function set townHeroMission(_arg1:Array):void;
        function set openHeroMission(_arg1:Array):void;

    }
}//package com.assist.view.interfaces 
