//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import combat_element.*;
    import flash.utils.*;
    import tool.*;

    public class GameCardPrepareAttackEffect {

        public var card:GameCard;
        public var duration:Number = 200;
        public var isShow:Boolean = false;
        protected var dropShadowFilter:DropShadowFilter;
        protected var colorMatrixFilter:ColorMatrixFilter;
        protected var glowFilter:GlowFilter;
        protected var effectStartTime:Number;
        protected var attackEffectMgrIsControlingCard:Boolean = false;

        public function GameCardPrepareAttackEffect(_arg1){
            this.card = _arg1;
            this.dropShadowFilter = new DropShadowFilter(20, 90, 0, 0.6);
            this.colorMatrixFilter = new ColorMatrixFilter();
            this.glowFilter = new GlowFilter(0xFF1A00, 0.6, 30, 30, 3);
        }
        public function attackEffectMgrStartControlingCard():void{
            this.removeFiltersFromTarget([this.dropShadowFilter], this.card);
            this.attackEffectMgrIsControlingCard = true;
        }
        public function attackEffectMgrStopControlingCard():void{
            if (this.isShow){
                this.addFiltersToTarget([this.dropShadowFilter], this.card);
            };
            this.attackEffectMgrIsControlingCard = false;
        }
        public function showAttackState():void{
            this.isShow = true;
            this.attackEffectMgrIsControlingCard = false;
            this.card.clearDefaultFilter();
            this.addFiltersToTarget([this.dropShadowFilter], this.card);
            this.addFiltersToTarget([this.glowFilter, this.colorMatrixFilter], this.card.cardImage);
            this.startEffect();
        }
        public function hideAttackState():void{
            this.isShow = false;
            this.startEffect();
        }
        protected function startEffect():void{
            this.effectStartTime = getTimer();
            this.card.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - this.effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.effectEnd();
            } else {
                this.changeStateByPercent((this.isShow) ? _local2 : (1 - _local2));
            };
        }
        protected function changeStateByPercent(_arg1:Number):void{
            if (!this.attackEffectMgrIsControlingCard){
                this.dropShadowFilter.distance = (20 * _arg1);
                this.card.y = (this.card._yPositon - this.dropShadowFilter.distance);
            };
            this.glowFilter.alpha = (0.6 * _arg1);
            this.colorMatrixFilter.matrix = ColorUtil.getColorMatrixByBrightness((0.22 * _arg1));
            this.card.filters = this.card.filters;
            this.card.cardImage.filters = this.card.cardImage.filters;
        }
        protected function effectEnd():void{
            this.card.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            if (!this.isShow){
                if (!this.attackEffectMgrIsControlingCard){
                    this.card.createFilter();
                };
                this.removeFiltersFromTarget([this.dropShadowFilter], this.card);
                this.removeFiltersFromTarget([this.glowFilter, this.colorMatrixFilter], this.card.cardImage);
            };
        }
        protected function addFiltersToTarget(_arg1:Array, _arg2:DisplayObject):void{
            var _local4:BitmapFilter;
            var _local3:Array = _arg2.filters;
            if (!_local3){
                _arg2.filters = _arg1;
            } else {
                for each (_local4 in _arg1) {
                    if (_local3.indexOf(_local4) == -1){
                        _local3.push(_local4);
                    };
                };
                _arg2.filters = _local3;
            };
        }
        protected function removeFiltersFromTarget(_arg1:Array, _arg2:DisplayObject):void{
            var _local4:BitmapFilter;
            var _local5:int;
            var _local3:Array = _arg2.filters;
            if (_local3){
                for each (_local4 in _arg1) {
                    _local5 = _local3.indexOf(_local4);
                    if (_local5 != -1){
                        _local3.splice(_local5, 1);
                    };
                };
                _arg2.filters = _local3;
            };
        }

    }
}//package combat_element_script 
