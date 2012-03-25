//Created by Action Script Viewer - http://www.buraks.com/asv
package mouse_keyboard_mgr {
    import mx.managers.*;
    import flash.events.*;
    import normal_window.*;
    import flash.ui.*;

    public class MouseMgr extends EventDispatcher {

        private static var _instance:MouseMgr = new (MouseMgr)();
;
        private static var common:Class = MouseMgr_common;
        private static var drag:Class = MouseMgr_drag;
        private static var sword:Class = MouseMgr_sword;
        private static var input:Class = MouseMgr_input;

        private var cursorIdInfo:Object;
        private var mouseChangeFlag:Boolean = false;

        public function MouseMgr(){
            this.cursorIdInfo = new Object();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():MouseMgr{
            return (_instance);
        }

        public function init():void{
            this.resetMode();
        }
        public function resetMode():void{
            var _local1:int;
            this.mouseChangeFlag = GameOptionsWindnow.mouseChangeFlag;
            if (this.mouseChangeFlag){
                Mouse.hide();
                this.setCursor("common");
            } else {
                for each (_local1 in this.cursorIdInfo) {
                    CursorManager.removeCursor(_local1);
                };
                this.cursorIdInfo = new Object();
                Mouse.cursor = MouseCursor.ARROW;
                Mouse.cursor = MouseCursor.AUTO;
            };
        }
        public function setCursor(_arg1:String):void{
            if (this.mouseChangeFlag){
                this.setCustomCursor(_arg1);
            } else {
                this.setSystemCursor(_arg1);
            };
        }
        public function clearCursor(_arg1:String):void{
            if (this.mouseChangeFlag){
                this.clearCustomCursor(_arg1);
            } else {
                this.clearSystemCursor(_arg1);
            };
        }
        private function setCustomCursor(_arg1:String):void{
            var _local2:Class;
            var _local3:int;
            var _local4:Number;
            var _local5:Number;
            if (this.cursorIdInfo[_arg1]){
                return;
            };
            switch (_arg1){
                case "common":
                    _local2 = common;
                    _local3 = CursorManagerPriority.LOW;
                    _local4 = -2;
                    _local5 = -1;
                    break;
                case "sword":
                    _local2 = sword;
                    _local3 = CursorManagerPriority.HIGH;
                    _local4 = -1;
                    _local5 = -1;
                    break;
                case "drag":
                    _local2 = drag;
                    _local3 = CursorManagerPriority.MEDIUM;
                    _local4 = -5;
                    _local5 = -5;
                    break;
                case "input":
                    _local2 = input;
                    _local3 = CursorManagerPriority.MEDIUM;
                    _local4 = -6;
                    _local5 = -6;
                    break;
                default:
                    return;
            };
            this.cursorIdInfo[_arg1] = CursorManager.setCursor(_local2, _local3, _local4, _local5);
        }
        private function clearCustomCursor(_arg1:String):void{
            if (this.cursorIdInfo[_arg1]){
                CursorManager.removeCursor(this.cursorIdInfo[_arg1]);
                delete this.cursorIdInfo[_arg1];
            };
        }
        private function setSystemCursor(_arg1:String):void{
            switch (_arg1){
                case "common":
                    this.clearSystemCursor();
                    break;
                case "sword":
                    this.clearSystemCursor();
                    break;
                case "drag":
                    Mouse.cursor = MouseCursor.HAND;
                    break;
                case "input":
                    Mouse.cursor = MouseCursor.IBEAM;
                    break;
                default:
                    return;
            };
        }
        private function clearSystemCursor(_arg1:String=null):void{
            Mouse.cursor = MouseCursor.AUTO;
        }

    }
}//package mouse_keyboard_mgr 
