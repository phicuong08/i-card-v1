//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.data.mission.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.datas.*;

    public class FactionWarMapData extends Base {

        public var result:int = 0;
        public var canSignup:int = 0;
        public var isSignup:int = 0;
        public var signupTip:String = "";
        public var signupState:int = 0;
        public var signupCoins:int = 100000;
        public var signupNum:int = 0;
        public var signupList:Array;
        public var warId:int = 1;
        public var warTownId:int = 17;
        public var intoCan:int = 0;
        public var intoTime:int = 0;
        public var warTime:int = 0;
        public var warCount:int = 0;
        public var warRound:int = 0;
        public var warStatusList:Array;
        public var warMapList:Array;
        public var id1:int = 0;
        public var id2:int = 0;
        public var id:int = 0;
        public var killRank:Array;
        public var killTip:String = "";
        public var winId:int = 0;
        public var heroRank:Array;
        public var heroRankTip:String = "";
        public var cupObj:Object;
        public var warWinPlayerId:int;
        public var warDataList:Array;
        public var warAwardList:Array;
        public var overWorldMsg:String = "";
        public var overChatMsg:String = "";
        public var giftList:Array;
        public var chatWorld:Array;
        public var chatFaction:Array;
        public var worldNotice:Array;

        public function FactionWarMapData(){
            this.signupList = [];
            this.warStatusList = [];
            this.warMapList = [];
            this.killRank = [];
            this.heroRank = [];
            this.cupObj = {};
            this.warDataList = [];
            this.warAwardList = [];
            this.giftList = [];
            this.chatWorld = [];
            this.chatFaction = [];
            this.worldNotice = [];
            super();
        }
        public function notify_status(_arg1:Array):void{
            this.signupState = _arg1[0];
        }
        public function get_faction_war_list(_arg1:Array):void{
            var _local2:Array;
            this.canSignup = _arg1[0];
            this.isSignup = _arg1[1];
            for each (_local2 in _arg1[2]) {
                if (_local2[2] == 1){
                    this.warId = _local2[0];
                    this.warTownId = _local2[1];
                    this.signupCoins = _local2[3];
                    this.signupNum = _local2[4];
                    break;
                };
            };
            if (this.isSignup != 0){
                this.signupTip = (Lang.sprintf(FactionWarMapDataLang.SignUpNum, this.signupNum) + HtmlText.green(FactionWarMapDataLang.SignUpYes));
            } else {
                this.signupTip = (Lang.sprintf(FactionWarMapDataLang.SignUpNum, this.signupNum) + FactionWarMapDataLang.SignUpNo);
            };
        }
        public function sign_up(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function sign_up_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.id = _arg1[0];
            this.signupList = [];
            for each (_local2 in _arg1[1]) {
                _local3 = {};
                _local3.id = _local2[0];
                _local3.name = _data.player.removeNickNameSuffix(_local2[1]);
                _local3.lv = _local2[2];
                _local3.num = _local2[4];
                _local3.fame = _local2[5];
                _local3.isb = (_local2[0] == this.id);
                this.signupList.push(_local3);
            };
            this.signupList.sortOn("fame", (Array.NUMERIC | Array.DESCENDING));
        }
        public function notify_open_faction_war(_arg1:Array):void{
            this.signupState = 4;
            this.warTime = 0;
            this.warCount = _arg1[1];
            this.warRound = _arg1[2];
            this.warTownId = _arg1[3];
        }
        public function cup_list(_arg1:Array):void{
            var _local3:Object;
            var _local4:Array;
            this.cupObj.g8 = [];
            this.cupObj.g4 = [];
            this.cupObj.g2 = [];
            this.cupObj.g1 = [];
            this.cupObj.has = [];
            this.cupObj.out = [];
            this.cupObj.win = [];
            this.cupObj.names = [""];
            this.cupObj.count = this.getRoundWar(_arg1[1], _arg1[2]);
            this.cupObj.state = _arg1[4];
            this.cupObj.time = ((_arg1[5] * 1000) + getTimer());
            this.cupObj.factionId = _data.player.playerInfo.factionId;
            this.cupObj.round = _arg1[2];
            var _local2:String = ("g" + this.getRoundWar(_arg1[1], 1));
            for each (_local4 in _arg1[6]) {
                _local3 = {};
                _local3.id1 = _local4[0];
                _local3.id2 = _local4[2];
                _local3.group = _local4[4];
                _local3.round = _local4[5];
                _local3.winner = _local4[6];
                if (_local3.round == 1){
                    this.cupObj[_local2][_local3.group] = _local3;
                    this.cupObj.names[_local3.id1] = _data.player.removeNickNameSuffix(_local4[1]);
                    this.cupObj.names[_local3.id2] = _data.player.removeNickNameSuffix(_local4[3]);
                } else {
                    this.cupObj.win[((_local3.id1 + "&") + _local3.id2)] = (this.cupObj.win[((_local3.id2 + "&") + _local3.id1)] = _local3.winner);
                };
                if (_local3.winner == 0){
                    this.cupObj.has[_local3.id1] = 1;
                    this.cupObj.has[_local3.id2] = 1;
                } else {
                    if (((!((this.cupObj.id1 == 0))) && (!((this.cupObj.id2 == 0))))){
                        this.cupObj.has[_local3.winner] = 1;
                        if (_local3.winner == _local3.id1){
                            this.cupObj.out[_local3.id2] = 1;
                        } else {
                            if (_local3.winner == _local3.id2){
                                this.cupObj.out[_local3.id1] = 1;
                            };
                        };
                    };
                };
            };
        }
        public function get_faction_war_info(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.warMapList = [];
            for each (_local2 in _arg1[2]) {
                _local3 = {};
                _local3.fid = _local2[0];
                _local3.mid = _local2[1];
                _local3.name = _data.player.removeNickNameSuffix(_local2[2]);
                _local3.lv = _local2[3];
                this.warMapList.push(_local3);
            };
            this.warStatusList = [];
            this.warRound = _arg1[1];
            this.warCount = _arg1[0];
            if (this.warMapList.length < 2){
                this.warMapList.push({
                    fid:0,
                    mid:0,
                    name:"",
                    lv:0
                });
            };
        }
        public function notify_begin_faction_war(_arg1:Array):void{
            this.signupState = 4;
            this.intoTime = 0;
            this.warCount = _arg1[1];
            this.warRound = _arg1[2];
            this.warTime = ((_arg1[3] * 1000) + getTimer());
        }
        public function fight_player(_arg1:Array):void{
        }
        public function notify_versus_fighting(_arg1:Array):void{
            var _local2:Object = {};
            _local2.aInfo = _data.town.getPlayerInfo(_arg1[0]);
            _local2.bInfo = _data.town.getPlayerInfo(_arg1[1]);
            _local2.aSate = 2;
            _local2.bSate = 2;
            _local2.msg = "";
            _local2.idx = 0;
            this.warStatusList.push(_local2);
        }
        public function notify_versus_fight_over(_arg1:Array):void{
            var _local2:PlayerInfo = _data.town.getPlayerInfo(_arg1[0]);
            var _local3:String = htmlFormat(_local2.name, -1, _local2.nameColor);
            var _local4:PlayerInfo = _data.town.getPlayerInfo(_arg1[1]);
            var _local5:String = htmlFormat(_local4.name, -1, _local4.nameColor);
            var _local6:Object = {};
            _local6.aInfo = _local2;
            _local6.bInfo = _local4;
            _local6.time = _arg1[3];
            if (_arg1[2] == 0){
                _local6.msg = Lang.sprintf(FactionWarMapDataLang.WarTo, _local5, _local3);
                _local6.aSate = 1;
                _local6.bSate = 0;
            } else {
                _local6.msg = Lang.sprintf(FactionWarMapDataLang.WarTo, _local3, _local5);
                _local6.aSate = 0;
                _local6.bSate = 1;
            };
            this.warStatusList.push(_local6);
        }
        public function send_versus_fight_data(_arg1:Array):void{
            var _local4:Array;
            this.warWinPlayerId = _arg1[0];
            var _local2:WarData = new WarData();
            _local2.format([0, 0, 0, [_arg1[1][0]]]);
            this.warDataList.push(_local2);
            var _local3:Array = [0, 0, 0];
            for each (_local4 in _arg1[2]) {
                _local3[_local4[0]] = _local4[1];
            };
            this.warAwardList.push(_local3);
        }
        public function notify_round_over(_arg1:Array):void{
            var _local3:Object;
            var _local4:int;
            var _local5:int;
            var _local6:Array;
            var _local7:Array;
            this.winId = _arg1[0];
            this.killRank = [];
            this.killTip = "";
            var _local2:Array = [];
            for each (_local3 in this.warMapList) {
                _local2[_local3.fid] = _local3.name;
                if (_local3.fid == this.winId){
                    this.killTip = Lang.sprintf(FactionWarMapDataLang.WarOverWinTip, _data.player.removeNickNameSuffix(_local3.name));
                };
            };
            _local4 = _data.player.playerInfo.factionId;
            _local5 = _data.player.playerInfo.id;
            _local6 = ["", "", "", "", ""];
            _local6[1] = FactionWarMapDataLang.BangZhu;
            for each (_local7 in _arg1[1]) {
                _local3 = {};
                _local3.kill = _local7[4];
                _local3.fame = _local7[6];
                _local3.coin = _local7[5];
                _local3.name = (_data.player.removeNickNameSuffix(_local7[3]) + _local6[_local7[2]]);
                _local3.factionName = _local2[_local7[1]];
                if (_local7[0] == _local5){
                    _local3.color = 0xF39800;
                    _local3.isb = true;
                } else {
                    _local3.color = ((_local4)!=_local7[1]) ? 0xFF0000 : 0xFFFFFF;
                    _local3.isb = false;
                };
                this.killRank.push(_local3);
                _local3.sort = ((_local3.kill * 100000) + _local3.fame);
            };
            this.killRank.sortOn("sort", (Array.NUMERIC | Array.DESCENDING));
        }
        public function notify_faction_war_over(_arg1:Array):void{
            this.overWorldMsg = Lang.sprintf(FactionWarMapDataLang.FactionWarWinTip, (("<b>" + _data.player.removeNickNameSuffix(_arg1[2])) + "</b>"));
            this.overChatMsg = "";
            if (_arg1[1] == _data.player.playerInfo.factionId){
                this.overChatMsg = (HtmlText.yellow2(FactionWarMapDataLang.Notice) + FactionWarMapDataLang.FactionWarWinTipChat);
            };
        }
        public function notify_faction_war_gift(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function get_faction_war_gift_detail(_arg1:Array):void{
            var _local2:Array;
            this.giftList = _arg1[2];
            for each (_local2 in this.giftList) {
                _local2[1] = _data.player.removeNickNameSuffix(_local2[1]);
            };
        }
        public function give_faction_war_gift(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function notify_good_faction_war_gift(_arg1:Array):void{
            var _local3:int;
            var _local4:String;
            var _local2:Array = [];
            for each (_local3 in _arg1[4]) {
                _local2.push(this.getLinkItem(_local3));
                if (_local3 == 1055){
                    this.worldNotice.push(Lang.sprintf(FactionWarMapDataLang.OpenBaiHu, _arg1[2]));
                };
            };
            _local4 = Lang.sprintf(FactionWarMapDataLang.OpenAward, this.getLinkPlayer(_arg1[0], _arg1[2]), this.getLinkItem(_arg1[3]), _local2.join("，"));
            this.chatWorld.push((htmlFormat(FactionWarMapDataLang.Notice, 12, 0xFFF200) + _local4));
            if (_arg1[1] == _data.player.playerInfo.factionId){
                this.chatFaction.push((htmlFormat(FactionWarMapDataLang.Faction, 12, 8438377) + _local4));
            };
        }
        public function get_versus_rank_list(_arg1:Array):void{
            var _local4:Object;
            var _local6:Array;
            this.heroRank = [];
            var _local2:Array = ["", FactionWarMapDataLang.BangZhu, ""];
            var _local3:int = _arg1[0];
            var _local5:int = _data.player.playerInfo.id;
            for each (_local6 in _arg1[2]) {
                _local4 = {};
                _local4.pId = _local6[0];
                _local4.fId = _local6[1];
                _local4.kill = _local6[5];
                _local4.name = this.getLinkPlayer2(_local6[0], (_data.player.removeNickNameSuffix(_local6[4]) + _local2[_local6[3]]), _local6[4]);
                _local4.factionName = _local6[2];
                _local4.coin = _local6[6];
                _local4.fame = _local6[7];
                _local4.sort = ((_local4.kill * 100000) + _local4.fame);
                if (_local3 == 0){
                    _local3 = _local4.fId;
                };
                if (_local4.pId == _local5){
                    _local4.color = 0xF39800;
                    _local4.isb = true;
                } else {
                    _local4.color = ((_local3)!=_local4.fId) ? 0xFF0000 : 0xFFFFFF;
                    _local4.isb = false;
                };
                this.heroRank.push(_local4);
            };
            this.heroRank.sortOn("sort", (Array.NUMERIC | Array.DESCENDING));
            if (_arg1[1] == ""){
                this.heroRankTip = FactionWarMapDataLang.Waring;
            } else {
                this.heroRankTip = Lang.sprintf(FactionWarMapDataLang.WinTip, _arg1[1]);
            };
        }
        public function notify_give_faction_war_gift(_arg1:Array):void{
            var _local3:Array;
            var _local2:String = htmlFormat(FactionWarMapDataLang.Faction, 12, 8438377);
            for each (_local3 in _arg1[1]) {
                this.chatFaction.push((_local2 + Lang.sprintf(FactionWarMapDataLang.GetAward, this.getLinkPlayer(_local3[0], _local3[1]), this.getLinkItem(_arg1[0], 1))));
            };
        }
        public function get_my_faction_war(_arg1:Array):void{
            if (_arg1[0] == 1){
                this.signupState = 4;
                this.intoTime = (getTimer() + (_arg1[1] * 1000));
            };
        }
        private function getLinkPlayer(_arg1:int, _arg2:String):String{
            var _local3:String = ((((TextLinkType.Player + "_") + _arg1) + "_") + _arg2);
            return ((((("<a href=\"event:" + _local3) + "\"><font color=\"#fff200\"><u>") + _data.player.removeNickNameSuffix(_arg2)) + "</u></font></a>"));
        }
        private function getLinkPlayer2(_arg1:int, _arg2:String, _arg3:String):String{
            var _local4:String = ((((TextLinkType.Player + "_") + _arg1) + "_") + _arg3);
            return ((((("<a href=\"event:" + _local4) + "\"><u>") + _arg2) + "</u></a>"));
        }
        private function getLinkItem(_arg1:int, _arg2:int=1):String{
            var _local3:String = ItemType.getItemColor(_arg1).toString(16);
            var _local4:String = ItemType.getName(_arg1);
            var _local5:String = ((((TextLinkType.Item + "_") + _arg1) + "_") + _arg2);
            return ((((((("<font color=\"#" + _local3) + "\"><a href=\"event:") + _local5) + "\"><u>") + _local4) + "</u></a></font>"));
        }
        public function get roundWarIdx():int{
            return (this.getRoundWar(this.warCount, this.warRound));
        }
        public function get roundWarName():String{
            var _local1:int = this.roundWarIdx;
            if (_local1 == 1){
                return (FactionWarMapDataLang.War1);
            };
            if (_local1 == 2){
                return (FactionWarMapDataLang.War2);
            };
            if (_local1 == 4){
                return (FactionWarMapDataLang.War4);
            };
            if (_local1 == 8){
                return (FactionWarMapDataLang.War8);
            };
            return ("");
        }
        public function getRoundWar(_arg1:int, _arg2:int):int{
            while (_arg2 > 0) {
                if (_arg1 > 8){
                    _arg1 = 8;
                } else {
                    if (_arg1 > 4){
                        _arg1 = 4;
                    } else {
                        if (_arg1 > 2){
                            _arg1 = 2;
                        } else {
                            if (_arg1 > 1){
                                _arg1 = 1;
                            };
                        };
                    };
                };
                _arg2--;
            };
            return (_arg1);
        }

    }
}//package com.datas 
