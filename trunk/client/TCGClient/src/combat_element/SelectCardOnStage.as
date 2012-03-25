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
    import spark.filters.*;
    import task_guide.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class SelectCardOnStage extends StageSelectWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _476548482cancelBtn:Button;
        private var _1286989506ensureBtn:Button;
        private var _1822070833lineColor:GradientEntry;
        private var _1191722027numRemind:Label;
        private var _3560248tips:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var maxNeedCardNum:int = 0;
        private var minNeedCardNum:int = 0;
        private var satisfyCards:Array;
        private var selectCardsArray:Array;
        private var _245942307ensureBtnEnabled:Boolean = true;
        private var _990953311cancelBtnEnabled:Boolean = true;
        private var _1311656856tipText:String;
        private var _2000932397numText:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SelectCardOnStage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.selectCardsArray = new Array();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SelectCardOnStage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_SelectCardOnStageWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 1040;
            this.height = 800;
            this.mouseEnabled = false;
            this.mxmlContent = [this._SelectCardOnStage_Rect1_c(), this._SelectCardOnStage_Label1_i(), this._SelectCardOnStage_Label2_i(), this._SelectCardOnStage_Button1_i(), this._SelectCardOnStage_Button2_i()];
            this.addEventListener("initialize", this.___SelectCardOnStage_StageSelectWindowBase1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SelectCardOnStage._watcherSetupUtil = _arg1;
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
        protected function creationCompleteHandler():void{
            AttackEffectManager.hideAttackSuccessEffect();
            CombatConsole.getInstance().setOperationMenuFlag("select", true);
            CombatStage.getInstance().addEventListener(MyEvent.MOUSE_CLICK_CARD, this.mouseClickCard);
            GuideFunctions.addMaskWindow();
        }
        private function mouseClickCard(_arg1:MyEvent):void{
            var _local4:GameCard;
            var _local2:GameCard = (_arg1.message.card as GameCard);
            var _local3:int = this.selectCardsArray.indexOf(_local2);
            if (_local3 == -1){
                if (this.satisfyCards.indexOf(_local2.sn) != -1){
                    if (this.selectCardsArray.length >= this.maxNeedCardNum){
                        _local4 = this.selectCardsArray.shift();
                        SelectCardFilter.createSelectFilters(false, _local4);
                    };
                    this.selectCardsArray.push(_local2);
                    SelectCardFilter.createSelectFilters(true, _local2);
                };
            } else {
                this.selectCardsArray.splice(_local3, 1);
                SelectCardFilter.createSelectFilters(false, _local2);
            };
            this.checkNum();
        }
        public function setInfo(_arg1:int=0, _arg2:int=0, _arg3:Boolean=true, _arg4:Array=null, _arg5:String=null, _arg6=null):void{
            var _local7:GameCard;
            var _local8:int;
            this.maxNeedCardNum = _arg1;
            this.minNeedCardNum = _arg2;
            this.cancelBtnEnabled = _arg3;
            this.satisfyCards = _arg4;
            this.setTipByReason(_arg5);
            this.setYByReason(_arg5);
            this.checkNum();
            for each (_local8 in this.satisfyCards) {
                _local7 = CombatStage.getInstance().cardTableBySn[_local8];
                _local7.setSelectState(true);
                _local7.depth = 350;
            };
        }
        private function setYByReason(_arg1:String):void{
            var _local2:Array;
            if (_arg1 != null){
                _local2 = _arg1.split(".");
                switch (_local2[0]){
                    case "discard":
                    case "drop":
                    case "guanyu,zhangfei":
                    case "equip":
                    case "sacrifice":
                    case "protect":
                    case "str add":
                    case "remove mark":
                        y = (y - 70);
                        break;
                };
            };
        }
        private function setTipByReason(_arg1:String):void{
            var _local2:Array;
            if (_arg1 == null){
                this.tipText = "请选择作为效果对象的卡";
            } else {
                _local2 = _arg1.split(".");
                switch (_local2[0]){
                    case "discard":
                        this.tipText = "请选择要解散的卡";
                        break;
                    case "destroy":
                        this.tipText = "请选择要破坏的卡";
                        break;
                    case "destroy my silver":
                        this.tipText = "请选择要破坏的我方银卡";
                        break;
                    case "drop":
                        this.tipText = "请选择要丢弃的卡";
                        break;
                    case "guanyu,zhangfei":
                        this.tipText = "请选择关羽或张飞";
                        break;
                    case "equip":
                        this.tipText = "请选择要装备的卡";
                        break;
                    case "sacrifice":
                        this.tipText = "高级武将的出战需要解散现有部队。请选择要解散的部队：";
                        break;
                    case "return hand":
                        this.tipText = "请选择返回手牌的卡";
                        break;
                    case "to hand":
                        this.tipText = "请选择加入手牌的卡";
                        break;
                    case "to grave":
                        this.tipText = "请选择送去墓地的卡";
                        break;
                    case "protect":
                        this.tipText = "请选择要保护的卡";
                        break;
                    case "str add":
                        this.tipText = "请选择要增加武力的卡";
                        break;
                    case "down str":
                        this.tipText = "请选择要降低武力的卡";
                        break;
                    case "recruit":
                        this.tipText = "请选择要出战的卡";
                        break;
                    case "return deck":
                        this.tipText = "请选择返回卡组的卡";
                        break;
                    case "remove mark":
                        this.tipText = (("请去除第" + _local2[1]) + "面令旗");
                        break;
                    case "mind_control":
                        this.tipText = "请选择要控制的卡";
                        break;
                    case "toggle":
                        this.tipText = "请选择要转换阵型的卡";
                        break;
                    default:
                        this.tipText = "请选择效果对象";
                };
            };
        }
        private function checkNum():void{
            this.ensureBtnEnabled = (((this.selectCardsArray.length <= this.maxNeedCardNum)) && ((this.selectCardsArray.length >= this.minNeedCardNum)));
            this.numText = (((("( " + this.selectCardsArray.length) + " / ") + this.maxNeedCardNum) + " )");
            if (this.ensureBtnEnabled){
                this.numRemind.setStyle("color", 0xFF00);
            } else {
                this.numRemind.setStyle("color", 0xFF0000);
            };
        }
        protected function btnClickHandler(_arg1:Boolean):void{
            var _local2:Array;
            var _local3:GameCard;
            if ((((this.maxNeedCardNum <= 0)) || ((_arg1 == false)))){
                this.removeSelf();
                this.doSelect("'',0");
            } else {
                _local2 = new Array();
                _local2.push("''");
                _local2.push(this.selectCardsArray.length);
                for each (_local3 in this.selectCardsArray) {
                    _local2.push(_local3.getPos());
                };
                this.doSelect(_local2.toString());
            };
        }
        private function doSelect(_arg1:String):void{
            var _local2 = (("return d:do_select(" + _arg1) + ");");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            if ((((_local3.length > 1)) && ((_local3[1] == true)))){
                this.removeSelf();
            };
        }
        override public function removeSelf():void{
            var _local1:GameCard;
            var _local2:int;
            this.clean();
            super.removeSelf();
            CombatConsole.getInstance().setOperationMenuFlag("select", false);
            for each (_local2 in this.satisfyCards) {
                _local1 = CombatStage.getInstance().cardTableBySn[_local2];
                _local1.setSelectState(false);
                _local1.depth = _local1._depth;
            };
        }
        private function clean():void{
            var _local1:GameCard;
            for each (_local1 in this.selectCardsArray) {
                SelectCardFilter.createSelectFilters(false, _local1);
            };
            CombatStage.getInstance().removeEventListener(MyEvent.MOUSE_CLICK_CARD, this.mouseClickCard);
            GuideFunctions.removeMaskWindow();
        }
        private function _SelectCardOnStage_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 220;
            _local1.y = 264;
            _local1.width = 786;
            _local1.height = 106;
            _local1.fill = this._SelectCardOnStage_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._SelectCardOnStage_GradientEntry1_c(), this._SelectCardOnStage_GradientEntry2_i(), this._SelectCardOnStage_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_GradientEntry2_i():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0.5;
            this.lineColor = _local1;
            BindingManager.executeBindings(this, "lineColor", this.lineColor);
            return (_local1);
        }
        private function _SelectCardOnStage_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.mouseEnabled = false;
            _local1.horizontalCenter = 96;
            _local1.width = 640;
            _local1.bottom = 473;
            _local1.filters = [this._SelectCardOnStage_GlowFilter1_c()];
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 40);
            _local1.setStyle("color", 0);
            _local1.setStyle("textAlign", "center");
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _SelectCardOnStage_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.mouseEnabled = false;
            _local1.horizontalCenter = 96;
            _local1.width = 264;
            _local1.bottom = 435;
            _local1.filters = [this._SelectCardOnStage_GlowFilter2_c()];
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 36);
            _local1.setStyle("color", 0);
            _local1.setStyle("textAlign", "center");
            _local1.id = "numRemind";
            if (!_local1.document){
                _local1.document = this;
            };
            this.numRemind = _local1;
            BindingManager.executeBindings(this, "numRemind", this.numRemind);
            return (_local1);
        }
        private function _SelectCardOnStage_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOnStage_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "确 定";
            _local1.width = 60;
            _local1.height = 27;
            _local1.scaleX = 1.5;
            _local1.scaleY = 1.5;
            _local1.x = 760;
            _local1.y = 331;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__ensureBtn_click);
            _local1.id = "ensureBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.ensureBtn = _local1;
            BindingManager.executeBindings(this, "ensureBtn", this.ensureBtn);
            return (_local1);
        }
        public function __ensureBtn_click(_arg1:MouseEvent):void{
            this.btnClickHandler(true);
        }
        private function _SelectCardOnStage_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.label = "取 消";
            _local1.width = 60;
            _local1.height = 27;
            _local1.scaleX = 1.5;
            _local1.scaleY = 1.5;
            _local1.x = 870;
            _local1.y = 331;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__cancelBtn_click);
            _local1.id = "cancelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cancelBtn = _local1;
            BindingManager.executeBindings(this, "cancelBtn", this.cancelBtn);
            return (_local1);
        }
        public function __cancelBtn_click(_arg1:MouseEvent):void{
            this.btnClickHandler(false);
        }
        public function ___SelectCardOnStage_StageSelectWindowBase1_initialize(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        private function _SelectCardOnStage_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_SELECT_CARD_ON_STAGE);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():String{
                var _local1:* = tipText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "tips.text");
            result[2] = new Binding(this, function ():String{
                var _local1:* = numText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "numRemind.text");
            result[3] = new Binding(this, function ():Boolean{
                return (ensureBtnEnabled);
            }, null, "ensureBtn.enabled");
            result[4] = new Binding(this, function ():Boolean{
                return (cancelBtnEnabled);
            }, null, "cancelBtn.visible");
            return (result);
        }
        public function get cancelBtn():Button{
            return (this._476548482cancelBtn);
        }
        public function set cancelBtn(_arg1:Button):void{
            var _local2:Object = this._476548482cancelBtn;
            if (_local2 !== _arg1){
                this._476548482cancelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local2, _arg1));
                };
            };
        }
        public function get ensureBtn():Button{
            return (this._1286989506ensureBtn);
        }
        public function set ensureBtn(_arg1:Button):void{
            var _local2:Object = this._1286989506ensureBtn;
            if (_local2 !== _arg1){
                this._1286989506ensureBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ensureBtn", _local2, _arg1));
                };
            };
        }
        public function get lineColor():GradientEntry{
            return (this._1822070833lineColor);
        }
        public function set lineColor(_arg1:GradientEntry):void{
            var _local2:Object = this._1822070833lineColor;
            if (_local2 !== _arg1){
                this._1822070833lineColor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineColor", _local2, _arg1));
                };
            };
        }
        public function get numRemind():Label{
            return (this._1191722027numRemind);
        }
        public function set numRemind(_arg1:Label):void{
            var _local2:Object = this._1191722027numRemind;
            if (_local2 !== _arg1){
                this._1191722027numRemind = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numRemind", _local2, _arg1));
                };
            };
        }
        public function get tips():Label{
            return (this._3560248tips);
        }
        public function set tips(_arg1:Label):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        private function get ensureBtnEnabled():Boolean{
            return (this._245942307ensureBtnEnabled);
        }
        private function set ensureBtnEnabled(_arg1:Boolean):void{
            var _local2:Object = this._245942307ensureBtnEnabled;
            if (_local2 !== _arg1){
                this._245942307ensureBtnEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ensureBtnEnabled", _local2, _arg1));
                };
            };
        }
        private function get cancelBtnEnabled():Boolean{
            return (this._990953311cancelBtnEnabled);
        }
        private function set cancelBtnEnabled(_arg1:Boolean):void{
            var _local2:Object = this._990953311cancelBtnEnabled;
            if (_local2 !== _arg1){
                this._990953311cancelBtnEnabled = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtnEnabled", _local2, _arg1));
                };
            };
        }
        private function get tipText():String{
            return (this._1311656856tipText);
        }
        private function set tipText(_arg1:String):void{
            var _local2:Object = this._1311656856tipText;
            if (_local2 !== _arg1){
                this._1311656856tipText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipText", _local2, _arg1));
                };
            };
        }
        private function get numText():String{
            return (this._2000932397numText);
        }
        private function set numText(_arg1:String):void{
            var _local2:Object = this._2000932397numText;
            if (_local2 !== _arg1){
                this._2000932397numText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
