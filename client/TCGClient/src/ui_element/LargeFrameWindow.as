//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class LargeFrameWindow extends Scale9Image {

        public static var img:Class = LargeFrameWindow_img;

        public function LargeFrameWindow(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(78, 61, 48, 19);
            super(_local1.bitmapData, _local2, false);
        }
    }
}//package ui_element 
