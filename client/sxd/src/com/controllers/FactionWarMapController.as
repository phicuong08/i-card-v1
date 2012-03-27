//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import flash.utils.*;
    import com.assist.data.mission.*;

    public class FactionWarMapController extends Base {

        public function get result():int{
            return (_data.factionWarMap.result);
        }
        public function get signupState():int{
            return (_data.factionWarMap.signupState);
        }
        public function get intoTime():int{
            var _local1:int = int(((_data.factionWarMap.intoTime - getTimer()) / 1000));
            return (_local1);
        }
        public function get warTime():int{
            var _local1:int = int(((_data.factionWarMap.warTime - getTimer()) / 1000));
            if (_local1 < 0){
                _local1 = 0;
            };
            return (_local1);
        }
        public function get heroRank():Array{
            return (_data.factionWarMap.heroRank);
        }
        public function get heroRankTip():String{
            return (_data.factionWarMap.heroRankTip);
        }
        public function get canSignup():int{
            return (_data.factionWarMap.canSignup);
        }
        public function get isSignup():int{
            return (_data.factionWarMap.isSignup);
        }
        public function get signupTip():String{
            return (_data.factionWarMap.signupTip);
        }
        public function get signupList():Array{
            return (_data.factionWarMap.signupList);
        }
        public function get warTownId():int{
            return (_data.factionWarMap.warTownId);
        }
        public function get warMapList():Array{
            return (_data.factionWarMap.warMapList);
        }
        public function get roundWarIdx():int{
            return (_data.factionWarMap.roundWarIdx);
        }
        public function get roundWarName():String{
            return (_data.factionWarMap.roundWarName);
        }
        public function get warStatusList():Array{
            var _local1:Array = _data.factionWarMap.warStatusList;
            _data.factionWarMap.warStatusList = [];
            return (_local1);
        }
        public function get killRank():Array{
            return (_data.factionWarMap.killRank);
        }
        public function get winId():int{
            return (_data.factionWarMap.winId);
        }
        public function get cupObj():Object{
            return (_data.factionWarMap.cupObj);
        }
        public function get overChatMsg():String{
            return (_data.factionWarMap.overChatMsg);
        }
        public function get overWorldMsg():String{
            return (_data.factionWarMap.overWorldMsg);
        }
        public function get giftList():Array{
            var _local2:Array;
            var _local1:Array = [];
            for each (_local2 in _data.factionWarMap.giftList) {
                _local1.push(_local2[1]);
            };
            return (_local1);
        }
        public function getGiftIdForName(_arg1:String):int{
            var _local2:Array;
            for each (_local2 in _data.factionWarMap.giftList) {
                if (_local2[1] == _arg1){
                    return (_local2[0]);
                };
            };
            return (0);
        }
        public function get showWorld():Array{
            var _local1:Array = _data.factionWarMap.worldNotice;
            _data.factionWarMap.worldNotice = [];
            return (_local1);
        }
        public function get chatWorld():Array{
            var _local1:Array = _data.factionWarMap.chatWorld;
            _data.factionWarMap.chatWorld = [];
            return (_local1);
        }
        public function get chatFaction():Array{
            var _local1:Array = _data.factionWarMap.chatFaction;
            _data.factionWarMap.chatFaction = [];
            return (_local1);
        }
        public function get winWinPlayerId():int{
            return (_data.factionWarMap.warWinPlayerId);
        }
        public function get warData():WarData{
            var _local1:WarData = _data.factionWarMap.warDataList.shift();
            return (_local1);
        }
        public function get awardData():Array{
            var _local1:Array = _data.factionWarMap.warAwardList.shift();
            return (_local1);
        }
        public function get hasWarData():Boolean{
            return ((_data.factionWarMap.warDataList.length > 0));
        }

    }
}//package com.controllers 
