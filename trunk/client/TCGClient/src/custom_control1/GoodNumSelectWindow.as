//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
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

    public class GoodNumSelectWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GoodNumSelectWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _GoodNumSelectWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _GoodNumSelectWindow_Label3:Label;
        public var _GoodNumSelectWindow_Label4:Label;
        private var _413245038addEffect:Fade;
        private var _1464533731descLabel:Label;
        private var _1226691591numSlider:HSlider;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _1004841617maxItemNum:int;
        protected var _248010079userSelectNum:int = 1;
        protected var goodsInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GoodNumSelectWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GoodNumSelectWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_GoodNumSelectWindowWatcherSetupUtil");
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
            this.width = 0xFF;
            this.height = 120;
            this.depth = 20;
            this.mxmlContent = [this._GoodNumSelectWindow_CommonOuterFrame1_i(), this._GoodNumSelectWindow_CommonMiddleFrame1_i(), this._GoodNumSelectWindow_Label1_i(), this._GoodNumSelectWindow_Label2_c(), this._GoodNumSelectWindow_HSlider1_i(), this._GoodNumSelectWindow_Label3_i(), this._GoodNumSelectWindow_Label4_i(), this._GoodNumSelectWindow_BlueSmallButton1_c(), this._GoodNumSelectWindow_BlueSmallButton2_c()];
            this._GoodNumSelectWindow_Fade1_i();
            this.addEventListener("remove", this.___GoodNumSelectWindow_AutoDepthGroup1_remove);
            this.addEventListener("creationComplete", this.___GoodNumSelectWindow_AutoDepthGroup1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GoodNumSelectWindow._watcherSetupUtil = _arg1;
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
        protected function autodepthgroup1_creationCompleteHandler():void{
        }
        public function setInfo(_arg1:Object):void{
            this.goodsInfo = _arg1;
            this.maxItemNum = _arg1.num;
        }
        protected function clickConfirmBtn():void{
            this.removeSelf();
        }
        protected function clickCancelBtn():void{
            this.removeSelf();
        }
        protected function numSlider_changeHandler(_arg1:Event):void{
            this.userSelectNum = this.numSlider.value;
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function autodepthgroup1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 300, 1, 0);
            _local2.effectContainer.depth = this.depth;
            _local2.play();
        }
        private function _GoodNumSelectWindow_Fade1_i():Fade{
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
            mouseChildren = true;
        }
        private function _GoodNumSelectWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.filters = [this._GoodNumSelectWindow_DropShadowFilter1_c()];
            _local1.id = "_GoodNumSelectWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GoodNumSelectWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_GoodNumSelectWindow_CommonOuterFrame1", this._GoodNumSelectWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _GoodNumSelectWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GoodNumSelectWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 16;
            _local1.y = 13;
            _local1.id = "_GoodNumSelectWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GoodNumSelectWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_GoodNumSelectWindow_CommonMiddleFrame1", this._GoodNumSelectWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _GoodNumSelectWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 27;
            _local1.horizontalCenter = 0;
            _local1.setStyle("color", 16178309);
            _local1.setStyle("fontSize", 16);
            _local1.id = "descLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.descLabel = _local1;
            BindingManager.executeBindings(this, "descLabel", this.descLabel);
            return (_local1);
        }
        private function _GoodNumSelectWindow_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 59;
            _local1.y = 54;
            _local1.text = "1";
            _local1.setStyle("color", 16178309);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GoodNumSelectWindow_HSlider1_i():HSlider{
            var _local1:HSlider = new HSlider();
            _local1.x = 75;
            _local1.y = 56;
            _local1.stepSize = 1;
            _local1.minimum = 1;
            _local1.width = 100;
            _local1.addEventListener("change", this.__numSlider_change);
            _local1.id = "numSlider";
            if (!_local1.document){
                _local1.document = this;
            };
            this.numSlider = _local1;
            BindingManager.executeBindings(this, "numSlider", this.numSlider);
            return (_local1);
        }
        public function __numSlider_change(_arg1:Event):void{
            this.numSlider_changeHandler(_arg1);
        }
        private function _GoodNumSelectWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 180;
            _local1.y = 54;
            _local1.setStyle("color", 16178309);
            _local1.setStyle("fontSize", 16);
            _local1.id = "_GoodNumSelectWindow_Label3";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GoodNumSelectWindow_Label3 = _local1;
            BindingManager.executeBindings(this, "_GoodNumSelectWindow_Label3", this._GoodNumSelectWindow_Label3);
            return (_local1);
        }
        private function _GoodNumSelectWindow_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.bottom = 25;
            _local1.horizontalCenter = 0;
            _local1.setStyle("color", 16178309);
            _local1.setStyle("fontSize", 12);
            _local1.id = "_GoodNumSelectWindow_Label4";
            if (!_local1.document){
                _local1.document = this;
            };
            this._GoodNumSelectWindow_Label4 = _local1;
            BindingManager.executeBindings(this, "_GoodNumSelectWindow_Label4", this._GoodNumSelectWindow_Label4);
            return (_local1);
        }
        private function _GoodNumSelectWindow_BlueSmallButton1_c():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.left = 50;
            _local1.bottom = 20;
            _local1.label = "确认";
            _local1.addEventListener("click", this.___GoodNumSelectWindow_BlueSmallButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GoodNumSelectWindow_BlueSmallButton1_click(_arg1:MouseEvent):void{
            this.clickConfirmBtn();
        }
        private function _GoodNumSelectWindow_BlueSmallButton2_c():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.right = 50;
            _local1.bottom = 20;
            _local1.label = "取消";
            _local1.addEventListener("click", this.___GoodNumSelectWindow_BlueSmallButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GoodNumSelectWindow_BlueSmallButton2_click(_arg1:MouseEvent):void{
            this.clickCancelBtn();
        }
        public function ___GoodNumSelectWindow_AutoDepthGroup1_remove(_arg1:FlexEvent):void{
            this.autodepthgroup1_removeHandler(_arg1);
        }
        public function ___GoodNumSelectWindow_AutoDepthGroup1_creationComplete(_arg1:FlexEvent):void{
            this.autodepthgroup1_creationCompleteHandler();
        }
        private function _GoodNumSelectWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [0xFF, 120];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GoodNumSelectWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [223, 92];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_GoodNumSelectWindow_CommonMiddleFrame1.size");
            result[3] = new Binding(this, function ():Number{
                return (maxItemNum);
            }, null, "numSlider.maximum");
            result[4] = new Binding(this, function ():String{
                var _local1:* = maxItemNum;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_GoodNumSelectWindow_Label3.text");
            result[5] = new Binding(this, function ():String{
                var _local1:* = ("数目：" + userSelectNum);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_GoodNumSelectWindow_Label4.text");
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
        public function get descLabel():Label{
            return (this._1464533731descLabel);
        }
        public function set descLabel(_arg1:Label):void{
            var _local2:Object = this._1464533731descLabel;
            if (_local2 !== _arg1){
                this._1464533731descLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descLabel", _local2, _arg1));
                };
            };
        }
        public function get numSlider():HSlider{
            return (this._1226691591numSlider);
        }
        public function set numSlider(_arg1:HSlider):void{
            var _local2:Object = this._1226691591numSlider;
            if (_local2 !== _arg1){
                this._1226691591numSlider = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numSlider", _local2, _arg1));
                };
            };
        }
        protected function get maxItemNum():int{
            return (this._1004841617maxItemNum);
        }
        protected function set maxItemNum(_arg1:int):void{
            var _local2:Object = this._1004841617maxItemNum;
            if (_local2 !== _arg1){
                this._1004841617maxItemNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxItemNum", _local2, _arg1));
                };
            };
        }
        protected function get userSelectNum():int{
            return (this._248010079userSelectNum);
        }
        protected function set userSelectNum(_arg1:int):void{
            var _local2:Object = this._248010079userSelectNum;
            if (_local2 !== _arg1){
                this._248010079userSelectNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userSelectNum", _local2, _arg1));
                };
            };
        }

    }
}//package custom_control 
