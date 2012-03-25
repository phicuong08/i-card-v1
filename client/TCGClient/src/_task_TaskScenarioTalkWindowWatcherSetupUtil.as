//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task.*;

    public class _task_TaskScenarioTalkWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            TaskScenarioTalkWindow.watcherSetupUtil = new (_task_TaskScenarioTalkWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[2] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[1] = new PropertyWatcher("headNameText", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[0] = new PropertyWatcher("headPath", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[2].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
