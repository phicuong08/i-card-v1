//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.view.*;
    import com.assist.data.mission.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class TowerData extends Base {

        public var result:int = 0;
        public var info:TowerInfo;
        public var warData:WarData;
        public var warSoulId:int;
        public var warExp:int;
        public var warCoin:int;
        public var warFame:int;
        public var isPass:Boolean;
        public var warAura:int;

        public function TowerData(){
            this.info = new TowerInfo();
            super();
        }
        public function get_tower_info(_arg1:Array):void{
            this.info.sequenceMax_ = _arg1[0];
            this.info.layer = _arg1[1];
            this.info.sequenceWar = (_arg1[2] + 1);
            this.info.bagNum = _arg1[3];
            this.info.resetNum = _arg1[4];
            this.info.resetIngot = _arg1[5];
            this.info.hideId = _arg1[6];
            this.info.panelIdx = 1;
            this.info.layderTip = "";
            this.info.isShowTip = true;
            if ((((this.info.sequenceWar == 26)) && ((this.info.layer == 6)))){
                this.info.layderTip = TowerDataLang.layderTip2;
            } else {
                if (_data.player.level < this.info.daoLv[this.info.layer]){
                    this.info.isShowTip = false;
                    this.info.layderTip = Lang.sprintf(TowerDataLang.layderTip1, this.info.daoLv[this.info.layer]);
                };
            };
        }
        public function start_challenge(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Tower_Base.SUCCESS){
                return;
            };
            this.warData = new WarData();
            this.warData.format([0, 0, 0, [_arg1[1][0]]]);
            this.warSoulId = _arg1[2];
            this.warExp = _arg1[3];
            this.warFame = _arg1[4];
            this.warCoin = _arg1[5];
            this.isPass = (_arg1[7] == 1);
            this.warAura = _arg1[8];
            this.info.bagNum = _arg1[6];
            this.info.panelIdx = 1;
            if (this.isPass){
                if (this.info.warIdx > 0){
                    if (this.info.sequenceMax_ < this.info.sequenceWar){
                        this.info.sequenceMax_ = this.info.sequenceWar;
                    };
                    this.info.sequenceWar++;
                } else {
                    this.info.hideId = 0;
                };
            };
        }
        public function reset_layer(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Tower_Base.SUCCESS){
                return;
            };
            this.info.resetNum = _arg1[1];
            this.info.resetIngot = _arg1[2];
            this.info.hideId = _arg1[3];
            this.info.sequenceWar = 1;
            this.info.panelIdx = 1;
        }
        public function start_auto_challenge(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Tower_Base.SUCCESS){
                return;
            };
            this.info.panelIdx = 2;
            this.info.inAuto = true;
            this.info.awardAutoTip1 = "";
            this.info.awardAutoTip2 = Lang.sprintf(TowerDataLang.InAutoWar, this.info.sequenceWar);
        }
        public function stop_auto_challenge(_arg1:Array):void{
        }
        public function notify_auto_challenge_report(_arg1:Array):void{
            var _local2:String;
            var _local3:String;
            var _local4:String;
            var _local5:int;
            var _local6:String;
            var _local7:int;
            this.result = _arg1[0];
            if (this.result == Mod_Tower_Base.SUCCESS){
                this.info.bagNum = _arg1[4];
                this.info.sequenceWar = (_arg1[1] + 1);
                this.info.awardAutoTip2 = Lang.sprintf(TowerDataLang.InAutoWar, this.info.sequenceWar);
                _local2 = Lang.sprintf(TowerDataLang.SequenceGet, _arg1[1]);
                _local3 = "";
                _local4 = "";
                _local5 = _arg1[2];
                if (_local5 != 0){
                    _local4 = htmlFormat((("[" + SoulType.getSoulName(_local5)) + "]"), 12, SoulType.getSoulQualityColor(_local5));
                    _local3 = ((_local2 + _local4) + "\n");
                    _local7 = SoulType.getSoulQualityId(_local5);
                    if ((((_local7 == 1)) && (this.info.autoSellL))){
                        _local3 = (_local3 + HtmlText.white(Lang.sprintf(TowerDataLang.AutoSell, _local4, 1, HtmlText.yellow("10000"))));
                    } else {
                        if ((((_local7 == 2)) && (this.info.autoSellZ))){
                            _local3 = (_local3 + HtmlText.white(Lang.sprintf(TowerDataLang.AutoSell, _local4, 3, HtmlText.yellow("20000"))));
                        };
                    };
                };
                _local6 = (_local2 + HtmlText.green(Lang.sprintf(TowerDataLang.Exp, _arg1[3])));
                this.info.awardAutoTip1 = ((_local3 + _local6) + this.info.awardAutoTip1);
            };
            if (((((!((this.result == Mod_Tower_Base.SUCCESS))) || ((this.info.sequenceWar == (this.info.sequenceMax_ + 1))))) || ((this.info.bagNum == 0)))){
                this.info.awardAutoTip2 = TowerDataLang.StopAutoWar;
                this.info.inAuto = false;
            };
        }
        public function quickly_auto_challenge(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result == Mod_Tower_Base.SUCCESS){
            };
        }

    }
}//package com.datas 
