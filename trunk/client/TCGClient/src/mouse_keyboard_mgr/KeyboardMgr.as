//Created by Action Script Viewer - http://www.buraks.com/asv
package mouse_keyboard_mgr {
    import flash.display.*;
    import flash.events.*;

    public class KeyboardMgr extends EventDispatcher {

        private static var _instance:KeyboardMgr = new (KeyboardMgr)();
;

        protected var stage:Stage;
        protected var focusOb:InteractiveObject;

        public function KeyboardMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():KeyboardMgr{
            return (_instance);
        }

        public function init(_arg1:Stage):void{
            this.stage = _arg1;
            this.addFocusKeyboardListener(null);
            _arg1.addEventListener(FocusEvent.FOCUS_IN, this.stageFocusInHandler);
        }
        protected function stageFocusInHandler(_arg1:FocusEvent):void{
            this.addFocusKeyboardListener(this.stage.focus);
        }
        protected function addFocusKeyboardListener(_arg1:InteractiveObject):void{
            if (!_arg1){
                _arg1 = this.stage;
            };
            if (this.focusOb){
                this.focusOb.removeEventListener(KeyboardEvent.KEY_DOWN, this.focusKeyEventHandler, false);
                this.focusOb.removeEventListener(KeyboardEvent.KEY_UP, this.focusKeyEventHandler, false);
            };
            this.focusOb = _arg1;
            this.focusOb.addEventListener(KeyboardEvent.KEY_DOWN, this.focusKeyEventHandler, false, 0xFF);
            this.focusOb.addEventListener(KeyboardEvent.KEY_UP, this.focusKeyEventHandler, false, 0xFF);
        }
        protected function focusKeyEventHandler(_arg1:KeyboardEvent):void{
            dispatchEvent(_arg1);
        }

    }
}//package mouse_keyboard_mgr 
