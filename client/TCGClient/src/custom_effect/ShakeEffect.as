//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;
    import flash.filters.*;
    import flash.utils.*;

    public class ShakeEffect extends CustomEffectBase {

        public var target;
        public var duration:int;
        public var needBlur:Boolean;
        public var intensity:int;
        private var blurFiler:BlurFilter;
        private var originalX:Number;
        private var originalY:Number;

        public function ShakeEffect(_arg1, _arg2:Number=1000, _arg3:int=10, _arg4:Boolean=false){
            this.target = _arg1;
            this.duration = _arg2;
            this.needBlur = _arg4;
            this.intensity = _arg3;
            super();
        }
        protected function addFilterToTarget():void{
            if (!this.blurFiler){
                return;
            };
            var _local1:Array = this.target.filters;
            if (!_local1){
                this.target.filters = [this.blurFiler];
            } else {
                if (_local1.indexOf(this.blurFiler) == -1){
                    _local1.push(this.blurFiler);
                    this.target.filters = _local1;
                };
            };
        }
        protected function removeFilterFromTarget():void{
            var _local2:int;
            if (!this.blurFiler){
                return;
            };
            var _local1:Array = this.target.filters;
            if (_local1){
                _local2 = _local1.indexOf(this.blurFiler);
                if (_local2 != -1){
                    _local1.splice(_local2, 1);
                    this.target.filters = _local1;
                };
            };
        }
        override public function play():void{
            if (!isPlaying){
                this.originalX = this.target.x;
                this.originalY = this.target.y;
                if (((this.needBlur) && (!(this.blurFiler)))){
                    this.blurFiler = new BlurFilter();
                };
            };
            super.play();
        }
        override public function end():void{
            this.target.x = this.originalX;
            this.target.y = this.originalY;
            this.removeFilterFromTarget();
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local3:Number;
            var _local4:Number;
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                _local3 = ((Math.random() - 0.5) * this.intensity);
                _local4 = ((Math.random() - 0.5) * this.intensity);
                if (this.needBlur){
                    this.blurFiler.blurX = int(Math.abs(_local3));
                    this.blurFiler.blurY = int(Math.abs(_local4));
                    this.addFilterToTarget();
                };
                this.target.x = (this.originalX + _local3);
                this.target.y = (this.originalY + _local4);
            };
        }

    }
}//package custom_effect 
