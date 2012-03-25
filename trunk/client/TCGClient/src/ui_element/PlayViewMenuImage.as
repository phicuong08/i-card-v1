//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class PlayViewMenuImage extends Scale9Image {

        public static var img:Class = PlayViewMenuImage_img;

        public function PlayViewMenuImage(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(41, 55, 2, 2);
            super(_local1.bitmapData, _local2);
        }
    }
}//package ui_element 
