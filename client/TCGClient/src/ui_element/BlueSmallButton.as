//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import custom_control1.*;

    public class BlueSmallButton extends ImageButton {

        private static var upImg:Class = BlueSmallButton_upImg;
        private static var downImg:Class = BlueSmallButton_downImg;
        private static var overImg:Class = BlueSmallButton_overImg;
        private static var _skinParts_:Object = {labelDisplay:false};

        public function BlueSmallButton(){
            this.setAllImage();
            setStyle("color", 12039317);
            setStyle("fontSize", 14);
            setStyle("fontFamily", "宋体");
            setStyle("userColorMatrixFilter", true);
            height = 26;
        }
        protected function setAllImage():void{
            setStyle("upImage", upImg);
            setStyle("downImage", downImg);
            setStyle("overImage", overImg);
            setStyle("disabledImage", upImg);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts);
//        }

    }
}//package ui_element 
