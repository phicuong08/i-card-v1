//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
    import custom_control1.*;
    
    import custom_effect.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mouse_keyboard_mgr.*;
    
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import ui_element.*;

    public class CardBaggageOpenWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardBaggageOpenWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _CardBaggageOpenWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Fade;
        private var _273241018mainGroup:VGroup;
        private var _66803829scrollerUp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        public var allBaggageOpenResult:Object;
        public var newCardInfo:Object;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function CardBaggageOpenWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.newCardInfo = new Object();
            this._embed_mxml_source_commonUI____png_1538356188 = CardBaggageOpenWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardBaggageOpenWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_item_system_CardBaggageOpenWindowWatcherSetupUtil");
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
            this.x = 192;
            this.y = 95;
            this.width = 895;
            this.height = 610;
            this.depth = 20;
            this.layout = this._CardBaggageOpenWindow_BasicLayout1_c();
            this.mxmlContent = [this._CardBaggageOpenWindow_CommonOuterFrame1_i(), this._CardBaggageOpenWindow_CommonMiddleFrame1_i(), this._CardBaggageOpenWindow_SmoothBitmapImage1_c(), this._CardBaggageOpenWindow_Label1_c(), this._CardBaggageOpenWindow_CloseSignBtn1_c(), this._CardBaggageOpenWindow_Scroller1_i()];
            this._CardBaggageOpenWindow_Fade1_i();
            this.addEventListener("initialize", this.___CardBaggageOpenWindow_Group1_initialize);
            this.addEventListener("remove", this.___CardBaggageOpenWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardBaggageOpenWindow._watcherSetupUtil = _arg1;
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
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function add_effectEndHandler(_arg1:EffectEvent):void{
            var _local2:Object;
            for each (_local2 in this.allBaggageOpenResult) {
                this.displayOneBaggageOpenResult(_local2);
            };
        }
        private function displayOneBaggageOpenResult(_arg1:Object):void{
            var _local4:String;
            var _local5:int;
            var _local6:CardBaggageOpenWindowItem;
            var _local2:HGroup = new HGroup();
            _local2.gap = 20;
            var _local3:CardBaggageImage = new CardBaggageImage();
            _local3.setItemById(_arg1.id);
            _local3.scaleX = 1.4;
            _local3.scaleY = 1.4;
            _local2.addElement(_local3);
            for (_local4 in _arg1.get_card_info) {
                _local5 = 0;
                while (_local5 < _arg1.get_card_info[_local4]) {
                    _local6 = new CardBaggageOpenWindowItem();
                    _local6.setInfo(_local4, 1, !((this.newCardInfo[_local4] == null)));
                    _local2.addElement(_local6);
                    _local5++;
                };
            };
            this.mainGroup.addElement(_local2);
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.play();
        }
        protected function stopDragHandler():void{
            this.stopDrag();
            var _local1:Point = parent.globalToLocal(localToGlobal(new Point(0, 0)));
            x = _local1.x;
            y = _local1.y;
        }
        private function _CardBaggageOpenWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 300;
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.add_effectEndHandler(_arg1);
        }
        private function _CardBaggageOpenWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.mouseEnabled = true;
            _local1.alpha = 0.9;
            _local1.filters = [this._CardBaggageOpenWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___CardBaggageOpenWindow_CommonOuterFrame1_mouseDown);
            _local1.addEventListener("mouseUp", this.___CardBaggageOpenWindow_CommonOuterFrame1_mouseUp);
            _local1.id = "_CardBaggageOpenWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardBaggageOpenWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageOpenWindow_CommonOuterFrame1", this._CardBaggageOpenWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardBaggageOpenWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
            MouseMgr.getInstance().setCursor("drag");
        }
        public function ___CardBaggageOpenWindow_CommonOuterFrame1_mouseUp(_arg1:MouseEvent):void{
            this.stopDragHandler();
            MouseMgr.getInstance().clearCursor("drag");
        }
        private function _CardBaggageOpenWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 9;
            _local1.y = 48;
            _local1.alpha = 0.7;
            _local1.id = "_CardBaggageOpenWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardBaggageOpenWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageOpenWindow_CommonMiddleFrame1", this._CardBaggageOpenWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 0;
            _local1.y = 21;
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 30;
            _local1.y = 13;
            _local1.text = "抽卡结果";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 7;
            _local1.top = 7;
            _local1.addEventListener("click", this.___CardBaggageOpenWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardBaggageOpenWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _CardBaggageOpenWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 30;
            _local1.y = 60;
            _local1.width = 835;
            _local1.height = 510;
            _local1.viewport = this._CardBaggageOpenWindow_VGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.id = "scrollerUp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerUp = _local1;
            BindingManager.executeBindings(this, "scrollerUp", this.scrollerUp);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.gap = 15;
            _local1.paddingTop = 10;
            _local1.filters = [this._CardBaggageOpenWindow_DropShadowFilter2_c()];
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _CardBaggageOpenWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CardBaggageOpenWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___CardBaggageOpenWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _CardBaggageOpenWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [895, 610];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CardBaggageOpenWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [877, 552];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CardBaggageOpenWindow_CommonMiddleFrame1.size");
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
        public function get mainGroup():VGroup{
            return (this._273241018mainGroup);
        }
        public function set mainGroup(_arg1:VGroup):void{
            var _local2:Object = this._273241018mainGroup;
            if (_local2 !== _arg1){
                this._273241018mainGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
                };
            };
        }
        public function get scrollerUp():Scroller{
            return (this._66803829scrollerUp);
        }
        public function set scrollerUp(_arg1:Scroller):void{
            var _local2:Object = this._66803829scrollerUp;
            if (_local2 !== _arg1){
                this._66803829scrollerUp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerUp", _local2, _arg1));
                };
            };
        }

    }
}//package item_system 
