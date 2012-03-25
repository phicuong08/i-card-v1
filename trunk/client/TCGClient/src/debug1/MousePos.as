//Created by Action Script Viewer - http://www.buraks.com/asv
package debug1 {
    import flash.geom.*;
    import flash.events.*;
    import mx.controls.*;

    public class MousePos {

        private static var mouseShowWindow:Label;
        private static var lastXpos:Number;
        private static var lastYpos:Number;

        public static function autoShowHideMousePos():void{
            if (mouseShowWindow){
                hideMousePos();
            } else {
                showMousePos();
            };
        }
        private static function showMousePos():void{
            mouseShowWindow = new Label();
            mouseShowWindow.height = 40;
            mouseShowWindow.width = 200;
            TCGClient.getInstance().addElement(mouseShowWindow);
            mouseShowWindow.depth = 500;
            mouseShowWindow.mouseEnabled = false;
            mouseShowWindow.mouseChildren = false;
            mouseShowWindow.setStyle("color", 0xFF4200);
            mouseShowWindow.setStyle("fontSize", 14);
            TCGClient.getInstance().addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            TCGClient.getInstance().addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
            lastXpos = mouseShowWindow.x;
            lastYpos = mouseShowWindow.y;
        }
        private static function hideMousePos():void{
            TCGClient.getInstance().removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            TCGClient.getInstance().removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
            var _local1:* = mouseShowWindow.parent;
            if (_local1){
                _local1.removeElement(mouseShowWindow);
            };
            mouseShowWindow = null;
        }
        private static function mouseMoveHandler(_arg1:MouseEvent):void{
            mouseShowWindow.x = TCGClient.getInstance().mouseX;
            mouseShowWindow.y = TCGClient.getInstance().mouseY;
            mouseShowWindow.text = ((getMousePosText() + "\n") + getDistanceText());
        }
        private static function mouseWheelHandler(_arg1:MouseEvent):void{
            debugWindow.myTraceEx(((getMousePosText() + "\n") + getDistanceText()));
            lastXpos = TCGClient.getInstance().mainGroup.mouseX;
            lastYpos = TCGClient.getInstance().mainGroup.mouseY;
            getWindowUnderMouse();
        }
        private static function getMousePosText():String{
            return ((((("( " + int(TCGClient.getInstance().mainGroup.mouseX)) + " , ") + int(TCGClient.getInstance().mainGroup.mouseY)) + " )"));
        }
        private static function getDistanceText():String{
            return (((("xCg:" + int((TCGClient.getInstance().mainGroup.mouseX - lastXpos))) + " , yCg:") + int((TCGClient.getInstance().mainGroup.mouseY - lastYpos))));
        }
        private static function getWindowUnderMouse():void{
            var _local3:String;
            var _local1:Array = TCGClient.getInstance().mainGroup.getObjectsUnderPoint(new Point(TCGClient.getInstance().mouseX, TCGClient.getInstance().mouseY));
            var _local2:int;
            while (_local2 < _local1.length) {
                _local3 = _local1[_local2].toString();
                if (_local3.indexOf("[") != 0){
                    trace(_local3);
                };
                _local2++;
            };
        }

    }
}//package debug 
