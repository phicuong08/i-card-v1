//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
    import flash.display.*;
    import flash.geom.*;
    import custom_control1.*;

    public class ChatWindowBottomFrame extends Scale9Image {

        public static var img:Class = ChatWindowBottomFrame_img;

        public function ChatWindowBottomFrame(){
            var _local1:Bitmap = new img();
            var _local2:Rectangle = new Rectangle(41, 20, 2, 1);
            super(_local1.bitmapData, _local2);
        }
    }
}//package chat_system 
