//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.pack.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.assist.view.info.*;

    public class TowerInfo {

        public var daoName:Array;
        public var daoLv:Array;
        public var roleDisplay:IFrameSprite;
        public var sign:String = "";
        public var layer:int = 1;
        public var sequenceWar:int = 0;
        public var sequenceMax_:int = 0;
        public var bagNum:int = 0;
        public var awardAutoTip1:String = "";
        public var awardAutoTip2:String = "";
        public var resetNum:int = 0;
        public var resetIngot:int = 0;
        public var panelIdx:int = 1;
        public var inAuto:Boolean = false;
        public var hideId:int = 0;
        public var warIdx:int = 0;
        public var autoSellL:Boolean = false;
        public var autoSellZ:Boolean = false;
        public var layderTip:String = "";
        public var isShowTip:Boolean = true;

        public function TowerInfo(){
            this.daoLv = [0, 50, 61, 81, 101, 111, 121];
            super();
            this.daoName = ["", TowerInfoLang.Layder1, TowerInfoLang.Layder2, TowerInfoLang.Layder3, TowerInfoLang.Layder4, TowerInfoLang.Layder5, TowerInfoLang.Layder6, ""];
        }
        public function get resetTip():String{
            if (this.resetNum == 0){
                return (TowerInfoLang.NotResetCount);
            };
            if (this.sequenceWar == 1){
                return (TowerInfoLang.InFirst);
            };
            if (this.resetIngot == 0){
                return (Lang.sprintf(TowerInfoLang.ResetTip1, this.daoName[this.layer], this.resetNum));
            };
            return (Lang.sprintf(TowerInfoLang.ResetTip2, HtmlText.yellow((this.resetIngot + TowerInfoLang.Ingot)), this.daoName[this.layer], this.resetNum));
        }
        public function getLayderTip(_arg1:int):String{
            var _local2:String = "";
            if (_arg1 == this.layer){
                _local2 = ((Lang.sprintf(TowerInfoLang.Sequence1, this.daoName[_arg1], this.sequenceWar) + "\n") + htmlFormat(TowerInfoLang.NowLocation, 14, 44783));
            } else {
                if (_arg1 > this.layer){
                    _local2 = ((this.daoName[_arg1] + "\n") + htmlFormat(Lang.sprintf(TowerInfoLang.OpenLayderCondition, this.daoName[(_arg1 - 1)]), 14, 0xFF0000));
                } else {
                    return (Lang.sprintf(TowerInfoLang.OpenUp, this.daoName[_arg1]));
                };
            };
            return ((("<b><font size='14'>" + _local2) + "</font></b>"));
        }
        public function get hideTowerName():String{
            return ((this.daoName[this.hideId] + TowerInfoLang.HideLadyer));
        }
        public function get sequenceString():String{
            if (this.sequenceWar <= 25){
                return (Lang.sprintf(TowerInfoLang.Sequence2, this.sequenceWar));
            };
            return (Lang.sprintf(TowerInfoLang.Sequence2, 25));
        }
        public function get layderName():String{
            return (this.daoName[this.layer]);
        }
        public function get dir():int{
            if ((this.sequenceWar & 1) == 1){
                return (-1);
            };
            return (1);
        }
        public function get action():String{
            if (this.sequenceWar == 26){
                return ("stand");
            };
            return ("war");
        }
        public function get awardNames():Array{
            var _local6:String;
            var _local1:int = this.sequenceWar;
            if (_local1 > 25){
                _local1 = 25;
            };
            var _local2:int = TowerType.getMonsterId(this.layer, _local1);
            var _local3:Array = TowerType.getSoulIdList(this.layer, _local1);
            var _local4:Array = [];
            var _local5:Object = {};
            for each (_local2 in _local3) {
                _local6 = SoulType.getSoulName(_local2);
                if (_local5[_local6] == null){
                    _local5[_local6] = _local6;
                    _local4.push(htmlFormat(_local6, 12, SoulType.getSoulQualityColor(_local2), false, true));
                };
            };
            _local4.push(HtmlText.green((TowerInfoLang.Exp + TowerType.getAwardExp(this.layer, _local1))));
            if (this.sequenceMax_ == (this.sequenceWar - 1)){
                _local4.push(HtmlText.green((TowerInfoLang.Eternal + 500)));
            };
            return (_local4);
        }
        public function get awardTips():Array{
            var _local6:String;
            var _local7:SoulTipSprite;
            if (this.isShowTip == false){
                return ([]);
            };
            var _local1:int = this.sequenceWar;
            if (_local1 > 25){
                _local1 = 25;
            };
            var _local2:int = TowerType.getMonsterId(this.layer, _local1);
            var _local3:Array = TowerType.getSoulIdList(this.layer, _local1);
            var _local4:Array = [];
            var _local5:uint;
            for each (_local2 in _local3) {
                _local6 = SoulType.getSoulName(_local2);
                if (_local4[_local6] == null){
                    _local5 = SoulType.getSoulQualityColor(_local2);
                    _local7 = new SoulTipSprite();
                    _local7.iconUrl = URI.getSoulsIconUrl(_local2);
                    _local7.nameHtml = htmlFormat(SoulType.getSoulName(_local2), 16, _local5, true);
                    _local7.desHtml = htmlFormat(SoulType.getSoulContent(_local2), 12, 0xEEEEEE);
                    _local4[_local6] = _local7;
                };
            };
            return (_local4);
        }
        public function get monsterName():String{
            var _local1:int = this.sequenceWar;
            if (_local1 > 25){
                _local1 = 25;
            };
            var _local2:int = TowerType.getMonsterId(this.layer, _local1);
            return (MonsterType.getMonsterNameById(_local2));
        }

    }
}//package com.assist.view.info 
