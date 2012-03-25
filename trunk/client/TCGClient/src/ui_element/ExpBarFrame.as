//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class ExpBarFrame extends Scale9Image {

        private static var img:Class = ExpBarFrame_img;

        public function ExpBarFrame(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(15, 9, 19, 2);
            super(_local1.bitmapData, _local2);
        }
    }
}//package ui_element 
