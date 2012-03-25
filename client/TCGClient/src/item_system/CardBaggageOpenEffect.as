//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
    import card_ui.*;
    
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
    
    import mx.binding.*;
    import mx.core.*;
 //   import mx.effects.*;
	import mx.effects.Sequence;
    import mx.events.*;
    import mx.filters.*;
    import mx.graphics.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.primitives.*;
	
	use namespace mx_internal;
    public class CardBaggageOpenEffect extends Group implements IBindingClient {

        public static const REMOVE_EFFECT_START:String = "remove_effect_start";

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardBaggageOpenEffect_Fade1:Fade;
        public var _CardBaggageOpenEffect_Move1:Move;
        private var _265574357cardImage:CardImage;
        private var _351789940coverImg:SmoothImage;
        private var _65508229openEffect:Sequence;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        public var cardId:String;
        private var _embed_mxml_source_itemUI_card_baggage_1_png_56306370:Class;
        private var _embed_mxml_source_itemUI_card_baggage_2_png_56044484:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardBaggageOpenEffect(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_itemUI_card_baggage_1_png_56306370 = CardBaggageOpenEffect__embed_mxml_source_itemUI_card_baggage_1_png_56306370;
            this._embed_mxml_source_itemUI_card_baggage_2_png_56044484 = CardBaggageOpenEffect__embed_mxml_source_itemUI_card_baggage_2_png_56044484;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardBaggageOpenEffect_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_item_system_CardBaggageOpenEffectWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.depth = 25;
            this.layout = this._CardBaggageOpenEffect_BasicLayout1_c();
            this.mxmlContent = [this._CardBaggageOpenEffect_Rect1_c(), this._CardBaggageOpenEffect_CardImage1_i(), this._CardBaggageOpenEffect_SmoothBitmapImage1_c(), this._CardBaggageOpenEffect_SmoothImage1_i()];
            this._CardBaggageOpenEffect_Sequence1_i();
            this._CardBaggageOpenEffect_Fade2_i();
            this.addEventListener("initialize", this.___CardBaggageOpenEffect_Group1_initialize);
            this.addEventListener("creationComplete", this.___CardBaggageOpenEffect_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardBaggageOpenEffect._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.cardImage.setCardById(this.cardId);
            this.openEffect.play();
        }
        protected function openEffect_effectEndHandler(_arg1:EffectEvent):void{
            var t:* = null;
            var timerHandler:* = null;
            var event:* = _arg1;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                dispatchEvent(new Event(REMOVE_EFFECT_START));
                removeEffect.play();
            };
            t = new Timer(500, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        protected function removeEffect_effectEndHandler(_arg1:EffectEvent):void{
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        private function _CardBaggageOpenEffect_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._CardBaggageOpenEffect_Fade1_i(), this._CardBaggageOpenEffect_Move1_i()];
            _local1.addEventListener("effectEnd", this.__openEffect_effectEnd);
            this.openEffect = _local1;
            BindingManager.executeBindings(this, "openEffect", this.openEffect);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.startDelay = 300;
            _local1.duration = 300;
            this._CardBaggageOpenEffect_Fade1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageOpenEffect_Fade1", this._CardBaggageOpenEffect_Fade1);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.startDelay = 300;
            _local1.duration = 500;
            _local1.xBy = -258;
            this._CardBaggageOpenEffect_Move1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageOpenEffect_Move1", this._CardBaggageOpenEffect_Move1);
            return (_local1);
        }
        public function __openEffect_effectEnd(_arg1:EffectEvent):void{
            this.openEffect_effectEndHandler(_arg1);
        }
        private function _CardBaggageOpenEffect_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaTo = 0;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeEffect_effectEndHandler(_arg1);
        }
        private function _CardBaggageOpenEffect_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._CardBaggageOpenEffect_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.alpha = 0.4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_CardImage1_i():CardImage{
            var _local1:CardImage;
            _local1 = new CardImage();
            _local1.x = 534;
            _local1.y = 252;
            _local1.scaleX = 2.6;
            _local1.scaleY = 2.6;
            _local1.id = "cardImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImage = _local1;
            BindingManager.executeBindings(this, "cardImage", this.cardImage);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 515;
            _local1.y = 227;
            _local1.scaleX = 2;
            _local1.scaleY = 2;
            _local1.source = this._embed_mxml_source_itemUI_card_baggage_2_png_56044484;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageOpenEffect_SmoothImage1_i():SmoothImage{
            var _local1:SmoothImage = new SmoothImage();
            _local1.x = 515;
            _local1.y = 227;
            _local1.scaleX = 2;
            _local1.scaleY = 2;
            _local1.source = this._embed_mxml_source_itemUI_card_baggage_1_png_56306370;
            _local1.id = "coverImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.coverImg = _local1;
            BindingManager.executeBindings(this, "coverImg", this.coverImg);
            return (_local1);
        }
        public function ___CardBaggageOpenEffect_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        public function ___CardBaggageOpenEffect_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CardBaggageOpenEffect_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "_CardBaggageOpenEffect_Fade1.target");
            result[1] = new Binding(this, null, null, "_CardBaggageOpenEffect_Move1.target", "coverImg");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
            return (result);
        }
        public function get cardImage():CardImage{
            return (this._265574357cardImage);
        }
        public function set cardImage(_arg1:CardImage):void{
            var _local2:Object = this._265574357cardImage;
            if (_local2 !== _arg1){
                this._265574357cardImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImage", _local2, _arg1));
                };
            };
        }
        public function get coverImg():SmoothImage{
            return (this._351789940coverImg);
        }
        public function set coverImg(_arg1:SmoothImage):void{
            var _local2:Object = this._351789940coverImg;
            if (_local2 !== _arg1){
                this._351789940coverImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coverImg", _local2, _arg1));
                };
            };
        }
        public function get openEffect():Sequence{
            return (this._65508229openEffect);
        }
        public function set openEffect(_arg1:Sequence):void{
            var _local2:Object = this._65508229openEffect;
            if (_local2 !== _arg1){
                this._65508229openEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openEffect", _local2, _arg1));
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

    }
}//package item_system 
