//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task_guide.*;

    public class _task_guide_GuideGoalWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GuideGoalWindow.watcherSetupUtil = new (_task_guide_GuideGoalWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[6] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[9]], _arg2);
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[7] = new PropertyWatcher("tipFlowComplete", {propertyChange:true}, [_arg4[11]], _arg2);
            _arg5[4] = new PropertyWatcher("tipsComplete", {propertyChange:true}, [_arg4[7]], _arg2);
            _arg5[3] = new PropertyWatcher("tips", {propertyChange:true}, [_arg4[6]], _arg2);
            _arg5[2] = new PropertyWatcher("frameImg", {propertyChange:true}, [_arg4[3], _arg4[5]], _arg2);
            _arg5[6].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[7].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
