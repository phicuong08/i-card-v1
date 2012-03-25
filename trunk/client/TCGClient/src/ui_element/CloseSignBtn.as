//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import custom_control1.*;

    public class CloseSignBtn extends ImageButton {

        private static var upImg:Class = CloseSignBtn_upImg;
        private static var downImg:Class = CloseSignBtn_downImg;
        private static var overImg:Class = CloseSignBtn_overImg;
        private static var _skinParts_:Object = {labelDisplay:false};

        public function CloseSignBtn(){
            this.setAllImage();
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
