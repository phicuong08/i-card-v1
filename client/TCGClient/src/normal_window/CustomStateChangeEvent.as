//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import flash.events.*;

    public class CustomStateChangeEvent extends Event {

        public static const CURRENT_STATE_CHANGE:String = "状态变更";

        public var newState:String;
        public var oldState:String;

        public function CustomStateChangeEvent(_arg1:String, _arg2:String, _arg3:Boolean=false, _arg4:Boolean=false){
            this.newState = _arg1;
            this.oldState = _arg2;
            super(CURRENT_STATE_CHANGE, _arg3, _arg4);
        }
    }
}//package normal_window 
