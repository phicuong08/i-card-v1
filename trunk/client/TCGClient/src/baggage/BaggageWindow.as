//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
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
    import spark.layouts.*;
    import spark.filters.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class BaggageWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _BaggageWindow_CommonInnerFrame1:CommonInnerFrame;
        private var _413245038addEffect:Fade;
        private var _2131590956itemGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var addEffectEnd:Boolean = false;
        public var allItemContainer:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BaggageWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.allItemContainer = new Object();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BaggageWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_baggage_BaggageWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (BaggageWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 330;
            this.height = 380;
            this.mxmlContent = [this._BaggageWindow_LargeFrameWindowWithTitle1_c(), this._BaggageWindow_CommonInnerFrame1_i(), this._BaggageWindow_Group1_i(), this._BaggageWindow_CloseSignBtn1_c()];
            this._BaggageWindow_Fade1_i();
            this.addEventListener("remove", this.___BaggageWindow_AutoDepthGroup1_remove);
            this.addEventListener("creationComplete", this.___BaggageWindow_AutoDepthGroup1_creationComplete);
            this.addEventListener("mouseUp", this.___BaggageWindow_AutoDepthGroup1_mouseUp);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BaggageWindow._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler():void{
            var _local2:BaggageWindowItem;
            this.creationHasComplete = true;
            var _local1:int;
            while (_local1 < 25) {
                _local2 = new BaggageWindowItem();
                _local2.pos = (_local1 + 1);
                this.allItemContainer[_local2.pos] = _local2;
                this.itemGroup.addElement(_local2);
                _local1++;
            };
        }
        protected function addEffect_effectEndHandler():void{
            this.setAllItemInfo();
        }
        public function setAllItemInfo():void{
            var _local2:BaggageWindowItem;
            if (!this.creationHasComplete){
                return;
            };
            var _local1:Object = UserObject.item;
            for each (_local2 in this.allItemContainer) {
                _local2.itemLogicInfo = _local1[_local2.pos.toString()];
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:BaggageWindowItem;
            BaggageWindowRemoveEffect.showEffect(this);
            for each (_local2 in this.allItemContainer) {
                _local2.itemLogicInfo = null;
            };
        }
        private function _BaggageWindow_Fade1_i():Fade{
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
            this.addEffect_effectEndHandler();
        }
        private function _BaggageWindow_LargeFrameWindowWithTitle1_c():LargeFrameWindowWithTitle{
            var _local1:LargeFrameWindowWithTitle;
            _local1 = new LargeFrameWindowWithTitle();
            _local1.width = 330;
            _local1.height = 380;
            _local1.titleText = "包裹";
            _local1.filters = [this._BaggageWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___BaggageWindow_LargeFrameWindowWithTitle1_mouseDown);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BaggageWindow_LargeFrameWindowWithTitle1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        private function _BaggageWindow_CommonInnerFrame1_i():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.x = 15;
            _local1.y = 65;
            _local1.alpha = 0.9;
            _local1.id = "_BaggageWindow_CommonInnerFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._BaggageWindow_CommonInnerFrame1 = _local1;
            BindingManager.executeBindings(this, "_BaggageWindow_CommonInnerFrame1", this._BaggageWindow_CommonInnerFrame1);
            return (_local1);
        }
        private function _BaggageWindow_Group1_i():Group{
            var _local1:Group;
            _local1 = new Group();
            _local1.x = 25;
            _local1.y = 75;
            _local1.width = 280;
            _local1.height = 280;
            _local1.layout = this._BaggageWindow_TileLayout1_c();
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        private function _BaggageWindow_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.horizontalGap = 0;
            _local1.verticalGap = 0;
            _local1.orientation = "rows";
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 7;
            _local1.top = 20;
            _local1.addEventListener("click", this.___BaggageWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___BaggageWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        public function ___BaggageWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        public function ___BaggageWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___BaggageWindow_AutoDepthGroup1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _BaggageWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [300, 300];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_BaggageWindow_CommonInnerFrame1.size");
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

    }
}//package baggage 
