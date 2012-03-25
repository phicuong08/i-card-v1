//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.events.*;
    import spark.components.*;
    import mouse_keyboard_mgr.*;

    public class MyRichEditableText extends RichEditableText {

        public function MyRichEditableText(){
            this.addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler);
            this.addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler);
        }
        override public function get showSystemCursor():Boolean{
            return (false);
        }
        private function rollOverHandler(_arg1:MouseEvent):void{
            MouseMgr.getInstance().setCursor("input");
        }
        private function rollOutHandler(_arg1:MouseEvent):void{
            MouseMgr.getInstance().clearCursor("input");
        }

    }
}//package custom_control 
