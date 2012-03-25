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
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import item_system.*;
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

    public class SelectCardInWindow extends StageSelectWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _SelectCardInWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _SelectCardInWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _SelectCardInWindow_Label1:Label;
        private var _413245038addEffect:Fade;
        private var _476548482cancelBtn:Button;
        private var _1286989506ensureBtn:Button;
        private var _2131590956itemGroup:Group;
        private var _1149221507rollOverMask:Rect;
        private var _66803271scrollerCp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var cardsArr:Array;
        private var _cardsArr:Array;
        private var creationHasComplete:Boolean = false;
        private var addEffectEnd:Boolean = false;
        private var _110371416title:String;
        private var itemDistance:Number = 100;
        private var maxNeedCardNum:int = 0;
        private var minNeedCardNum:int = 0;
        private var selectCardsArray:Array;
        private var _245942307ensureBtnEnabled:Boolean = true;
        private var _990953311cancelBtnEnabled:Boolean = true;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SelectCardInWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.selectCardsArray = new Array();
            this._embed_mxml_source_commonUI____png_1538356188 = SelectCardInWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SelectCardInWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_SelectCardInWindowWatcherSetupUtil");
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
            this.x = 350;
            this.y = 287;
            this.width = 580;
            this.height = 0x0100;
            this.mxmlContent = [this._SelectCardInWindow_CommonOuterFrame1_i(), this._SelectCardInWindow_CommonMiddleFrame1_i(), this._SelectCardInWindow_SmoothBitmapImage1_c(), this._SelectCardInWindow_Label1_i(), this._SelectCardInWindow_Scroller1_i(), this._SelectCardInWindow_Button1_i(), this._SelectCardInWindow_Button2_i()];
            this._SelectCardInWindow_Fade1_i();
            this._SelectCardInWindow_Rect1_i();
            this.addEventListener("remove", this.___SelectCardInWindow_StageSelectWindowBase1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SelectCardInWindow._watcherSetupUtil = _arg1;
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
        private function addOneCard(_arg1:String):CardImage{
            var _local2:Object = ItemCardLib.getItemInfoById(_arg1);
            var _local3:CardImage = new CardImage();
            _local3.setCardById(_arg1);
            this.itemGroup.addElement(_local3);
            _local3.addEventListener(MouseEvent.ROLL_OVER, this.mouserOverCard);
            _local3.addEventListener(MouseEvent.ROLL_OUT, this.mouserOutCard);
            _local3.addEventListener(MouseEvent.CLICK, this.mouserClickCard);
            return (_local3);
        }
        private function displayCards():void{
            var _local1:int;
            var _local2:CardImage;
            var _local3:CardImage;
            if (((this.creationHasComplete) && (this.cardsArr))){
                _local1 = 0;
                while (_local1 < 5) {
                    if (_local1 < this.cardsArr.length){
                        _local2 = this.addOneCard(this.cardsArr[_local1].toString());
                        _local2.x = (_local1 * this.itemDistance);
                    };
                    _local1++;
                };
                if (this.cardsArr.length > 5){
                    this._cardsArr = this.cardsArr.slice(5);
                };
                this.cardsArr = null;
            };
            if (((this.addEffectEnd) && (this._cardsArr))){
                _local1 = 0;
                while (_local1 < this._cardsArr.length) {
                    _local3 = this.addOneCard(this._cardsArr[_local1].toString());
                    _local3.x = ((_local1 + 5) * this.itemDistance);
                    _local1++;
                };
                this._cardsArr = null;
            };
        }
        protected function createCompleteHandler():void{
            CombatConsole.getInstance().setOperationMenuFlag("select", true);
            this.creationHasComplete = true;
            this.displayCards();
        }
        private function mouserOverCard(_arg1:MouseEvent):void{
            var _local2:CardImage = (_arg1.currentTarget as CardImage);
            _local2.addElement(this.rollOverMask);
            CombatStage.getInstance().setCardInfo(_local2);
        }
        private function mouserOutCard(_arg1:MouseEvent):void{
            var _local2:CardImage = (_arg1.currentTarget as CardImage);
            _local2.removeElement(this.rollOverMask);
            CombatStage.getInstance().hideCardInfo();
        }
        private function mouserClickCard(_arg1:MouseEvent):void{
            var _local4:CardImage;
            if (this.maxNeedCardNum <= 0){
                return;
            };
            var _local2:CardImage = (_arg1.currentTarget as CardImage);
            var _local3:int = this.selectCardsArray.indexOf(_local2);
            if (_local3 == -1){
                if (this.selectCardsArray.length >= this.maxNeedCardNum){
                    _local4 = this.selectCardsArray.shift();
                    SelectCardFilter.createSelectFilters(false, _local4);
                };
                this.selectCardsArray.push(_local2);
                SelectCardFilter.createSelectFilters(true, _local2);
            } else {
                this.selectCardsArray.splice(_local3, 1);
                SelectCardFilter.createSelectFilters(false, _local2);
            };
            this.checkNum();
        }
        public function setInfo(_arg1:int=0, _arg2:int=0, _arg3:Boolean=true, _arg4:Array=null, _arg5:String=null, _arg6=null):void{
            this.maxNeedCardNum = _arg1;
            this.minNeedCardNum = _arg2;
            this.cancelBtnEnabled = _arg3;
            this.cardsArr = _arg4;
            this.setTipByReason(_arg5);
            this.checkNum();
            this.displayCards();
        }
        private function setTipByReason(_arg1:String):void{
            switch (_arg1){
                case "to hand":
                    this.title = "请选择加入手牌的卡：";
                    break;
                case "to deck":
                    this.title = "请选择返回卡组的卡：";
                    break;
                case "recruit":
                    this.title = "请选择出战的卡：";
                    break;
                default:
                    this.title = "请选择：";
            };
        }
        private function checkNum():void{
            this.ensureBtnEnabled = (((this.selectCardsArray.length <= this.maxNeedCardNum)) && ((this.selectCardsArray.length >= this.minNeedCardNum)));
        }
        protected function btnClickHandler(_arg1:Boolean):void{
            var _local2:Array;
            var _local3:CardImage;
            if ((((this.maxNeedCardNum <= 0)) || ((_arg1 == false)))){
                this.removeSelf();
                this.doSelect("'',0");
            } else {
                _local2 = new Array();
                _local2.push("''");
                _local2.push(this.selectCardsArray.length);
                for each (_local3 in this.selectCardsArray) {
                    _local2.push(_local3.cardId);
                };
                this.doSelect(_local2.toString());
            };
        }
        private function doSelect(_arg1:String):void{
            var _local2 = (("return d:do_select(" + _arg1) + ");");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            this.removeSelf();
        }
        override public function removeSelf():void{
            super.removeSelf();
            CombatConsole.getInstance().setOperationMenuFlag("select", false);
        }
        public function cleanCards():void{
            this.itemGroup.removeAllElements();
        }
        protected function scroller1_mouseWheelHandler(_arg1:MouseEvent):void{
            _arg1.preventDefault();
            var _local2:Number = ((_arg1.delta < 0)) ? this.itemDistance : -(this.itemDistance);
            this.itemGroup.horizontalScrollPosition = (this.itemGroup.horizontalScrollPosition + _local2);
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.addEffectEnd = true;
            this.displayCards();
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.play();
        }
        private function _SelectCardInWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _SelectCardInWindow_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 84;
            _local1.height = 80;
            _local1.fill = this._SelectCardInWindow_LinearGradient1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _SelectCardInWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._SelectCardInWindow_GradientEntry1_c(), this._SelectCardInWindow_GradientEntry2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardInWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13019270;
            _local1.alpha = 0.7;
            _local1.ratio = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardInWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13019270;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardInWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._SelectCardInWindow_DropShadowFilter1_c()];
            _local1.id = "_SelectCardInWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SelectCardInWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_SelectCardInWindow_CommonOuterFrame1", this._SelectCardInWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _SelectCardInWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardInWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.7;
            _local1.id = "_SelectCardInWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SelectCardInWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_SelectCardInWindow_CommonMiddleFrame1", this._SelectCardInWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _SelectCardInWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 20;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardInWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 29;
            _local1.y = 13;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 18);
            _local1.id = "_SelectCardInWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SelectCardInWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_SelectCardInWindow_Label1", this._SelectCardInWindow_Label1);
            return (_local1);
        }
        private function _SelectCardInWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.y = 59;
            _local1.horizontalCenter = 0;
            _local1.maxWidth = 496;
            _local1.height = 140;
            _local1.viewport = this._SelectCardInWindow_Group1_i();
            _local1.addEventListener("creationComplete", this.__scrollerCp_creationComplete);
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _SelectCardInWindow_Group1_i():Group{
            var _local1:Group = new Group();
            _local1.filters = [this._SelectCardInWindow_DropShadowFilter2_c()];
            _local1.addEventListener("creationComplete", this.__itemGroup_creationComplete);
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _SelectCardInWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __itemGroup_creationComplete(_arg1:FlexEvent):void{
            this.createCompleteHandler();
        }
        public function __scrollerCp_creationComplete(_arg1:FlexEvent):void{
            this.scrollerCp.addEventListener(MouseEvent.MOUSE_WHEEL, this.scroller1_mouseWheelHandler, true);
        }
        private function _SelectCardInWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 10;
            _local1.left = 150;
            _local1.label = "确 定";
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
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
        private function _SelectCardInWindow_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.bottom = 10;
            _local1.right = 150;
            _local1.label = "取 消";
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
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
        public function ___SelectCardInWindow_StageSelectWindowBase1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _SelectCardInWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_SELECT_CARD_IN_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [580, 0x0100];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_SelectCardInWindow_CommonOuterFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [552, 172];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_SelectCardInWindow_CommonMiddleFrame1.size");
            result[4] = new Binding(this, null, null, "_SelectCardInWindow_Label1.text", "title");
            result[5] = new Binding(this, function ():Boolean{
                return (ensureBtnEnabled);
            }, null, "ensureBtn.enabled");
            result[6] = new Binding(this, function ():Boolean{
                return (cancelBtnEnabled);
            }, null, "cancelBtn.enabled");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
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
        public function get itemGroup():Group{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:Group):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get rollOverMask():Rect{
            return (this._1149221507rollOverMask);
        }
        public function set rollOverMask(_arg1:Rect):void{
            var _local2:Object = this._1149221507rollOverMask;
            if (_local2 !== _arg1){
                this._1149221507rollOverMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverMask", _local2, _arg1));
                };
            };
        }
        public function get scrollerCp():Scroller{
            return (this._66803271scrollerCp);
        }
        public function set scrollerCp(_arg1:Scroller):void{
            var _local2:Object = this._66803271scrollerCp;
            if (_local2 !== _arg1){
                this._66803271scrollerCp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerCp", _local2, _arg1));
                };
            };
        }
        public function get title():String{
            return (this._110371416title);
        }
        public function set title(_arg1:String):void{
            var _local2:Object = this._110371416title;
            if (_local2 !== _arg1){
                this._110371416title = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local2, _arg1));
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

    }
}//package combat_element 
