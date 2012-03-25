//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class CardShowImage extends CardImage implements IBeginnerGuideOperation, IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _207684226glowEffect:AnimateFilter;
        private var _1994587966moveEffect:Move;
        private var _1234104453scaleEffect:Scale;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var _352362778fadeOutDuration:int = 1000;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardShowImage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardShowImage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_CardShowImageWatcherSetupUtil");
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
            this._CardShowImage_Fade1_i();
            this._CardShowImage_AnimateFilter1_i();
            this._CardShowImage_Move1_i();
            this._CardShowImage_Scale1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardShowImage._watcherSetupUtil = _arg1;
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
        protected function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }
        public function setInfo(_arg1:Object):void{
            if (_arg1.x){
                x = _arg1.x;
            };
            if (_arg1.y){
                y = _arg1.y;
            };
            if (_arg1.scaleX){
                scaleX = _arg1.scaleX;
            };
            if (_arg1.scaleY){
                scaleY = _arg1.scaleY;
            };
            if (_arg1["fadeOutDuration"]){
                this.fadeOutDuration = _arg1["fadeOutDuration"];
            };
            this.setCardById(_arg1.id);
        }
        public function removeOperation(_arg1:Object=null):void{
            var fadeOutEffect:* = null;
            var endHandler:* = null;
            var param = _arg1;
            endHandler = function (_arg1:CustomEffectEvent):void{
                fadeOutEffect.removeEventListener(CustomEffectEvent.END, endHandler);
                removeSelf();
            };
            fadeOutEffect = new FadeEffect(this, this.fadeOutDuration, 1, 0);
            fadeOutEffect.play();
            fadeOutEffect.addEventListener(CustomEffectEvent.END, endHandler);
        }
        public function doCmd(_arg1:Object=null){
            if (_arg1.type == "scale"){
                if (_arg1.duration){
                    this.scaleEffect.duration = _arg1.duration;
                };
                this.scaleEffect.scaleXTo = _arg1.scaleX;
                this.scaleEffect.scaleYTo = _arg1.scaleY;
                this.scaleEffect.play();
            } else {
                if (_arg1.type == "move"){
                    if (_arg1.duration){
                        this.moveEffect.duration = _arg1.duration;
                    };
                    this.moveEffect.xTo = _arg1.xTo;
                    this.moveEffect.yTo = _arg1.yTo;
                    this.moveEffect.play();
                } else {
                    if (_arg1.type == "glow"){
                        this.glowEffect.play();
                    };
                };
            };
        }
        private function _CardShowImage_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 1000;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _CardShowImage_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 500;
            _local1.bitmapFilter = this._CardShowImage_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._CardShowImage_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._CardShowImage_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._CardShowImage_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _CardShowImage_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardShowImage_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0.8;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardShowImage_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 200;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardShowImage_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 200;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardShowImage_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.duration = 300;
            this.moveEffect = _local1;
            BindingManager.executeBindings(this, "moveEffect", this.moveEffect);
            return (_local1);
        }
        private function _CardShowImage_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.duration = 300;
            this.scaleEffect = _local1;
            BindingManager.executeBindings(this, "scaleEffect", this.scaleEffect);
            return (_local1);
        }
        private function _CardShowImage_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (BeginnerGuideUtil.NOTICE_WINDOW_DEPTH);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "glowEffect.target");
            result[3] = new Binding(this, function ():Object{
                return (this);
            }, null, "scaleEffect.target");
            result[4] = new Binding(this, function ():Object{
                return (this);
            }, null, "moveEffect.target");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get glowEffect():AnimateFilter{
            return (this._207684226glowEffect);
        }
        public function set glowEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._207684226glowEffect;
            if (_local2 !== _arg1){
                this._207684226glowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local2, _arg1));
                };
            };
        }
        public function get moveEffect():Move{
            return (this._1994587966moveEffect);
        }
        public function set moveEffect(_arg1:Move):void{
            var _local2:Object = this._1994587966moveEffect;
            if (_local2 !== _arg1){
                this._1994587966moveEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEffect", _local2, _arg1));
                };
            };
        }
        public function get scaleEffect():Scale{
            return (this._1234104453scaleEffect);
        }
        public function set scaleEffect(_arg1:Scale):void{
            var _local2:Object = this._1234104453scaleEffect;
            if (_local2 !== _arg1){
                this._1234104453scaleEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scaleEffect", _local2, _arg1));
                };
            };
        }
        protected function get fadeOutDuration():int{
            return (this._352362778fadeOutDuration);
        }
        protected function set fadeOutDuration(_arg1:int):void{
            var _local2:Object = this._352362778fadeOutDuration;
            if (_local2 !== _arg1){
                this._352362778fadeOutDuration = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutDuration", _local2, _arg1));
                };
            };
        }

    }
}//package beginner_guide 
