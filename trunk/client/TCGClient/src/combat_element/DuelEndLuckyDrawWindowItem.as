//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
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
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
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

    public class DuelEndLuckyDrawWindowItem extends CardImage implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _DuelEndLuckyDrawWindowItem_ColorMatrixFilter1:ColorMatrixFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _714582971grayFilter:Array;
        private var surroundElf:SurroundElfEffect;
        private var rotatedFlag:Boolean = false;
        private var disableCard:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function DuelEndLuckyDrawWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelEndLuckyDrawWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelEndLuckyDrawWindowItemWatcherSetupUtil");
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
            this.scaleX = 1.6;
            this.scaleY = 1.6;
            this.transformX = 42;
            this.transformY = 56;
            this.isPositive = false;
            this.toolTip = "点击以抽选卡片";
            this.layout = this._DuelEndLuckyDrawWindowItem_BasicLayout1_c();
            this.filters = [this._DuelEndLuckyDrawWindowItem_ColorMatrixFilter1_i()];
            this.addEventListener("initialize", this.___DuelEndLuckyDrawWindowItem_CardImage1_initialize);
            this.addEventListener("rollOver", this.___DuelEndLuckyDrawWindowItem_CardImage1_rollOver);
            this.addEventListener("rollOut", this.___DuelEndLuckyDrawWindowItem_CardImage1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelEndLuckyDrawWindowItem._watcherSetupUtil = _arg1;
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
        protected function cardimage1_initializeHandler():void{
            reversedSource = UserObject.cardBackImg;
        }
        protected function cardimage1_rollOverHandler(_arg1:MouseEvent):void{
            if (((isPositive) && (cardInfo))){
                toolTip = CardsInfo.getCardTooltip(cardInfo);
            };
            if (((!(this.rotatedFlag)) && (!(this.disableCard)))){
                this.playSurroundEffect(true);
            };
        }
        protected function cardimage1_rollOutHandler(_arg1:MouseEvent):void{
            if (((!(this.rotatedFlag)) && (!(this.disableCard)))){
                this.playSurroundEffect(false);
            };
        }
        private function playSurroundEffect(_arg1:Boolean=true):void{
            if (_arg1){
                if (!this.surroundElf){
                    this.surroundElf = new SurroundElfEffect(this, 6, 0xCDEB00, 0xFFFFFF, 6);
                };
                if (!this.surroundElf.isPlaying){
                    this.surroundElf.play();
                };
            } else {
                if (this.surroundElf){
                    this.surroundElf.end();
                };
                this.surroundElf = null;
            };
        }
        public function changeToPositive(_arg1:Boolean):void{
            var effectTarget:* = null;
            var rotationYEffect:* = null;
            var effectEndhandler:* = null;
            var isBonusCard:* = _arg1;
            effectEndhandler = function (_arg1:CustomEffectEvent):void{
                var _rotationYEffect:* = null;
                var rotationEndhandler:* = null;
                var event:* = _arg1;
                rotationEndhandler = function (_arg1:CustomEffectEvent):void{
                    _rotationYEffect.removeEventListener(CustomEffectEvent.END, rotationEndhandler);
                    dispatchEvent(new Event("rotationEnd"));
                };
                rotationYEffect.removeEventListener(CustomEffectEvent.END, effectEndhandler);
                isPositive = true;
                setColorMatrixFilter();
                _rotationYEffect = new RotateY3DEffect(effectTarget, -90, 0, 150);
                _rotationYEffect.addEventListener(CustomEffectEvent.END, rotationEndhandler);
                _rotationYEffect.play();
            };
            this.disableCard = !(isBonusCard);
            this.rotatedFlag = true;
            this.playSurroundEffect(isBonusCard);
            effectTarget = this;
            rotationYEffect = new RotateY3DEffect(effectTarget, 0, 90, 150);
            rotationYEffect.addEventListener(CustomEffectEvent.END, effectEndhandler);
            rotationYEffect.play();
        }
        public function setColorMatrixFilter():void{
            if (this.disableCard){
                this.grayFilter = ColorUtil.getGrayColorMatrix();
            } else {
                this.grayFilter = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
            };
        }
        private function _DuelEndLuckyDrawWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindowItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._DuelEndLuckyDrawWindowItem_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_DuelEndLuckyDrawWindowItem_ColorMatrixFilter1", this._DuelEndLuckyDrawWindowItem_ColorMatrixFilter1);
            return (_local1);
        }
        public function ___DuelEndLuckyDrawWindowItem_CardImage1_initialize(_arg1:FlexEvent):void{
            this.cardimage1_initializeHandler();
        }
        public function ___DuelEndLuckyDrawWindowItem_CardImage1_rollOver(_arg1:MouseEvent):void{
            this.cardimage1_rollOverHandler(_arg1);
        }
        public function ___DuelEndLuckyDrawWindowItem_CardImage1_rollOut(_arg1:MouseEvent):void{
            this.cardimage1_rollOutHandler(_arg1);
        }
        private function _DuelEndLuckyDrawWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_DuelEndLuckyDrawWindowItem_ColorMatrixFilter1.matrix");
            return (result);
        }
        private function get grayFilter():Array{
            return (this._714582971grayFilter);
        }
        private function set grayFilter(_arg1:Array):void{
            var _local2:Object = this._714582971grayFilter;
            if (_local2 !== _arg1){
                this._714582971grayFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grayFilter", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
