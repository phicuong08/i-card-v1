//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class CommonHeadImageFrameDown extends Scale9Image {

        public static var img:Class = CommonHeadImageFrameDown_img;

        public function CommonHeadImageFrameDown(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(30, 5, 74, 9);
            super(_local1.bitmapData, _local2, true);
        }
    }
}//package ui_element 
