//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import spark.components.*;
    import skins.*;

    public class ClickScaleButton extends Button {

        private static var _skinParts_:Object = {labelDisplay:false};
		public var __slot1;
        public function ClickScaleButton(){
            this.setSkin();
        }
        protected function setSkin():void{
            setStyle("skinClass", ClickScaleButtonSkin);
        }
        public function set buttonImage(_arg1:Object):void{
            setStyle("buttonImage", _arg1);
        }
        public function set scaleArg(_arg1:Number):void{
            setStyle("scaleArg", _arg1);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package ui_element 
