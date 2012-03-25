//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
    import flash.events.*;
    import normal_window.*;
    import flash.utils.*;
    import combat_element_script.*;

    public class TaskCompleteScript {

        public static function doTaskCompleteScript(_arg1:int, _arg2:Array):void{
            var _local3:* = TaskCompleteScript[("script" + _arg1)];
            if (_local3){
                _local3(_arg1, _arg2);
            } else {
                addFollowTaskWhenChangeState(_arg2);
            };
        }
        private static function addFollowTaskWhenChangeState(_arg1:Array):void{
            var stateChangeHandler:* = null;
            var followTask:* = _arg1;
            stateChangeHandler = function (_arg1:CustomStateChangeEvent):void{
                if (_arg1.newState != "loadingWindow"){
                    TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChangeHandler);
                    if (_arg1.newState != "loginWindow"){
                        addFollowTaskTimerLater(followTask);
                    };
                };
            };
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChangeHandler);
        }
        private static function addFollowTaskTimerLater(_arg1:Array, _arg2:Number=1000):void{
            var t:* = null;
            var timerHandler:* = null;
            var followTask:* = _arg1;
            var delay:int = _arg2;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                if (TCGClient.getInstance().customCurrentState != "loginWindow"){
                    TaskMgr.getInstance().addNewTask(followTask);
                };
            };
            t = new Timer(delay, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        private static function script1000(_arg1:int, _arg2:Array):void{
            TCGClient.getInstance().callLater(showSecnario120, [_arg2]);
        }
        private static function script150(_arg1:int, _arg2:Array):void{
            addFollowTaskTimerLater(_arg2);
        }
        public static function showSecnario120(_arg1:Array):void{
            if (!UserObject.isBeginnerGuideUser){
                new TaskScenario120(_arg1);
            };
        }

    }
}//package task 
