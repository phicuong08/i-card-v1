//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;

    public interface IRanking {

        function get content():MovieClip;
        function render():void;
        function clear():void;
        function set onSecondRankingData(_arg1:Function):void;
        function set onRankingFieldData(_arg1:Function):void;
        function set onRankingData(_arg1:Function):void;
        function set onMyRankingBtn(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set playerID(_arg1:String):void;
        function get playerID():String;
        function set secondRankingID(_arg1:String):void;
        function get secondRankingID():String;
        function get firstRankingType():String;
        function set pageCurrent(_arg1:int):void;
        function get pageCurrent():int;
        function set pageCount(_arg1:int):void;

    }
}//package com.assist.view.interfaces 
