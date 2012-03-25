//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class TalkWindowImage extends Scale9Image {

        public static var img:Class = TalkWindowImage_img;

        public function TalkWindowImage(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(50, 50, 499, 29);
            super(_local1.bitmapData, _local2);
        }
    }
}//package ui_element 
