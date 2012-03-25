//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;

    public class SurroundElfEffectElement {

        public var sX:int;
        public var sY:int;
        public var eX:int;
        public var eY:int;
        public var lineSize:Number;
        public var lineColor:Number;
        public var effectContainer:UIComponent;

        public function SurroundElfEffectElement(_arg1:UIComponent, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:Number, _arg7:Number){
            this.sX = _arg2;
            this.sY = _arg3;
            this.eX = _arg4;
            this.eY = _arg5;
            this.lineSize = _arg7;
            this.lineColor = _arg6;
            this.effectContainer = _arg1;
        }
        public function draw():void{
            this.effectContainer.graphics.lineStyle(this.lineSize, this.lineColor);
            this.effectContainer.graphics.moveTo(this.sX, this.sY);
            this.effectContainer.graphics.lineTo(this.eX, this.eY);
        }

    }
}//package custom_effect 
