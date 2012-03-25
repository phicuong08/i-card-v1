//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.utils.*;

    public class AnimateFilterEffectBase extends CustomEffectBase {

        public var target:DisplayObject;
        public var duration:Number;
        protected var bitmapFilter:BitmapFilter;

        public function AnimateFilterEffectBase(_arg1:DisplayObject, _arg2:Number){
            this.target = _arg1;
            this.duration = _arg2;
            super();
        }
        protected function addFilterToTarget():void{
            var _local1:Array = this.target.filters;
            if (!_local1){
                this.target.filters = [this.bitmapFilter];
            } else {
                if (_local1.indexOf(this.bitmapFilter) == -1){
                    _local1.push(this.bitmapFilter);
                    this.target.filters = _local1;
                };
            };
        }
        protected function removeFilterFromTarget():void{
            var _local2:int;
            var _local1:Array = this.target.filters;
            if (_local1){
                _local2 = _local1.indexOf(this.bitmapFilter);
                if (_local2 != -1){
                    _local1.splice(_local2, 1);
                    this.target.filters = _local1;
                };
            };
        }
        override public function play():void{
            this.addFilterToTarget();
            super.play();
            this.enterFrameHandler(null);
        }
        override public function end():void{
            this.removeFilterFromTarget();
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.changeFilterByPercent(_local2);
            };
        }
        protected function changeFilterByPercent(_arg1:Number):void{
            this.target.filters = this.target.filters;
        }

    }
}//package custom_effect 
