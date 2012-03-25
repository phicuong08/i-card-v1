//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class DataGridTitleButtonImage extends Scale9Image {

        public static var img:Class = DataGridTitleButtonImage_img;

        public function DataGridTitleButtonImage(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(20, 9, 5, 3);
            super(_local1.bitmapData, _local2);
        }
    }
}//package ui_element 
