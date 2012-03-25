//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.filters.*;
    import flash.utils.*;

    public class PixelBenderEffectBase extends AnimateFilterEffectBase {

        protected var shader:Shader;

        public function PixelBenderEffectBase(_arg1:DisplayObject, _arg2:Number, _arg3:Class){
            super(_arg1, _arg2);
            this.initFilter(_arg3);
        }
        protected function initFilter(_arg1:Class):void{
            this.shader = new Shader((new (_arg1)() as ByteArray));
            bitmapFilter = new ShaderFilter(this.shader);
        }

    }
}//package custom_effect 
