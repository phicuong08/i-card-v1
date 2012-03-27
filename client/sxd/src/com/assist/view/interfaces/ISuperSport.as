//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import flash.display.*;
    import flash.geom.*;

    public interface ISuperSport {

        function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void;
        function get content():MovieClip;
        function clear():void;
        function set onSealSoul(_arg1:Function):void;
        function set tip(_arg1:ITip):void;
        function set drag(_arg1:IDrag):void;
        function set loaderMap(_arg1:Object):void;
        function getAwardTimer(_arg1:int, _arg2:int):void;
        function set onSendFlower(_arg1:Function):void;
        function set isOpenFate(_arg1:Boolean):void;
        function set isOpenSealSoul(_arg1:Boolean):void;
        function set isVip4(_arg1:Boolean):void;
        function set getWinCountData(_arg1:String):void;
        function set getOpenTimer(_arg1:int):void;
        function set isShowGetAwardBtn(_arg1:Boolean):void;
        function set onGetAwardClick(_arg1:Function):void;
        function set getPlayerData(_arg1:Object):void;
        function set getNoticeData(_arg1:Object):void;
        function set renderIngot(_arg1:int):void;
        function set renderCoins(_arg1:Number):void;
        function set onClose(_arg1:Function):void;
        function set onCharacter(_arg1:Function):void;
        function set onPack(_arg1:Function):void;
        function set onUpgrade(_arg1:Function):void;
        function set onResearch(_arg1:Function):void;
        function set onDeploy(_arg1:Function):void;
        function set onFate(_arg1:Function):void;
        function set onAwardCount(_arg1:Function):void;
        function set getChallengePersonList(_arg1:Array):void;
        function set getBuyChallengeData(_arg1:Object):void;
        function set onChallengePerson(_arg1:Function):void;
        function set onClearCdTimer(_arg1:Function):void;
        function set onAddChallenge(_arg1:Function):void;
        function set getChallengeNum(_arg1:int):void;
        function set getClearTimer(_arg1:int):void;
        function set getNewSportWarReport(_arg1:Object):void;
        function set getSportReportList(_arg1:Array):void;
        function set onTextLink(_arg1:Function):void;
        function set onAddFriend(_arg1:Function):void;
        function set getHeroBoxList(_arg1:Array):void;
        function set onCheckHero(_arg1:Function):void;

    }
}//package com.assist.view.interfaces 
