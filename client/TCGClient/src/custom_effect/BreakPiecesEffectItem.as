//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;

    public class BreakPiecesEffectItem {

        public var vx:Number;
        public var vy:Number;
        public var vRotate:Number;
        public var source:Bitmap;
        private var initSpeedArg:Number;
        public var xSpeedArg:Number;
        public var ySpeedArg:Number;
        private var rotateArg:Number;
        public var originalX:Number;
        public var originalY:Number;

        public function BreakPiecesEffectItem(_arg1:Bitmap, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number){
            this.source = _arg1;
            this.initSpeedArg = _arg2;
            this.xSpeedArg = _arg3;
            this.ySpeedArg = _arg4;
            this.rotateArg = _arg5;
            this.originalX = _arg1.x;
            this.originalY = _arg1.y;
            this.init();
        }
        public function restore():void{
            this.source.x = this.originalX;
            this.source.y = this.originalY;
            this.init();
        }
        private function init():void{
            this.vx = (((Math.random() * 2) - 1) * this.initSpeedArg);
            this.vy = (((Math.random() * 2) - 1) * this.initSpeedArg);
            this.vRotate = (((Math.random() * 2) - 1) * this.rotateArg);
        }
        public function update():void{
            if (this.vRotate != 0){
                this.source.rotationZ = (this.source.rotationZ + this.vRotate);
            };
            this.source.x = (this.source.x + this.vx);
            this.source.y = (this.source.y + this.vy);
            this.vx = (this.vx + this.xSpeedArg);
            this.vy = (this.vy + this.ySpeedArg);
        }

    }
}//package custom_effect 
