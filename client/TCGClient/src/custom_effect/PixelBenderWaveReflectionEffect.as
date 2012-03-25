//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;

    public class PixelBenderWaveReflectionEffect extends PixelBenderEffectBase {

        private static var cls:Class = PixelBenderWaveReflectionEffect_cls;

        public var progressFrom:Number = 0;
        public var progressTo:Number = 0;
        public var amplitudeFrom:Number = 0.33;
        public var amplitudeTo:Number = 0.33;
        public var frequencyFrom:Number = 0.22;
        public var frequencyTo:Number = 0.22;

        public function PixelBenderWaveReflectionEffect(_arg1:DisplayObject, _arg2:Number){
            super(_arg1, _arg2, cls);
        }
        override protected function changeFilterByPercent(_arg1:Number):void{
            shader.data["progress"].value = [(this.progressFrom + ((this.progressTo - this.progressFrom) * _arg1))];
            shader.data["amplitude"].value = [(this.amplitudeFrom + ((this.amplitudeTo - this.amplitudeFrom) * _arg1))];
            shader.data["frequency"].value = [(this.frequencyFrom + ((this.frequencyTo - this.frequencyFrom) * _arg1))];
            super.changeFilterByPercent(_arg1);
        }

    }
}//package custom_effect 
