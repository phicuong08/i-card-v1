//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class CommonHeadImageFrame extends Scale9Image {

        public static var img:Class = CommonHeadImageFrame_img;

        public function CommonHeadImageFrame(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(30, 30, 85, 86);
            super(_local1.bitmapData, _local2, false);
        }
    }
}//package ui_element 
