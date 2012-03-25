//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
   // import mx.effects.*;
	import mx.effects.Sequence;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import spark.effects.animation.*;
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
	use namespace mx_internal;
    public class MarksWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Sequence;
        private var _1267520715removeEffect:Fade;
        private var _1012301946wordCircle:WordWithCircle;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _toNum:int = 0;
        private var rollNumWindows:Array;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function MarksWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.rollNumWindows = new Array();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MarksWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_MarksWindowWatcherSetupUtil");
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
            this.width = 100;
            this.height = 40;
            this.layout = this._MarksWindow_BasicLayout1_c();
            this.filters = [this._MarksWindow_GlowFilter2_c()];
            this.mxmlContent = [this._MarksWindow_WordWithCircle1_i(), this._MarksWindow_Label1_c()];
            this._MarksWindow_Sequence1_i();
            this._MarksWindow_Fade2_i();
            this.addEventListener("creationComplete", this.___MarksWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MarksWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.fontWeight = "bold";
                this.fontFamily = "Georgia";
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        private function rollEffectEnd(_arg1:Event):void{
            var _local4:FakeFadeEffect;
            if ((((this._toNum == 0)) && ((this.rollNumWindows.length == 1)))){
                dispatchEvent(new Event("rollToZero"));
                return;
            };
            var _local2:OneRollNum = (_arg1.currentTarget as OneRollNum);
            var _local3:int = this.rollNumWindows.indexOf(_local2);
            if (_local3 >= this._toNum.toString().length){
                _local4 = new FakeFadeEffect(_local2, 300, 1, 0);
                _local4.play();
                removeElement(_local2);
                this.rollNumWindows.splice(_local3, 1);
                this.setAllRollNumWindowPos();
            };
        }
        public function set toNum(_arg1:int):void{
            this._toNum = _arg1;
            var _local2:String = _arg1.toString();
            var _local3:int = this.rollNumWindows.length;
            while (_local3 < _local2.length) {
                this.createRollNumWindow();
                _local3++;
            };
            this.setAllRollNumWindowPos();
            var _local4:int;
            while (_local4 < this.rollNumWindows.length) {
                if (_local4 >= _local2.length){
                    (this.rollNumWindows[_local4] as OneRollNum).num = 0;
                } else {
                    (this.rollNumWindows[_local4] as OneRollNum).num = int(_local2.charAt(((_local2.length - _local4) - 1)));
                };
                _local4++;
            };
        }
        public function get toNum():int{
            return (this._toNum);
        }
        private function createRollNumWindow():void{
            var _local1:OneRollNum = new OneRollNum();
            _local1.rollDura = 500;
            _local1.x = 60;
            _local1.width = 40;
            _local1.height = 40;
            _local1.setStyle("fontSize", 40);
            _local1.addEventListener("rollEffectEnd", this.rollEffectEnd);
            addElement(_local1);
            var _local2:Fade = new Fade(_local1);
            _local2.duration = 300;
            _local2.alphaFrom = 0;
            _local2.alphaTo = 1;
            _local2.play();
            this.rollNumWindows.push(_local1);
        }
        private function setAllRollNumWindowPos():void{
            var _local2:OneRollNum;
            var _local3:Number;
            var _local4:spark.effects.Move;
            var _local1:int;
            while (_local1 < this.rollNumWindows.length) {
                _local2 = (this.rollNumWindows[((this.rollNumWindows.length - _local1) - 1)] as OneRollNum);
                _local3 = (60 + (_local1 * 30));
                if (_local3 != _local2.x){
                    _local4 = new Move(_local2);
                    _local4.xTo = _local3;
                    _local4.duration = 300;
                    _local4.play();
                };
                _local1++;
            };
        }
        protected function group1_creationCompleteHandler():void{
            if (this.rollNumWindows.length == 0){
                this.createRollNumWindow();
            };
        }
        private function _MarksWindow_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._MarksWindow_Fade1_c(), this._MarksWindow_AnimateFilter1_c()];
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _MarksWindow_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_AnimateFilter1_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._MarksWindow_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._MarksWindow_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._MarksWindow_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._MarksWindow_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaTo = 0;
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _MarksWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MarksWindow_WordWithCircle1_i():WordWithCircle{
            var _local1:WordWithCircle = new WordWithCircle();
            _local1.wordText = "令";
            _local1.wordColor = 0xFF0000;
            _local1.circleWeight = 3;
            _local1.id = "wordCircle";
            if (!_local1.document){
                _local1.document = this;
            };
            this.wordCircle = _local1;
            BindingManager.executeBindings(this, "wordCircle", this.wordCircle);
            return (_local1);
        }
        private function _MarksWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 40;
            _local1.height = 40;
            _local1.width = 40;
            _local1.text = "×";
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 40);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MarksWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        private function _MarksWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            return (result);
        }
        public function get addEffect():Sequence{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Sequence):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get wordCircle():WordWithCircle{
            return (this._1012301946wordCircle);
        }
        public function set wordCircle(_arg1:WordWithCircle):void{
            var _local2:Object = this._1012301946wordCircle;
            if (_local2 !== _arg1){
                this._1012301946wordCircle = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wordCircle", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
