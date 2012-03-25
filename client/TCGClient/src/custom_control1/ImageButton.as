//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1{
    import spark.components.*;
    import skins.*;

    public class ImageButton extends Button {

        private static var _skinParts_:Object = {labelDisplay:false};

        public function ImageButton(){
            this.setSkin();
        }
        protected function setSkin():void{
            setStyle("skinClass", imageButtonSkin);
        }
        public function set upImage(_arg1:Object):void{
            setStyle("upImage", _arg1);
        }
        public function set overImage(_arg1:Object):void{
            setStyle("overImage", _arg1);
        }
        public function set downImage(_arg1:Object):void{
            setStyle("downImage", _arg1);
        }
        public function set disableImage(_arg1:Object):void{
            setStyle("disabledImage", _arg1);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package custom_control 
