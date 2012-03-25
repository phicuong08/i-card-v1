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
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class GraveCardDisplayWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GraveCardDisplayWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _GraveCardDisplayWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _GraveCardDisplayWindow_Label1:Label;
        private var _413245038addEffect:Fade;
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
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GraveCardDisplayWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI____png_1538356188 = GraveCardDisplayWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GraveCardDisplayWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_GraveCardDisplayWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GraveCardDisplayWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.x = 350;
            this.y = 287;
            this.width = 580;
            this.height = 226;
            this.transformX = 312;
            this.transformY = 113;
            this.mxmlContent = [this._GraveCardDisplayWindow_CommonOuterFrame1_i(), this._GraveCardDisplayWindow_CommonMiddleFrame1_i(), this._GraveCardDisplayWindow_SmoothBitmapImage1_c(), this._GraveCardDisplayWindow_Label1_i(), this._GraveCardDisplayWindow_Scroller1_i(), this._GraveCardDisplayWindow_CloseSignBtn1_c()];
            this._GraveCardDisplayWindow_Fade1_i();
            this._GraveCardDisplayWindow_Rect1_i();
            this.addEventListener("remove", this.___GraveCardDisplayWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GraveCardDisplayWindow._watcherSetupUtil = _arg1;
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
            return (_local3);
        }
        public function addCards(_arg1:Array):void{
            this.cardsArr = _arg1;
            this.displayCards();
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
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
                CombatStage.getInstance().graveCardDisplayWindow = null;
            };
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
        private function _GraveCardDisplayWindow_Fade1_i():Fade{
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
        private function _GraveCardDisplayWindow_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 84;
            _local1.height = 80;
            _local1.fill = this._GraveCardDisplayWindow_LinearGradient1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._GraveCardDisplayWindow_GradientEntry1_c(), this._GraveCardDisplayWindow_GradientEntry2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xFFFFFF;
            _local1.alpha = 0.35;
            _local1.ratio = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xFFFFFF;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._GraveCardDisplayWindow_DropShadowFilter1_c()];
            _local1.id = "_GraveCardDisplayWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GraveCardDisplayWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_GraveCardDisplayWindow_CommonOuterFrame1", this._GraveCardDisplayWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 40;
            _local1.alpha = 0.7;
            _local1.id = "_GraveCardDisplayWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GraveCardDisplayWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_GraveCardDisplayWindow_CommonMiddleFrame1", this._GraveCardDisplayWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 20;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 20;
            _local1.y = 13;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            _local1.id = "_GraveCardDisplayWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GraveCardDisplayWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_GraveCardDisplayWindow_Label1", this._GraveCardDisplayWindow_Label1);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.y = 59;
            _local1.horizontalCenter = 0;
            _local1.maxWidth = 496;
            _local1.height = 140;
            _local1.viewport = this._GraveCardDisplayWindow_Group2_i();
            _local1.addEventListener("creationComplete", this.__scrollerCp_creationComplete);
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.filters = [this._GraveCardDisplayWindow_DropShadowFilter2_c()];
            _local1.addEventListener("creationComplete", this.__itemGroup_creationComplete);
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _GraveCardDisplayWindow_DropShadowFilter2_c():DropShadowFilter{
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
        private function _GraveCardDisplayWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 7;
            _local1.top = 7;
            _local1.addEventListener("click", this.___GraveCardDisplayWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GraveCardDisplayWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        public function ___GraveCardDisplayWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _GraveCardDisplayWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_GRAVE_CARD_DISPLAY_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [580, 226];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GraveCardDisplayWindow_CommonOuterFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [552, 172];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GraveCardDisplayWindow_CommonMiddleFrame1.size");
            result[4] = new Binding(this, null, null, "_GraveCardDisplayWindow_Label1.text", "title");
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

    }
}//package combat_element 
