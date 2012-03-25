//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
//    import flash.events.*;
    import spark.components.*;
    import SoundSystem.*;
    import skins.*;

    public class UniversalImageButton extends Button {

        private static var upImg:Class = UniversalImageButton_upImg;
        private static var downImg:Class = UniversalImageButton_downImg;
        private static var glowImg:Class = UniversalImageButton_glowImg;
        private static var _skinParts_:Object = {labelDisplay:false};

        public function UniversalImageButton(){
            var clickHandler:* = null;
            clickHandler = function ():void{
                var _local1:String = getStyle("sound");
                if (!_local1){
                    _local1 = "click_2";
                };
                SoundMgr.getInstance().playEffectSound(_local1);
            };
            super();
            this.setSkin();
            this.setAllImage();
            setStyle("btnScale", 1);
 //           addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
        }
        protected function setSkin():void{
            setStyle("skinClass", universalImageButtonSkin);
        }
        public function set labelImage(_arg1:Object):void{
            setStyle("labelImage", _arg1);
        }
        public function set btnScale(_arg1:Number):void{
            setStyle("btnScale", _arg1);
        }
        protected function setAllImage():void{
            width = 160;
            height = 44;
            setStyle("upImage", upImg);
            setStyle("downImage", downImg);
            setStyle("glowImage", glowImg);
        }
		
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }


    }
}//package custom_control 
