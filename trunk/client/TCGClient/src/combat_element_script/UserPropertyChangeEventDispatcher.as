//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import flash.utils.*;

    public class UserPropertyChangeEventDispatcher extends EventDispatcher {

        public static const ALL_CARD_CHANGED:String = "all_card_changed";
        public static const MONEY_CHANGED:String = "money_changed";
        public static const SCORE_CHANGED:String = "score_changed";
        public static const LEVEL_CHANGED:String = "level_changed";
        public static const WIN_LOSE_ESCAPE_DUEL_CHANGED:String = "win_lose_escape_duel_changed";

        private static var _instance:UserPropertyChangeEventDispatcher = new (UserPropertyChangeEventDispatcher)();
;

        private var eventStateInfo:Object;
        private var dispatchEventDelayTime:int = 200;

        public function UserPropertyChangeEventDispatcher(_arg1:IEventDispatcher=null){
            this.eventStateInfo = new Object();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():UserPropertyChangeEventDispatcher{
            return (_instance);
        }

        public function userInfoChanged(_arg1:String):void{
            var t:* = null;
            var timerHandler:* = null;
            var eventName:* = _arg1;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                dispatchEvent(new Event(eventName));
                delete eventStateInfo[eventName];
            };
            if (this.eventStateInfo[eventName]){
                return;
            };
            this.eventStateInfo[eventName] = true;
            t = new Timer(this.dispatchEventDelayTime, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }

    }
}//package combat_element_script 
