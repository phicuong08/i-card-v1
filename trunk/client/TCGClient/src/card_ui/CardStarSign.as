//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
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
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
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

    public class CardStarSign extends Group {

        private var _109757471star1:SmoothBitmapImage;
        private var _109757472star2:SmoothBitmapImage;
        private var _109757473star3:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationComplete:Boolean = false;
        private var num:int = 0;
        private var _embed_mxml_source_cardUI_str_int_star_png_1028486577:Class;

        public function CardStarSign(){
            this._embed_mxml_source_cardUI_str_int_star_png_1028486577 = CardStarSign__embed_mxml_source_cardUI_str_int_star_png_1028486577;
            super();
            this.width = 52;
            this.height = 15;
            this.mxmlContent = [this._CardStarSign_SmoothBitmapImage1_i(), this._CardStarSign_SmoothBitmapImage2_i(), this._CardStarSign_SmoothBitmapImage3_i()];
            this.addEventListener("creationComplete", this.___CardStarSign_Group1_creationComplete);
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
        public function set starNum(_arg1):void{
            this.num = int(_arg1);
            if (this.creationComplete){
                this.setNum();
            };
        }
        private function setNum():void{
            var _local1:int;
            _local1 = 1;
            while (_local1 <= 3) {
                this[("star" + _local1)].visible = (this.num >= _local1);
                _local1++;
            };
        }
        protected function group1_creationCompleteHandler():void{
            this.creationComplete = true;
            this.setNum();
        }
        public function doStartChangeEffect(_arg1):void{
            var moveEffect3:* = null;
            var effect3RepeatHandler:* = null;
            var num:* = _arg1;
            effect3RepeatHandler = function (_arg1:EffectEvent):void{
                moveEffect3.removeEventListener(EffectEvent.EFFECT_REPEAT, effect3RepeatHandler);
                starNum = num;
            };
            var effectTotalDuration:* = 1000;
            var rotateEffect:* = new Rotate();
            rotateEffect.duration = effectTotalDuration;
            rotateEffect.angleBy = 1440;
            rotateEffect.targets = [this.star1, this.star2, this.star3];
            rotateEffect.play();
            var moveEffect2:* = new Move(this.star2);
            moveEffect2.duration = (effectTotalDuration / 2);
            moveEffect2.repeatCount = 2;
            moveEffect2.repeatBehavior = "reverse";
            moveEffect2.xFrom = 17;
            moveEffect2.xTo = 0;
            moveEffect2.play();
            moveEffect3 = new Move(this.star3);
            moveEffect3.duration = (effectTotalDuration / 2);
            moveEffect3.repeatCount = 2;
            moveEffect3.repeatBehavior = "reverse";
            moveEffect3.xFrom = 34;
            moveEffect3.xTo = 0;
            moveEffect3.play();
            moveEffect3.addEventListener(EffectEvent.EFFECT_REPEAT, effect3RepeatHandler);
        }
        private function _CardStarSign_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 16;
            _local1.height = 15;
            _local1.transformX = 8;
            _local1.transformY = 8;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star1");
            this.star1 = _local1;
            BindingManager.executeBindings(this, "star1", this.star1);
            return (_local1);
        }
        private function _CardStarSign_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 17;
            _local1.width = 16;
            _local1.height = 15;
            _local1.transformX = 8;
            _local1.transformY = 8;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star2");
            this.star2 = _local1;
            BindingManager.executeBindings(this, "star2", this.star2);
            return (_local1);
        }
        private function _CardStarSign_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 34;
            _local1.width = 16;
            _local1.height = 15;
            _local1.transformX = 8;
            _local1.transformY = 8;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star3");
            this.star3 = _local1;
            BindingManager.executeBindings(this, "star3", this.star3);
            return (_local1);
        }
        public function ___CardStarSign_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function get star1():SmoothBitmapImage{
            return (this._109757471star1);
        }
        public function set star1(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757471star1;
            if (_local2 !== _arg1){
                this._109757471star1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star1", _local2, _arg1));
                };
            };
        }
        public function get star2():SmoothBitmapImage{
            return (this._109757472star2);
        }
        public function set star2(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757472star2;
            if (_local2 !== _arg1){
                this._109757472star2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local2, _arg1));
                };
            };
        }
        public function get star3():SmoothBitmapImage{
            return (this._109757473star3);
        }
        public function set star3(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757473star3;
            if (_local2 !== _arg1){
                this._109757473star3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local2, _arg1));
                };
            };
        }

    }
}//package card_ui 
