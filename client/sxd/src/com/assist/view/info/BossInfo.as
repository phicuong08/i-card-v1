//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import com.*;
    import com.assist.*;
    import com.assist.view.map.*;
    import com.assist.server.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.assist.view.info.*;

    public class BossInfo extends MonsterInfo {

        public static var BossQingTianMu:int = 1;
        public static var BossChiYanShou:int = 2;
        public static var BossDaoBaTu:int = 3;

        public var mapId:int = 0;
        public var bossId:int = 0;
        public var htmlName:String = "";
        public var lv:int = 0;
        public var state:int = 0;
        public var auto:int = 0;
        public var robotTip:String = "";
        public var infoMsg:String = "";
        public var canSet:int = 0;
        public var setList:Array;
        public var time:int;
        public var life:int;
        public var lifeMax:int;
        public var guwu:int = 0;
        public var resetCount:int = 5;
        public var recordList:Array;
        public var worldTips:String = "";
        public var chatTips:String = "";
        public var hurtList:Array;
        public var fuhuoList:Array;

        public function BossInfo(_arg1:String):void{
            this.setList = [];
            this.recordList = [];
            this.hurtList = [];
            this.fuhuoList = [];
            super();
            this.sign = _arg1;
            if (MonsterType.BossQingTianMu == _arg1){
                this.mapId = 10;
                name = BossInfoLang.BossName1;
            } else {
                if (MonsterType.BossChiYanShou == _arg1){
                    this.mapId = 11;
                    name = BossInfoLang.BossName2;
                } else {
                    if (MonsterType.BossDaoBaTu == _arg1){
                        this.mapId = 12;
                        name = BossInfoLang.BossName3;
                    };
                };
            };
        }
        public function get resetIngot():int{
            return (((6 - this.resetCount) * 5));
        }
        public function updateBossHurt(_arg1:int, _arg2:int):void{
            var _local4:int;
            var _local5:int;
            var _local6:int;
            this.hurtList = [];
            var _local3:int = (this.life - _arg1);
            if (_local3 < 0){
                _local3 = this.life;
            };
            if (_local3 > 0){
                _local3 = (_local3 >> 1);
                _arg2 = ((_arg2)>30) ? 30 : _arg2;
                _local4 = int((_local3 / _arg2));
                _local5 = _local4;
                _local6 = _local4;
                while (_arg2 > 0) {
                    _arg2--;
                    if (_arg2 == 0){
                        this.hurtList.push((_local4 + _local6));
                    } else {
                        _local5 = (_local6 * Math.random());
                        _local6 = ((_local6 + _local4) - _local5);
                        this.hurtList.push((_local4 + _local5));
                    };
                };
            };
            this.life = _arg1;
        }
        public function updateRankList(_arg1:Array):void{
            var _local4:Object;
            var _local2:Array = _arg1.shift();
            var _local3:Object = {};
            if (_local2[2] == 0){
                _local3.msg = BossInfoLang.BossUnHurt;
            } else {
                _local3.p = Number(((100 * _local2[2]) / this.lifeMax)).toFixed(2);
                _local3.msg = Lang.sprintf(BossInfoLang.BossHurt2, _local2[2], _local3.p);
            };
            this.recordList = [_local3];
            var _local5:int;
            for each (_local2 in _arg1) {
                if (_local2[2] > 0){
                    _local4 = {};
                    _local4.p = Number(((100 * _local2[2]) / this.lifeMax)).toFixed(2);
                    _local4.msg = Lang.sprintf(BossInfoLang.BossHurt1, _local2[2], _local4.p);
                    ++_local5;
                    _local4.name = ((_local5 + ".") + this.removeNickNameSuffixEx(_local2[1]));
                    this.recordList.push(_local4);
                };
            };
        }
        public function updateOpenTip(_arg1:int):void{
            this.chatTips = (this.worldTips = "");
            this.worldTips = htmlFormat(name, 25, 0xFF0000);
            this.state = _arg1;
            if (_arg1 == 0){
                if (MonsterType.BossDaoBaTu == sign){
                    this.worldTips = Lang.sprintf(BossInfoLang.FactionBossWillOpen, this.worldTips);
                } else {
                    this.worldTips = Lang.sprintf(BossInfoLang.WorldBossWillOpen, this.worldTips);
                };
            } else {
                if (MonsterType.BossDaoBaTu == sign){
                    this.worldTips = Lang.sprintf(BossInfoLang.FactionBossOpen, this.worldTips);
                } else {
                    this.worldTips = Lang.sprintf(BossInfoLang.WorldBossOpen, this.worldTips);
                };
            };
            this.worldTips = htmlFormat(this.worldTips, 25, 0xFFF200, true);
        }
        public function updateKillTip(_arg1:Array, _arg2:int=0, _arg3:String=""):void{
            this.state = 3;
            this.worldTips = htmlFormat(name, 25, 0xFF0000);
            if (MonsterType.BossDaoBaTu == sign){
                this.worldTips = Lang.sprintf(BossInfoLang.UserKillFactionBoss, _arg3, this.worldTips);
            } else {
                this.worldTips = Lang.sprintf(BossInfoLang.UserKillWorldBoss, _arg3, this.worldTips);
            };
            this.worldTips = htmlFormat(this.worldTips, 25, 0xFFF200, true);
            this.updateKillRank(_arg1, _arg2, _arg3);
        }
        public function updateCloseTip(_arg1:Array):void{
            this.state = 2;
            this.worldTips = htmlFormat(name, 25, 0xFF0000);
            if (MonsterType.BossDaoBaTu == sign){
                this.worldTips = Lang.sprintf(BossInfoLang.FactionBossOver, this.worldTips);
            } else {
                this.worldTips = Lang.sprintf(BossInfoLang.WorldBossOver, this.worldTips);
            };
            this.worldTips = htmlFormat(this.worldTips, 25, 0xFFF200, true);
            this.updateKillRank(_arg1);
        }
        private function updateKillRank(_arg1:Array, _arg2:int=0, _arg3:String=""):void{
            var _local7:Array;
            var _local8:int;
            this.chatTips = "";
            if (_arg1.length == 0){
                return;
            };
            var _local4:Array = [BossInfoLang.Num3, BossInfoLang.Num2, BossInfoLang.Num1];
            var _local5:Array = [];
            var _local6:Array = [];
            for each (_local7 in _arg1) {
                _local6.push((this.chatTips = this.getLinkPlayer(_local7[0], _local7[1])));
                _local5.push(Lang.sprintf(_local4.pop(), this.chatTips, Number(((100 * _local7[2]) / this.lifeMax)).toFixed(3)));
            };
            this.chatTips = ((Lang.sprintf(BossInfoLang.BossWarChat, "<font color='#fff200'>", "</font>", name) + "\n") + _local5.join("\n"));
            if (_arg2 != 0){
                _local8 = (((sign)==MonsterType.BossDaoBaTu) ? (this.lv - 59) : (this.lv - 30) * 100000);
                this.chatTips = ((this.chatTips + "\n") + Lang.sprintf(BossInfoLang.BossWarAward, _local6.join("、")));
                this.chatTips = ((this.chatTips + "\n") + Lang.sprintf(BossInfoLang.BossWarKill, this.getLinkPlayer(_arg2, _arg3), name, _local8));
            };
        }
        private function getLinkPlayer(_arg1:int, _arg2:String):String{
            var _local3:String = ((((TextLinkType.Player + "_") + _arg1) + "_") + _arg2);
            return ((((("<font color=\"#fff200\"><a href=\"event:" + _local3) + "\"><u>") + this.removeNickNameSuffixEx(_arg2)) + "</u></a></font>"));
        }
        private function getLinkItem(_arg1:int, _arg2:int=1):String{
            var _local3:String = ItemType.getItemColor(_arg1).toString(16);
            var _local4:String = ItemType.getName(_arg1);
            var _local5:String = ((((TextLinkType.Item + "_") + _arg1) + "_") + _arg2);
            return ((((((("<font color=\"#" + _local3) + "\"><a href=\"event:") + _local5) + "\"><u>") + _local4) + "</u></a></font>"));
        }
        private function removeNickNameSuffixEx(_arg1:String):String{
            if (MapStatic.removeNickNameSuffix == null){
                return (_arg1);
            };
            return (MapStatic.removeNickNameSuffix(_arg1));
        }

    }
}//package com.assist.view.info 
