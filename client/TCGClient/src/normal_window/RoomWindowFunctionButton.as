//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import flash.events.*;
    import custom_control1.*;
    import source_manager.*;

    public class RoomWindowFunctionButton extends UniversalImageButton {

        private static var _skinParts_:Object = {labelDisplay:false};

        override protected function setAllImage():void{
            if (RoomWindowSourceMgr.getInstance().loadingComplete){
                this.setImg(null);
            } else {
                RoomWindowSourceMgr.getInstance().addEventListener(Event.COMPLETE, this.setImg);
            };
        }
        private function setImg(_arg1:Event):void{
            RoomWindowSourceMgr.getInstance().removeEventListener(Event.COMPLETE, this.setImg);
            setStyle("upImage", RoomWindowSourceMgr.getInstance().getSourceClass("button_up"));
            setStyle("downImage", RoomWindowSourceMgr.getInstance().getSourceClass("button_down"));
            setStyle("glowImage", RoomWindowSourceMgr.getInstance().getSourceClass("button_glow"));
        }
//        override protected function get skinParts():Object{
//            return (_skinParts);
//        }

    }
}//package normal_window 
