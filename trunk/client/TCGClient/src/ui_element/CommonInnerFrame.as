//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class CommonInnerFrame extends Scale9Image {

        public static var img:Class = CommonInnerFrame_img;

        public function CommonInnerFrame(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(21, 21, 1, 1);
            super(_local1.bitmapData, _local2);
        }
    }
}//package ui_element 
