//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.filters.*;
    import tool.*;

    public class BrightnessFilterEffect extends AnimateFilterEffectBase {

        public var brightnessFrom:Number;
        public var brightnessTo:Number;

        public function BrightnessFilterEffect(_arg1:DisplayObject, _arg2:Number, _arg3:Number=0, _arg4:Number=0){
            this.brightnessFrom = _arg3;
            this.brightnessTo = _arg4;
            this.initFilter();
            super(_arg1, _arg2);
        }
        protected function initFilter():void{
            bitmapFilter = new ColorMatrixFilter();
        }
        override protected function changeFilterByPercent(_arg1:Number):void{
            (bitmapFilter as ColorMatrixFilter).matrix = ColorUtil.getColorMatrixByBrightness((this.brightnessFrom + ((this.brightnessTo - this.brightnessFrom) * _arg1)));
            super.changeFilterByPercent(_arg1);
        }

    }
}//package custom_effect 
