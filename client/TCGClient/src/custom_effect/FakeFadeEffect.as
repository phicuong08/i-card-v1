//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class FakeFadeEffect extends InsideEffectBase {

        public var alphaFrom:Number;
        public var alphaTo:Number;
        public var targetBmd:BitmapData;

        public function FakeFadeEffect(_arg1, _arg2:int, _arg3:Number, _arg4:Number, _arg5:BitmapData=null){
            super(_arg1, _arg2);
            this.alphaFrom = _arg3;
            this.alphaTo = _arg4;
            this.targetBmd = _arg5;
            if (!this.targetBmd){
                this.targetBmd = new BitmapData(_arg1.width, _arg1.height, true, 0);
                this.targetBmd.draw(_arg1);
            };
            effectContainer.addChild(new Bitmap(this.targetBmd));
        }
        override public function play():void{
            effectContainer.alpha = this.alphaFrom;
            super.play();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            effectContainer.alpha = (this.alphaFrom + ((this.alphaTo - this.alphaFrom) * this.easeOut((getTimer() - effectStartTime), duration)));
            super.enterFrameHandler(_arg1);
        }
        private function easeOut(_arg1:Number, _arg2:Number):Number{
            _arg1 = (1 - (_arg1 / _arg2));
            return ((1 - (_arg1 * _arg1)));
        }

    }
}//package custom_effect 
