//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.utils.*;

    public class MyCrossFadeEffect extends CustomEffectBase {

        public var target;
        public var bitmapdataFrom:BitmapData;
        public var bitmapdataTo:BitmapData;
        public var duration:int;

        public function MyCrossFadeEffect(_arg1, _arg2:int=1000, _arg3:BitmapData=null, _arg4:BitmapData=null){
            this.target = _arg1;
            this.duration = _arg2;
            this.bitmapdataFrom = _arg3;
            this.bitmapdataTo = _arg4;
            super();
        }
        override public function play():void{
            if (((!(this.bitmapdataTo)) && (!(this.bitmapdataFrom)))){
                throw (new Error("完全么有传入图像,什么情况!"));
            };
            if (!this.bitmapdataTo){
                this.bitmapdataTo = new BitmapData(this.bitmapdataFrom.width, this.bitmapdataFrom.height, true, 0);
            };
            if (!this.bitmapdataFrom){
                this.bitmapdataFrom = new BitmapData(this.bitmapdataTo.width, this.bitmapdataTo.height, true, 0);
            };
            super.play();
        }
        override public function end():void{
            this.setData(this.bitmapdataTo);
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var multiplier:* = 0;
            var b:* = null;
            var event:* = _arg1;
            var percent:* = ((getTimer() - effectStartTime) / this.duration);
            if (percent >= 1){
                this.end();
            } else {
                multiplier = (percent * 0x0100);
                try {
                    b = this.bitmapdataFrom.clone();
                    b.merge(this.bitmapdataTo, new Rectangle(0, 0, b.width, b.height), new Point(), multiplier, multiplier, multiplier, multiplier);
                    this.setData(b);
                } catch(e) {
                    end();
                };
            };
        }
        protected function setData(_arg1:BitmapData):void{
            this.target.source = _arg1;
        }

    }
}//package custom_effect 
