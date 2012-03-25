//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class MetalFrame extends Scale9Image {

        public static var img:Class = MetalFrame_img;
        public static var imgInner:Class = MetalFrame_imgInner;

        public function MetalFrame(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(56, 56, 86, 96);
            super(_local1.bitmapData, _local2, false);
        }
        override protected function buildImage():void{
            if (((!((width == 0))) && (!((height == 0))))){
                while (this.numChildren > 0) {
                    this.removeChildAt(0);
                };
                this.graphics.clear();
                this.drawInnerFrame();
                drawGraphicsImage();
                copyGraphicsImageAsBitmap();
                this.graphics.clear();
            };
        }
        protected function drawInnerFrame():void{
            var _local1:BitmapData = (new imgInner() as Bitmap).bitmapData;
            var _local2:Matrix = new Matrix();
            _local2.tx = 34;
            _local2.ty = 34;
            this.graphics.beginBitmapFill(_local1, _local2, true, true);
            this.graphics.drawRect(_local2.tx, _local2.ty, (((4 + width) - imageSource.width) + 126), (((4 + height) - imageSource.height) + 136));
        }

    }
}//package ui_element 
