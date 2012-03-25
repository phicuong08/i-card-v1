//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CardButtons extends Group {

        private var _756819115chuZhan:CardButtonBase;
        private var _1283076385faDong:CardButtonBase;
        private var _1240275520gongJi:CardButtonBase;
        private var _103656708maiFu:CardButtonBase;
        private var _1318544031zhenXing:CardButtonBase;
        private var _2087494084zhengBian:CardButtonBase;
        private var __moduleFactoryInitialized:Boolean = false;
        public var belongCard:GameCard;

        public function CardButtons(){
            this.x = 51;
            this.y = -4;
            this.width = 78;
            this.height = 160;
            this.layout = this._CardButtons_BasicLayout1_c();
            this.mxmlContent = [this._CardButtons_CardButtonBase1_i(), this._CardButtons_CardButtonBase2_i(), this._CardButtons_CardButtonBase3_i(), this._CardButtons_CardButtonBase4_i(), this._CardButtons_CardButtonBase5_i(), this._CardButtons_CardButtonBase6_i()];
            this.addEventListener("rollOut", this.___CardButtons_Group1_rollOut);
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_rollOutHandler():void{
            if (((this.belongCard) && ((this.belongCard.parent == CombatStage.getInstance().groupWith3D)))){
                this.separateCard();
            };
        }
        public function separateCard():void{
            var _local1:GameCard;
            var _local2:*;
            if (this.belongCard){
                _local1 = this.belongCard;
                this.belongCard = null;
                if (!_local1.hitTestPoint(TCGClient.getInstance().mouseX, TCGClient.getInstance().mouseY, true)){
                    _local1.mouseOutCardHandler();
                };
                _local2 = parent;
                if (_local2){
                    _local2.removeElement(this);
                };
            };
        }
        public function attachCard(_arg1:GameCard):void{
            var r:* = null;
            var checkMouse:* = null;
            var card:* = _arg1;
            if (card == this.belongCard){
                return;
            };
            this.separateCard();
            var cardInfo:* = card.cardInfo;
            if (((((((!((cardInfo.camp == "player"))) || ((cardInfo.slot == "food")))) || ((cardInfo.slot == "hand_2")))) || ((cardInfo.slot == "grave")))){
                return;
            };
            if (CombatConsole.getInstance().actionList.length > 0){
                return;
            };
            SoundMgr.getInstance().playEffectSound("card_mouse_enter");
            this.belongCard = card;
            this.reset();
            this.showButtonByCardInfo(cardInfo);
            this.graphics.clear();
            if (this.belongCard.parent == CombatStage.getInstance().groupWith3D){
                checkMouse = function ():void{
                    if (!hitTestPoint(TCGClient.getInstance().mouseX, TCGClient.getInstance().mouseY, true)){
                        group1_rollOutHandler();
                    };
                };
                r = this.belongCard.getRect(CombatStage.getInstance());
                this.x = r.x;
                this.y = (r.y - 17);
                this.width = (r.width + 25);
                this.height = (r.height + 10);
                this.graphics.beginFill(0, 0);
                this.graphics.drawRect(0, 0, width, height);
                this.graphics.endFill();
                this.depth = (this.belongCard.depth + 100);
                CombatStage.getInstance().addElement(this);
                CommonUtil.addTimerLaterCall(200, checkMouse);
            } else {
                this.x = 51;
                this.y = -4;
                this.width = 78;
                this.height = 160;
                this.depth = 0;
                this.belongCard.addElement(this);
            };
        }
        private function reset():void{
            this.chuZhan.visible = false;
            this.chuZhan.enabled = false;
            this.gongJi.visible = false;
            this.gongJi.enabled = false;
            this.faDong.visible = true;
            this.faDong.enabled = false;
            this.maiFu.visible = false;
            this.maiFu.enabled = false;
            this.zhenXing.visible = false;
            this.zhenXing.enabled = false;
            this.zhengBian.visible = false;
            this.zhengBian.enabled = false;
        }
        private function chuZhanClickHandler(_arg1:MouseEvent):void{
            var _local2:String;
            if (!this.chuZhan.btnEnabled){
                return;
            };
            var _local3:Object = this.belongCard.cardInfo;
            if (_local3.slot == "hand"){
                _local2 = (("return d:do_operation('', 'recruit'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            } else {
                _local2 = (("return d:do_operation('', 'flip_recruit', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            };
            var _local4:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local4.length > 1)) && ((_local4[1] == true)))){
                this.separateCard();
            };
        }
        private function gongJiClickHandler(_arg1:MouseEvent):void{
            if (!this.gongJi.btnEnabled){
                return;
            };
            SoundMgr.getInstance().playEffectSound("click_4");
            CombatConsole.getInstance().startAttack(this.belongCard);
            this.separateCard();
        }
        private function faDongClickHandler(_arg1:MouseEvent):void{
            var _local2:String;
            if (!this.faDong.btnEnabled){
                return;
            };
            var _local3:Object = this.belongCard.cardInfo;
            if (_local3.slot == "hand"){
                _local2 = (("return d:do_operation('', 'cast', 'hand'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            } else {
                _local2 = (((("return d:do_operation('', 'cast', '" + _local3.slot) + "',") + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            };
            var _local4:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local4.length > 1)) && ((_local4[1] == true)))){
                this.separateCard();
            };
        }
        private function maiFuClickHandler(_arg1:MouseEvent):void{
            var _local2:String;
            if (!this.maiFu.btnEnabled){
                return;
            };
            var _local3:Object = this.belongCard.cardInfo;
            if ((((_local3.color == "red")) || ((_local3.color == "green")))){
                _local2 = (("return d:do_operation('', 'set'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            } else {
                _local2 = (("return d:do_operation('', 'recruit'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ", true);");
            };
            var _local4:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local4.length > 1)) && ((_local4[1] == true)))){
                this.separateCard();
            };
        }
        private function zhenXingClickHandler(_arg1:MouseEvent):void{
            if (!this.zhenXing.btnEnabled){
                return;
            };
            var _local2 = (("return d:do_operation('', 'toggle_defensive', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                this.separateCard();
            };
        }
        private function zhengBianClickHandler(_arg1:MouseEvent):void{
            if (!this.zhengBian.btnEnabled){
                return;
            };
            var _local2 = (("return d:do_operation('', 'reorganize', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                this.separateCard();
            };
        }
        private function showButtonByCardInfo(_arg1:Object):void{
            var _local2:String;
            var _local3:Array;
            var _local4 = !(CombatConsole.getInstance().enableTraceOperateMenu);
            if (_arg1.slot == "hand"){
                if (!_arg1.isPositive){
                    return;
                };
                this.maiFu.visible = true;
                if ((((_arg1.color == "silver")) || ((_arg1.color == "gold")))){
                    this.chuZhan.visible = true;
                    _local2 = (("return d:check_operation('', 'recruit'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                    _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                    if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                        this.showButton("出战");
                    } else {
                        if (_local3.length >= 3){
                            this.chuZhan.disableTooltip = _local3[2];
                        };
                    };
                    _local2 = (("return d:check_operation('', 'cast', 'hand'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                    _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                    if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                        this.showButton("发动");
                    } else {
                        if (_local3.length >= 3){
                            this.faDong.disableTooltip = _local3[2];
                        };
                    };
                    _local2 = (("return d:check_operation('', 'recruit'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ", true);");
                    _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                    if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                        this.showButton("埋伏");
                    } else {
                        if (_local3.length >= 3){
                            this.maiFu.disableTooltip = _local3[2];
                        };
                    };
                } else {
                    if (_arg1.color == "red"){
                        this.faDong.visible = false;
                    } else {
                        _local2 = (("return d:check_operation('', 'cast', 'hand'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                        _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                        if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                            this.showButton("发动");
                        } else {
                            if (_local3.length >= 3){
                                this.faDong.disableTooltip = _local3[2];
                            };
                        };
                    };
                    _local2 = (("return d:check_operation('', 'set'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                    _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                    if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                        this.showButton("埋伏");
                    } else {
                        if (_local3.length >= 3){
                            this.maiFu.disableTooltip = _local3[2];
                        };
                    };
                };
            } else {
                if (_arg1.slot != "grave"){
                    if ((((_arg1.color == "silver")) || ((_arg1.color == "gold")))){
                        this.zhenXing.visible = true;
                        this.gongJi.visible = true;
                        this.zhengBian.visible = true;
                        if (_arg1.slot == "monster"){
                            if (_arg1.isPositive){
                                _local2 = (("return check_attack(" + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                                _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                                if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                                    this.showButton("攻击");
                                } else {
                                    if (_local3.length >= 3){
                                        this.gongJi.disableTooltip = _local3[2];
                                    };
                                };
                            } else {
                                this.gongJi.visible = false;
                                this.chuZhan.visible = true;
                                _local2 = (("return d:check_operation('', 'flip_recruit', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                                _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                                if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                                    this.showButton("出战");
                                } else {
                                    if (_local3.length >= 3){
                                        this.chuZhan.disableTooltip = _local3[2];
                                    };
                                };
                            };
                            _local2 = (("return d:check_operation('', 'cast', 'monster'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                            _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                                this.showButton("发动");
                            } else {
                                if (_local3.length >= 3){
                                    this.faDong.disableTooltip = _local3[2];
                                };
                            };
                            _local2 = (("return d:check_operation('', 'toggle_defensive', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                            _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                                this.showButton("阵型");
                            } else {
                                if (_local3.length >= 3){
                                    this.zhenXing.disableTooltip = _local3[2];
                                };
                            };
                            _local2 = (("return d:check_operation('', 'reorganize', " + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                            _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                                this.showButton("整编");
                            } else {
                                if (_local3.length >= 3){
                                    this.zhengBian.disableTooltip = _local3[2];
                                };
                            };
                        };
                    } else {
                        _local2 = (("return d:check_operation('', 'cast', 'magic'," + CombatStage.getInstance().getCardPos(this.belongCard)) + ");");
                        _local3 = LuaAgent.getInstance().run(_local2, _local4, false);
                        if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                            this.showButton("发动");
                        } else {
                            if (_local3.length >= 3){
                                this.faDong.disableTooltip = _local3[2];
                            };
                        };
                    };
                };
            };
        }
        private function showButton(_arg1:String):void{
            switch (_arg1){
                case "出战":
                    this.chuZhan.enabled = true;
                    break;
                case "攻击":
                    this.gongJi.enabled = true;
                    break;
                case "发动":
                    this.faDong.enabled = true;
                    break;
                case "埋伏":
                    this.maiFu.enabled = true;
                    break;
                case "阵型":
                    this.zhenXing.enabled = true;
                    break;
                case "整编":
                    this.zhengBian.enabled = true;
                    break;
            };
        }
        private function _CardButtons_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardButtons_CardButtonBase1_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.right = 0;
            _local1.btnName = "出 战";
            _local1.addEventListener("click", this.__chuZhan_click);
            _local1.id = "chuZhan";
            if (!_local1.document){
                _local1.document = this;
            };
            this.chuZhan = _local1;
            BindingManager.executeBindings(this, "chuZhan", this.chuZhan);
            return (_local1);
        }
        public function __chuZhan_click(_arg1:MouseEvent):void{
            this.chuZhanClickHandler(_arg1);
        }
        private function _CardButtons_CardButtonBase2_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.right = 0;
            _local1.btnName = "攻 击";
            _local1.addEventListener("click", this.__gongJi_click);
            _local1.id = "gongJi";
            if (!_local1.document){
                _local1.document = this;
            };
            this.gongJi = _local1;
            BindingManager.executeBindings(this, "gongJi", this.gongJi);
            return (_local1);
        }
        public function __gongJi_click(_arg1:MouseEvent):void{
            this.gongJiClickHandler(_arg1);
        }
        private function _CardButtons_CardButtonBase3_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.y = 40;
            _local1.right = 0;
            _local1.btnName = "发 动";
            _local1.addEventListener("click", this.__faDong_click);
            _local1.id = "faDong";
            if (!_local1.document){
                _local1.document = this;
            };
            this.faDong = _local1;
            BindingManager.executeBindings(this, "faDong", this.faDong);
            return (_local1);
        }
        public function __faDong_click(_arg1:MouseEvent):void{
            this.faDongClickHandler(_arg1);
        }
        private function _CardButtons_CardButtonBase4_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.y = 80;
            _local1.right = 0;
            _local1.btnName = "埋 伏";
            _local1.addEventListener("click", this.__maiFu_click);
            _local1.id = "maiFu";
            if (!_local1.document){
                _local1.document = this;
            };
            this.maiFu = _local1;
            BindingManager.executeBindings(this, "maiFu", this.maiFu);
            return (_local1);
        }
        public function __maiFu_click(_arg1:MouseEvent):void{
            this.maiFuClickHandler(_arg1);
        }
        private function _CardButtons_CardButtonBase5_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.y = 80;
            _local1.right = 0;
            _local1.btnName = "阵 型";
            _local1.addEventListener("click", this.__zhenXing_click);
            _local1.id = "zhenXing";
            if (!_local1.document){
                _local1.document = this;
            };
            this.zhenXing = _local1;
            BindingManager.executeBindings(this, "zhenXing", this.zhenXing);
            return (_local1);
        }
        public function __zhenXing_click(_arg1:MouseEvent):void{
            this.zhenXingClickHandler(_arg1);
        }
        private function _CardButtons_CardButtonBase6_i():CardButtonBase{
            var _local1:CardButtonBase = new CardButtonBase();
            _local1.y = 120;
            _local1.right = 0;
            _local1.btnName = "整 编";
            _local1.addEventListener("click", this.__zhengBian_click);
            _local1.id = "zhengBian";
            if (!_local1.document){
                _local1.document = this;
            };
            this.zhengBian = _local1;
            BindingManager.executeBindings(this, "zhengBian", this.zhengBian);
            return (_local1);
        }
        public function __zhengBian_click(_arg1:MouseEvent):void{
            this.zhengBianClickHandler(_arg1);
        }
        public function ___CardButtons_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler();
        }
        public function get chuZhan():CardButtonBase{
            return (this._756819115chuZhan);
        }
        public function set chuZhan(_arg1:CardButtonBase):void{
            var _local2:Object = this._756819115chuZhan;
            if (_local2 !== _arg1){
                this._756819115chuZhan = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chuZhan", _local2, _arg1));
                };
            };
        }
        public function get faDong():CardButtonBase{
            return (this._1283076385faDong);
        }
        public function set faDong(_arg1:CardButtonBase):void{
            var _local2:Object = this._1283076385faDong;
            if (_local2 !== _arg1){
                this._1283076385faDong = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "faDong", _local2, _arg1));
                };
            };
        }
        public function get gongJi():CardButtonBase{
            return (this._1240275520gongJi);
        }
        public function set gongJi(_arg1:CardButtonBase):void{
            var _local2:Object = this._1240275520gongJi;
            if (_local2 !== _arg1){
                this._1240275520gongJi = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gongJi", _local2, _arg1));
                };
            };
        }
        public function get maiFu():CardButtonBase{
            return (this._103656708maiFu);
        }
        public function set maiFu(_arg1:CardButtonBase):void{
            var _local2:Object = this._103656708maiFu;
            if (_local2 !== _arg1){
                this._103656708maiFu = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maiFu", _local2, _arg1));
                };
            };
        }
        public function get zhenXing():CardButtonBase{
            return (this._1318544031zhenXing);
        }
        public function set zhenXing(_arg1:CardButtonBase):void{
            var _local2:Object = this._1318544031zhenXing;
            if (_local2 !== _arg1){
                this._1318544031zhenXing = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhenXing", _local2, _arg1));
                };
            };
        }
        public function get zhengBian():CardButtonBase{
            return (this._2087494084zhengBian);
        }
        public function set zhengBian(_arg1:CardButtonBase):void{
            var _local2:Object = this._2087494084zhengBian;
            if (_local2 !== _arg1){
                this._2087494084zhengBian = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhengBian", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
