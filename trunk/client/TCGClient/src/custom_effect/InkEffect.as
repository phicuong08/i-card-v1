//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.utils.*;

    public class InkEffect extends CustomEffectBase {

        public var target;
        public var duration:int;
        public var addToWindow;
        public var effectContainer:UIComponent;
        private var effectBitmapdata:BitmapData;
        private var effectExpandSize:int = 50;
        private var perlinBmd:BitmapData;
        private var blurArg:int = 2;
        private var offsetXArg:int = 1;
        private var offsetYArg:int = 1;
        private var scrollXArg:int = 0;
        private var scrollYArg:int = 0;
        private var dfXArg:int = 0;
        private var dfYArg:int = 0;
        private var mapLevel:int = 2;
        private var offsetArray:Array;
        private var df:DisplacementMapFilter;
        private var bf:BlurFilter;

        public function InkEffect(_arg1, _arg2:int=1000, _arg3:int=2, _arg4:int=2, _arg5:int=2, _arg6:int=0, _arg7:int=0, _arg8:int=5, _arg9:int=5){
            this.offsetArray = [];
            super();
            this.target = _arg1;
            this.duration = _arg2;
            this.blurArg = _arg3;
            this.offsetXArg = _arg4;
            this.offsetYArg = _arg5;
            this.scrollXArg = _arg6;
            this.scrollYArg = _arg7;
            this.dfXArg = _arg8;
            this.dfYArg = _arg9;
        }
        override public function play():void{
            super.play();
            var _local1:Matrix = new Matrix();
            _local1.tx = this.effectExpandSize;
            _local1.ty = this.effectExpandSize;
            this.effectBitmapdata = new BitmapData((this.target.width + (this.effectExpandSize * 2)), (this.target.height + (this.effectExpandSize * 2)), true, 0);
            this.effectBitmapdata.draw(this.target, _local1);
            this.effectContainer = new UIComponent();
            this.effectContainer.mouseEnabled = false;
            this.effectContainer.mouseChildren = false;
            this.effectContainer.addChild(new Bitmap(this.effectBitmapdata));
            this.addEffectContainerToStage();
            this.bf = new BlurFilter(this.blurArg, this.blurArg, 2);
            this.perlinBmd = new BitmapData(this.effectBitmapdata.width, this.effectBitmapdata.height);
            this.df = new DisplacementMapFilter(this.perlinBmd, new Point(), BitmapDataChannel.RED, BitmapDataChannel.GREEN, this.dfXArg, this.dfYArg, DisplacementMapFilterMode.CLAMP);
            var _local2:int;
            while (_local2 < this.mapLevel) {
                this.offsetArray[_local2] = new Point();
                _local2++;
            };
        }
        private function addEffectContainerToStage():void{
            var _local1:* = this.addToWindow;
            if (!_local1){
                _local1 = this.target.parent;
                if (!_local1){
                    throw (new Error("特效没有指定播放窗口,传入对象也没有父窗口,特效无处播放!"));
                };
            };
            this.effectContainer.x = (this.target.x - this.effectExpandSize);
            this.effectContainer.y = (this.target.y - this.effectExpandSize);
            _local1.addElement(this.effectContainer);
        }
        override public function end():void{
            var _local1:* = this.effectContainer.parent;
            if (_local1){
                _local1.removeElement(this.effectContainer);
            };
            super.end();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number = ((getTimer() - effectStartTime) / this.duration);
            if (_local2 >= 1){
                this.end();
            } else {
                this.render();
            };
        }
        private function render():void{
            var _local1:int;
            while (_local1 < this.mapLevel) {
                this.offsetArray[_local1].x = (this.offsetArray[_local1].x + ((_local1 + 1) * this.offsetXArg));
                this.offsetArray[_local1].y = (this.offsetArray[_local1].y + ((_local1 + 1) * this.offsetYArg));
                _local1++;
            };
            this.perlinBmd.perlinNoise(25, 25, this.mapLevel, Math.random(), false, true, (BitmapDataChannel.RED | BitmapDataChannel.GREEN), false, this.offsetArray);
            this.effectBitmapdata.lock();
            if (((!((this.scrollXArg == 0))) || (!((this.scrollYArg == 0))))){
                this.effectBitmapdata.scroll(this.scrollXArg, this.scrollYArg);
            };
            this.effectBitmapdata.applyFilter(this.effectBitmapdata, this.effectBitmapdata.rect, new Point(), this.bf);
            this.effectBitmapdata.applyFilter(this.effectBitmapdata, this.effectBitmapdata.rect, new Point(), this.df);
            this.effectBitmapdata.unlock();
        }

    }
}//package custom_effect 
