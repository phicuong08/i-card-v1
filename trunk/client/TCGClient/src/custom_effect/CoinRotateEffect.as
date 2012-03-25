//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;
    import spark.components.*;
    import custom_control1.*;
    import flash.filters.*;
    import source_manager.*;
    import flash.utils.*;
    import tool.*;

    public class CoinRotateEffect extends CustomEffectBase {

        public var effectContainer:Group;
        public var toPositive:Boolean = true;
        public var playStage;
        public var rotateDuration:Number = 800;
        public var glowDuration:Number = 1200;
        public var fadeDuration:Number = 500;
        public var rotateStepOnePercent:Number = 0.125;
        public var rotateStepOneCircleTime:int = 1;
        public var rotateStepTwoCircleTime:int = 3;
        private var positiveBmp:SmoothImage;
        private var reverseBmp:SmoothImage;
        private var playGlowForTheFirstTime:Boolean = true;
        private var colorMatrixFilter:ColorMatrixFilter;

        public function CoinRotateEffect(_arg1, _arg2:Boolean, _arg3:Number, _arg4:Number){
            this.effectContainer = new Group();
            this.positiveBmp = new SmoothImage();
            this.reverseBmp = new SmoothImage();
            super();
            this.playStage = _arg1;
            this.toPositive = _arg2;
            this.positiveBmp.source = CombatStageSourceMgr.getInstance().getSourceClass("positiveCoin");
            this.positiveBmp.transformX = 56;
            this.positiveBmp.transformY = 56;
            this.reverseBmp.source = CombatStageSourceMgr.getInstance().getSourceClass("reverseCoin");
            this.reverseBmp.transformX = 56;
            this.reverseBmp.transformY = 56;
            this.effectContainer.mouseChildren = false;
            this.effectContainer.mouseEnabled = false;
            this.effectContainer.x = _arg3;
            this.effectContainer.y = _arg4;
        }
        override public function play():void{
            this.effectContainer.addElement(this.positiveBmp);
            this.effectContainer.addElement(this.reverseBmp);
            this.reverseBmp.visible = false;
            this.playStage.addElement(this.effectContainer);
            super.play();
        }
        override public function end():void{
            var _local1:* = this.effectContainer.parent;
            if (_local1){
                _local1.removeElement(this.effectContainer);
            };
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = (getTimer() - effectStartTime);
            if (_local2 > (this.rotateDuration + this.glowDuration)){
                this.playFadeEffect(_local2);
            } else {
                if (_local2 > this.rotateDuration){
                    this.playGlowEffect(_local2);
                } else {
                    this.playRotateEffect(_local2);
                };
            };
        }
        protected function playRotateEffect(_arg1:Number):void{
            var _local2:Number;
            var _local3:Number;
            var _local4:Number = (_arg1 / this.rotateDuration);
            if (_local4 <= this.rotateStepOnePercent){
                _local2 = (((_local4 / this.rotateStepOnePercent) * this.rotateStepOneCircleTime) * 360);
            } else {
                _local2 = (Math.sin(((((_local4 - this.rotateStepOnePercent) / (1 - this.rotateStepOnePercent)) * Math.PI) / 2)) * ((this.rotateStepTwoCircleTime * 360) + (this.toPositive) ? 0 : -180));
            };
            _local3 = (_local2 % 360);
            if ((((_local3 >= 90)) && ((_local3 <= 270)))){
                this.positiveBmp.visible = false;
                this.reverseBmp.visible = true;
                this.reverseBmp.rotationY = (_local2 - 180);
            } else {
                this.positiveBmp.visible = true;
                this.positiveBmp.rotationY = _local2;
                this.reverseBmp.visible = false;
            };
        }
        protected function playGlowEffect(_arg1:Number):void{
            if (this.playGlowForTheFirstTime){
                this.doGlowPrepare();
            };
            var _local2:Number = ((_arg1 - this.rotateDuration) / this.glowDuration);
            this.colorMatrixFilter.matrix = ColorUtil.getColorMatrixByBrightness((Math.sin((_local2 * Math.PI)) * 0.5));
            this.effectContainer.filters = [this.colorMatrixFilter];
        }
        protected function doGlowPrepare():void{
            this.playGlowForTheFirstTime = false;
            this.positiveBmp.visible = this.toPositive;
            this.reverseBmp.visible = !(this.toPositive);
            this.positiveBmp.rotationY = 0;
            this.reverseBmp.rotationY = 0;
            this.colorMatrixFilter = new ColorMatrixFilter();
        }
        protected function playFadeEffect(_arg1:Number):void{
            var _local2:Number = (((_arg1 - this.rotateDuration) - this.glowDuration) / this.fadeDuration);
            if (_local2 > 1){
                this.end();
            } else {
                this.effectContainer.alpha = Math.cos(((_local2 * Math.PI) / 2));
            };
        }

    }
}//package custom_effect 
