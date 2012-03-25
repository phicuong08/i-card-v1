//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.events.*;
    import flash.events.*;

    public class AutoDepthGroup extends SuperDragGroup {

        private static const commonDepth:int = 20;
        private static const focusDepth:int = 25;

        private static var lastFocusGroup:AutoDepthGroup;

        public function AutoDepthGroup(){
            this.addEventListener(FlexEvent.ADD, this.addHandler);
            this.addEventListener(FlexEvent.REMOVE, this.removeHandler);
            this.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
        }
        private static function setFocusGroupDepth(_arg1:AutoDepthGroup):void{
            clearFocusGroupDepth();
            _arg1.depth = focusDepth;
            lastFocusGroup = _arg1;
        }
        private static function clearFocusGroupDepth():void{
            if (lastFocusGroup){
                lastFocusGroup.depth = 20;
            };
            lastFocusGroup = null;
        }

        private function addHandler(_arg1:FlexEvent):void{
            setFocusGroupDepth(this);
        }
        private function removeHandler(_arg1:FlexEvent):void{
            if (lastFocusGroup == this){
                lastFocusGroup = null;
            };
        }
        private function mouseDownHandler(_arg1:MouseEvent):void{
            setFocusGroupDepth(this);
        }

    }
}//package custom_control 
